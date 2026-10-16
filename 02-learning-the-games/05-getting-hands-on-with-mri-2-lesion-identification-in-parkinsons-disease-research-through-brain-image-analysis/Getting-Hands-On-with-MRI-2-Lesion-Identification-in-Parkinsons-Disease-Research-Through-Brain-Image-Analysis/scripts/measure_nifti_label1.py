#!/usr/bin/env python3
"""Count voxels with value 1 in a NIfTI-1 image.

This intentionally uses only Python's standard library so students do not need
extra neuroimaging packages just to complete the game.
"""

import gzip
import math
import struct
import sys


DTYPES = {
    2: ("B", 1),
    4: ("h", 2),
    8: ("i", 4),
    16: ("f", 4),
    64: ("d", 8),
    256: ("b", 1),
    512: ("H", 2),
    768: ("I", 4),
    1024: ("q", 8),
    1280: ("Q", 8),
}


def read_bytes(path):
    if path.endswith(".gz"):
        with gzip.open(path, "rb") as handle:
            return handle.read()
    with open(path, "rb") as handle:
        return handle.read()


def unpack_one(fmt, data, offset):
    return struct.unpack(fmt, data[offset : offset + struct.calcsize(fmt)])[0]


def main():
    if len(sys.argv) != 2:
        print("Usage: python3 scripts/measure_nifti_label1.py lesion_mask.nii.gz", file=sys.stderr)
        return 2

    path = sys.argv[1]
    data = read_bytes(path)

    if len(data) < 352:
        print("File is too small to be a NIfTI-1 image.", file=sys.stderr)
        return 1

    sizeof_hdr_le = unpack_one("<i", data, 0)
    sizeof_hdr_be = unpack_one(">i", data, 0)
    if sizeof_hdr_le == 348:
        endian = "<"
    elif sizeof_hdr_be == 348:
        endian = ">"
    else:
        print("Could not read NIfTI header. Expected sizeof_hdr=348.", file=sys.stderr)
        return 1

    if data[344:348] != b"n+1\x00":
        raise ValueError("Expected a single-file NIfTI-1 (.nii or .nii.gz) image.")

    dims = struct.unpack(endian + "8h", data[40:56])
    ndim = dims[0]
    if not 3 <= ndim <= 7 or any(d <= 0 for d in dims[1:ndim + 1]):
        raise ValueError("Invalid NIfTI dimensions; a 3D mask is required.")
    if any(d != 1 for d in dims[4:ndim + 1]):
        raise ValueError("Expected one 3D mask, not multiple volumes.")
    voxel_count = math.prod(dims[1:4])

    datatype = unpack_one(endian + "h", data, 70)
    if datatype not in DTYPES:
        print(f"Unsupported NIfTI datatype: {datatype}", file=sys.stderr)
        return 1

    code, size = DTYPES[datatype]
    if unpack_one(endian + "h", data, 72) != size * 8:
        raise ValueError("NIfTI datatype and bitpix disagree.")
    pixdim = struct.unpack(endian + "8f", data[76:108])
    if any(not math.isfinite(x) or x <= 0 for x in pixdim[1:4]):
        raise ValueError("Voxel dimensions must be finite and positive.")
    spatial_unit = data[123] & 7
    # NIfTI spatial units: metres, millimetres, micrometres.
    mm_factor = {1: 1000.0, 2: 1.0, 3: 0.001}.get(spatial_unit)
    voxel_volume = (math.prod(pixdim[1:4]) * mm_factor ** 3
                    if mm_factor is not None else None)
    if spatial_unit not in (0, 1, 2, 3):
        raise ValueError("Unsupported spatial unit code.")
    if spatial_unit == 0:
        print("Spatial units are unspecified; volume in mm3 is NA.", file=sys.stderr)
    raw_offset = unpack_one(endian + "f", data, 108)
    if not math.isfinite(raw_offset) or raw_offset < 352 or not raw_offset.is_integer():
        raise ValueError("Invalid NIfTI image-data offset.")
    vox_offset = int(raw_offset)
    slope = unpack_one(endian + "f", data, 112)
    intercept = unpack_one(endian + "f", data, 116)
    if slope == 0 or not math.isfinite(slope):
        slope, intercept = 1.0, 0.0
    elif not math.isfinite(intercept):
        raise ValueError("Invalid NIfTI scaling intercept.")
    needed = vox_offset + voxel_count * size
    if len(data) < needed:
        print("Image data ended before all voxels could be read.", file=sys.stderr)
        return 1

    count = 0
    fmt = endian + code
    for idx in range(voxel_count):
        value = unpack_one(fmt, data, vox_offset + idx * size)
        value = value * slope + intercept
        if not math.isfinite(value):
            raise ValueError("Mask contains non-finite voxel values.")
        if abs(value - 1.0) < 1e-6:
            count += 1

    volume = f"{count * voxel_volume:.6f}" if voxel_volume is not None else "NA"
    print(f"{count},{volume}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, EOFError, ValueError, struct.error) as error:
        print(f"Cannot measure mask: {error}", file=sys.stderr)
        raise SystemExit(1)

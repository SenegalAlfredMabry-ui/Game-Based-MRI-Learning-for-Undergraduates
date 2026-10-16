# Getting Hands-On with MRI #2: Lesion Identification in Parkinson’s Disease Research Through Brain Image Analysis
==========================================================================================================================


Welcome to the capstone game.

In this game, you combine the skills from the earlier games:

Learning Unix Basics in a Virtual House:
    pwd, ls, cd, cat, and finding your way around folders

Learning Bash Scripting by Sorting a Wine Shed:
    nano, bash scripts, variables, loops, and repeated actions

Learning Remote Computing in a Virtual Laundromat:
    input folders, output folders, batch processing, and checking results

Getting Hands-On with MRI #1: Converting DICOM to NIfTI:
    DICOM-to-NIfTI conversion with dcm2niix

Now you will put those skills together in a small neuroimaging workflow.


The story
---------

You are working in a brain image review lab.

There are six teaching subjects:

    sub-PD01
    sub-PD02
    sub-PD03
    sub-CON01
    sub-CON02
    sub-CON03

Each subject has two scan types:

    MPRAGE
    FLAIR

Your job is to:

1. Find the study folders.
2. Convert MPRAGE and FLAIR DICOM folders into NIfTI images.
3. Open each subject's FLAIR and MPRAGE in ITK-SNAP.
4. Review the scans before marking anything.
5. Create a new lesion mask.
6. Paint lesion-like hyperintensities on the FLAIR image.
7. Save one lesion mask for each subject.
8. Run the included script to measure the lesion masks.
9. Compare lesion burden in the PD and control groups.


Two-part structure
------------------

This is one game, but it is designed to be completed in two parts.

Part A: From folders to viewable brain images
    Goal: get from the study folder to converted images that can open in
    ITK-SNAP.

    Complete:
        Part 0 - Before You Start
        Part 1 - Find the Study
        Part 2 - Write the Conversion Script
        Part 3 - Open in ITK-SNAP

    Stop point:
        You should be able to open a subject's FLAIR and MPRAGE images in
        ITK-SNAP and explain what each image is for.

Part B: From image inspection to a small analysis
    Goal: create lesion masks, measure them, and compare PD/control groups.

    Complete:
        Part 4 - Paint Lesion Masks
        Part 5 - Measure and Compare
        Part 6 - Reset and Cheatsheet

    Stop point:
        You should have saved lesion mask files, generated
        results/lesion_voxel_counts.csv, and read results/group_comparison.txt.


Important wording
-----------------

In this game, we say:

    lesion-like hyperintensities

We are not diagnosing lesions.
We are practicing image inspection, manual annotation, measurement, and group comparison.


Software
--------

This version uses only:

    dcm2niix
    ITK-SNAP
    python3

If dcm2niix, ITK-SNAP, or python3 is missing, read:

    cat SOFTWARE_SETUP.txt


Data status
-----------

This package includes raw DICOM ZIP files for all six teaching subjects.
Each subject has:

    MPRAGE_DICOM.zip
    FLAIR_DICOM.zip

After students unzip the main game folder, they should unpack the internal DICOM
ZIPs before conversion:

    bash scripts/unpack_dicoms.sh

After unpacking, each subject should have:

    200 MPRAGE DICOM files in MPRAGE_DICOM
    44 FLAIR DICOM files in FLAIR_DICOM

The source mapping is recorded in:

    raw_dicoms/DATA_MANIFEST.txt

Students still need to run the DICOM-to-NIfTI conversion step before opening the
images as NIfTI files in ITK-SNAP.


Start here
----------

Read these files in order:

Part A:
0. instructions/Part_0_Before_You_Start.txt
1. instructions/Part_1_Find_The_Study.txt
2. instructions/Part_2_Write_Conversion_Script.txt
3. instructions/Part_3_Open_In_ITK_SNAP.txt

Part B:
4. instructions/Part_4_Paint_Lesion_Masks.txt
5. instructions/Part_5_Measure_And_Compare.txt
6. instructions/Part_6_Reset_and_Cheatsheet.txt

It is also useful to read:

    cat FAQ.txt


Reflection rhythm
-----------------

After each part, pause and answer the matching notes file in nano:

    Part 0: student_notes/part0_setup_reflection.txt
    Part 1: student_notes/part1_find_study_reflection.txt
    Part 2: student_notes/part2_conversion_reflection.txt
    Part 3: student_notes/part3_itksnap_reflection.txt
    Part 4: student_notes/part4_masking_reflection.txt
    Part 5: student_notes/part5_measure_compare_reflection.txt

These are short on purpose. The goal is to write down what just happened before
the next technical step changes the problem.

# Getting Hands-On with MRI #1: Converting DICOM to NIfTI


Welcome to the Getting Hands-On with MRI #1: Converting DICOM to NIfTI.

This game teaches one of the first real transformations in MRI analysis:

    DICOM folder -> NIfTI image + JSON metadata

Important wording:

    DICOM to NIfTI = the workflow
    dcm2niix      = the command-line tool

The terminal command is spelled:

    dcm2niix

It has two i's at the end. Commands such as DICOM2NIfTI, DICOM2Nifit, or
dicom2nifti will not work unless a different program with that exact name has
been installed.

Two-part structure
------------------

Part 1: Packages, MRIcron GUI conversion, and image review
    Goal: install/check the needed tools, unpack the DICOM folders, convert the
    scans with MRIcron, review MPRAGE and FLAIR separately, then overlay FLAIR
    on MPRAGE.

    Output folder students create:
        gui_niftis/

    Expected GUI output names after students rename them:
        gui_niftis/sub-001_MPRAGE_GUI.nii.gz
        gui_niftis/sub-001_FLAIR_GUI.nii.gz

Part 2: Command-line conversion and scripting
    Goal: build a short script with dcm2niix, understand each piece of the code,
    create the script output folder, convert the scans, and review the scripted
    NIfTI outputs with the same contrast/overlay process.

    Output folder students create:
        script_niftis/

    Expected script output names:
        script_niftis/sub-001_MPRAGE.nii.gz
        script_niftis/sub-001_MPRAGE.json
        script_niftis/sub-001_FLAIR.nii.gz
        script_niftis/sub-001_FLAIR.json

Start here:

    cat instructions/Part_1_Packages_MRIcron_GUI_Review.txt

Then continue with:

    cat instructions/Part_2_Command_Line_DICOM_to_NIfTI_Script.txt

Keep notes in:

    student_notes/conversion_questions.txt

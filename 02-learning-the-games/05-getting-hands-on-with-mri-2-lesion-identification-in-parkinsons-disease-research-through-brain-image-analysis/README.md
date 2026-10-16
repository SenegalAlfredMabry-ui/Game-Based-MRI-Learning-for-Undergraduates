# Getting Hands-On with MRI #2: Lesion Identification in Parkinson’s Disease Research Through Brain Image Analysis

[All lessons](../README.md) · [Getting started](../getting-started.md) · [Instructional videos](videos.md) · [Student reflections](reflection-gallery.md) · [Troubleshooting](troubleshooting.md)

## Learning objectives

By the end of this lesson, you should be able to carry a small teaching dataset through scan conversion, image inspection, manual annotation, and a descriptive group comparison. You will save masks, measure the voxels you marked, and check that each result belongs to the intended subject. This connects the earlier computing skills to an imaging research question and introduces the judgment needed to interpret outputs responsibly.

## The challenge

The final lesson brings together the skills you have practiced throughout the curriculum. You will work with scans from six teaching subjects: three in the Parkinson’s disease group and three controls. MPRAGE provides a T1-weighted anatomical image for inspecting brain structure. FLAIR suppresses cerebrospinal fluid signal and helps reveal bright tissue abnormalities, including white matter hyperintensities. First prepare images you can inspect; then mark candidate regions, save masks, measure the marked voxels, and examine the group comparison.

Parkinson’s disease is the second most common neurodegenerative disorder after Alzheimer’s disease, and its global burden is growing rapidly [1, 2]. In addition to movement symptoms, people can experience changes in cognition. MRI studies have linked a greater burden of white matter hyperintensities with cognitive decline in some people with Parkinson’s disease [3]. This provides a research context for learning to inspect and measure bright regions on FLAIR images. These regions can have several causes; the marks and six-subject summaries in this exercise do not establish a diagnosis or a Parkinson’s-specific imaging marker.

## Sources for the research context

[1] NIEHS. Parkinson’s Disease. https://www.niehs.nih.gov/health/topics/conditions/parkinson

[2] World Health Organization. Parkinson disease. 2023. https://www.who.int/news-room/fact-sheets/detail/parkinson-disease

[3] Chahine et al. Modifiable vascular risk factors, white matter disease and cognition in early Parkinson’s disease. European Journal of Neurology, 2019. https://pubmed.ncbi.nlm.nih.gov/30169897/

## Download and open this lesson

[Download the lesson ZIP](https://github.com/SenegalAlfredMabry-ui/Game-Based-MRI-Learning-for-Undergraduates/releases/download/v0.1.0/Getting-Hands-On-with-MRI-2-Lesion-Identification-in-Parkinsons-Disease-Research-Through-Brain-Image-Analysis.zip) · [Browse the game files](Getting-Hands-On-with-MRI-2-Lesion-Identification-in-Parkinsons-Disease-Research-Through-Brain-Image-Analysis/)

Read `README.txt` and follow the numbered instruction files.

Screenshots and recordings may show earlier folder names. Use the folder names and commands in the current written instructions.

## Before you start

Check dcm2niix, ITK-SNAP, Python 3, and unzip. Read SOFTWARE_SETUP.txt and Part_0_Before_You_Start.txt. Locate raw_dicoms, converted_niftis, lesion_masks, results, subject_groups.csv, scripts, and student_notes.

[Open the lesson reference sheet](../../assets/figures/Getting-Hands-On-with-MRI-2-Lesion-Identification-in-Parkinsons-Disease-Research-Through-Brain-Image-Analysis-Reference-Sheet.png) · [Download a printable PDF](../../assets/figures/Getting-Hands-On-with-MRI-2-Lesion-Identification-in-Parkinsons-Disease-Research-Through-Brain-Image-Analysis-Reference-Sheet.pdf)

## Part A Find and convert the scans

Read Part_1_Find_The_Study.txt. Identify each subject’s MPRAGE and FLAIR archives. Run bash scripts/unpack_dicoms.sh as directed. After unpacking, the capstone expects 200 MPRAGE DICOM files and 44 FLAIR DICOM files per subject.

Complete the conversion exercise in Part_2_Write_Conversion_Script.txt. Check subject IDs, input directories, output names, and conversion results. Use the supplied check before continuing.

## Part A Inspect the images

Follow Part_3_Open_In_ITK_SNAP.txt. Open a subject’s FLAIR and MPRAGE images, inspect the three viewing planes, adjust contrast, and check that the images belong to the same subject. Pause here until you can explain which image you are viewing and why.

## Part B Create and save masks

Follow Part_4_Paint_Lesion_Masks.txt. Create a segmentation, select label 1, and use the painting tools to mark candidate regions. Inspect your work across more than one plane. Save one mask for each subject in lesion_masks using the required naming convention.

A saved mask with zero marked voxels differs from a missing mask. Record annotation decisions and preserve the masks you intend to measure.

## Part B Measure and compare

Follow Part_5_Measure_And_Compare.txt. Run the measurement script, inspect results/lesion_voxel_counts.csv, and resolve missing or ambiguous mask files. Check each subject and status before interpreting results/group_comparison.txt.

Voxel count describes how many voxels were marked. Physical volume also depends on voxel dimensions and valid spatial units. Treat unavailable or unverified volume values as unavailable. Do not replace missing measurements with zero or interpret an incomplete comparison as a final result.

## What to keep

Save masks, conversion scripts, measurement outputs, comparison output, and reflection notes. Record the software and lesson version used. Read Part_6_Reset_and_Cheatsheet.txt before resetting any work.

## Common Challenges

Tiffany — Software setup and image review — 2:51.

Tiffany answers practical questions about obtaining dcm2niix and ITK-SNAP, opening corresponding FLAIR and MPRAGE images, and adjusting contrast to inspect bright regions more clearly.

Student reflection videos for this lesson are coming soon.

Actions: Watch Tiffany’s Q&A; Read the transcript; Prepare your reflection video.

## Continue learning

Review the instructor discussion of annotation consistency, image quality, and measurement units. Use the software references to explore the tools further and discuss the limits of the teaching exercise with your instructor.

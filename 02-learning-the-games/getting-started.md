# Getting started

## What you will need

You will need a computer with a folder where you can save and change files, a Terminal that can run Bash, a text editor, and enough storage for the extracted lessons and their outputs. Lessons 1, 2, and 4 introduce computing through ordinary files. Lessons 3 and 5 also require neuroimaging tools. The learning index lists the full lesson titles and the software guide explains the tools used in each.

Keep the original downloads so you can recover a clean copy of a lesson. Save your notes and completed scripts outside any folder you intend to reset.

## Choose your setup

On macOS, use Terminal and follow the software guide for the tools needed by your lesson. On Linux, use a terminal with Bash and the corresponding software packages. Windows users can use a Linux environment through WSL for Bash exercises; image-viewer installation and access to files require additional setup.

## Download and unpack a lesson

Download the lesson package from its lesson page. Extract it before running commands. Check the extracted folder name and open it in your file browser. Lesson 1 and Lesson 2 include setup scripts that create their game folders; follow the lesson’s setup directions.

Some MRI lessons contain DICOM ZIP files inside the main download. Extracting the main lesson does not automatically unpack these scan archives. Follow the lesson’s unpacking step before conversion.

## Open Terminal and find your folder

Use pwd to print your current location and ls to list its contents. Use cd followed by a folder path to move into that folder. Put quotation marks around a path containing spaces. Use cd .. to move up one directory. Before running a command from a lesson, check that the expected input files are visible from your current location. If these commands are unfamiliar, watch the Introduction and Setup video for Lesson 1 alongside this guide. Pause the recording after each step and try it in your own lesson folder before continuing.

## Read and edit text

Use cat followed by a filename to read a short text file. Use nano followed by a filename to edit it. In nano, save with Control O, confirm the filename, and exit with Control X. Read a script before running it and identify which files it reads or changes.

## Check your tools

Run bash --version to check Bash. For the capstone, run python3 --version. For MRI conversion, check that dcm2niix is installed and available in Terminal. Launch the required image viewer separately to confirm that it opens.

Lesson 3 uses MRIcron, a program for viewing brain images, alongside the conversion workflow described in its instructions. Lesson 5 uses ITK-SNAP, a program for viewing images and creating manual segmentations. Follow each lesson’s software instructions so the tools match the task.

## When a command fails

Read the complete message before trying again. Check your location with pwd, inspect filenames with ls, and compare spelling, capitalization, quotation marks, and spaces with the instructions. If Terminal says a command was not found, check whether the program is installed and available on your PATH.

A conversion may take time. Look for progress or a completion message, then inspect the expected output folder. Repeatedly starting the same command can make it harder to tell which run produced an output.

## Ready to begin

You are ready for Lesson 1 when you can open Terminal, find the downloaded lesson, list its files, and read a text file. Keep the lesson instructions open beside Terminal. Start with Lesson 1.

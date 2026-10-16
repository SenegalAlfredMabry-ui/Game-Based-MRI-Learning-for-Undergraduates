Learning Remote Computing in a Virtual Laundromat
=======================================

Welcome to the Learning Remote Computing in a Virtual Laundromat.

This game teaches local processing, automation, remote-computing ideas, and
batch-job thinking before students work with real MRI data.

The story:
Your local washer can handle a few dirty items, but research data quickly becomes
too large and repetitive for manual work. The PI Laundromat is a fake remote
server where you can practice the logic of ssh, scp, scripts, jobs, logs, and
output checking.

Important note about the images:
The clothing images are regular PNG teaching images. They are not NIfTI files
and they are not meant to open in MRIcron or MRIcroGL. The Getting Hands-On with MRI #1: Converting DICOM to NIfTI
is where students learn real MRI image formats.

Before you start:

    cd Learning-Remote-Computing-in-a-Virtual-Laundromat
    pwd
    ls
    cat FAQ.txt
    cat instructions/Part_0_Before_You_Start.txt

Read these files in order:

0. Part 0 - Before You Start
   instructions/Part_0_Before_You_Start.txt

1. Round 1 — Local Washer
   instructions/Round_1_Local_Washer.txt

2. Round 2 — Too Much Laundry
   instructions/Round_2_Too_Much_Laundry.txt

3. Round 3 — Robot Washer Loop
   instructions/Round_3_Robot_Washer_Loop.txt

4. Round 4 — PI Laundromat
   instructions/Round_4_PI_Laundromat.txt

5. Round 5 — Laundry Cluster Job
   instructions/Round_5_Laundry_Cluster_Job.txt

6. Reset and Cheatsheet
   instructions/Part_6_Reset_and_Cheatsheet.txt

How help works
--------------

The main round instructions are now written as guided challenges. They tell you
what you are trying to do, which folders matter, and which command ideas to use,
but they do not always give the full command immediately.

If you try a step and get stuck, use the matching stuck instructions:

    instructions/stuck_instructions/README_STUCK_INSTRUCTIONS.txt
    instructions/stuck_instructions/Round_1_Local_Washer_STUCK.txt
    instructions/stuck_instructions/Round_2_Too_Much_Laundry_STUCK.txt
    instructions/stuck_instructions/Round_3_Robot_Washer_Loop_STUCK.txt
    instructions/stuck_instructions/Round_4_PI_Laundromat_STUCK.txt
    instructions/stuck_instructions/Round_5_Laundry_Cluster_Job_STUCK.txt

Try the guided version first. Use the stuck file when you need it, then write
down what kind of help you needed in the reflection file.

Universal reflection questions live in:

    student_notes/universal_reflection_questions.txt

Round-specific reflection files live in:

    student_notes/round1_reflection.txt
    student_notes/round2_reflection.txt
    student_notes/round3_reflection.txt
    student_notes/round4_reflection.txt
    student_notes/round5_reflection.txt

Open the matching reflection file with nano after each round. The goal is to
pause while the workflow is still fresh, not to save every question for the end.

Quick reset:

    bash scripts/reset_outputs.sh --full

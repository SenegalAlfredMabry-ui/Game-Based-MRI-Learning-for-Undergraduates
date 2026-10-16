# Converting images from the command line

Transcript draft — not yet fully checked against the recording. Technical terms may contain transcription errors.

**00:00** Hi, in this video I'm going to be converting the same MPRAGE and FLAIR scans we used in the previous video, but I'm going to be converting them using a command line instead of the graphical interface.

**00:13** So I've already created this folder based on the instructions, so I'm going to move on to step 2 and use nano to open up our script.

**00:25** You can see there's a lot of different sections.

**00:28** So if we break the stand,

**00:29** this first part shows how the shell is being told to run the script,

**00:34** as well as how it's going to stop the script,

**00:38** if there's any errors in between.

**00:40** This next part shows how we're defining our variables.

**00:44** So we're defining the subject,

**00:46** the icon root which is the input folder,

**00:48** and the output directory which is the output folder.

**00:52** So this is important because it shows

**00:55** So we can reuse this workflow for multiple different subjects.

**00:59** In this case, we're using it for subject one,

**01:01** but I could replace this for subject two, three, four, et cetera.

**01:06** And down here, we see the DCM2NEX command for MPRAGE.

**01:12** So all of these different parts have a different use.

**01:17** So the minus CY controls the compressed output, the minus BY

**01:23** controls the JSON metadata, the minus f controls the output file name, and the minus o specifies the output folder.

**01:32** And you can see it's very similar down here for FLIR. Only differences were replacing

**01:39** wherever MPRage was with

**01:43** wherever MPRage was with FLIR.

**01:45** And now I'm going to exit out of nano.

**01:50** And before I run my script, I want to double check that DCM2 next is working.

**01:59** And to do that, I'm going to type in the command.

**02:04** And you can see we got a bunch of text here, which indicates that it is working.

**02:09** And so I'm going to go ahead and run our script.

**02:18** This usually takes a while,

**02:20** so don't worry if it's stuck on this page.

**02:24** So that took a few minutes,

**02:31** but the script has now finished running.

**02:34** I'm going to check my outputs using MrLS script Nifties.

**02:39** You can see I have four files,

**02:42** which is exactly what we were expecting.

**02:45** I'm also going to run this bash on the check conversion.

**02:50** You can see here that the four files were found successfully.

**02:59** So from this, we can create a reproducible workflow and have the scripts convert all of these files for us

**03:09** instead of having to do it one by one.

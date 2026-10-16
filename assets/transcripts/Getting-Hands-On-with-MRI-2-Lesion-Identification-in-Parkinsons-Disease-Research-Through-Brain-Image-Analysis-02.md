# Working through image analysis

Transcript draft — not yet fully checked against the recording. Technical terms may contain transcription errors.

**00:00** Hi everyone, my name is Tiffany and in this video I'll be doing a full run through of the lesion game.

**00:07** So the first thing I'm going to do is read the instructions for part one. Since we really

**00:17** unpacked all of the files in the last video, we're just going to make sure that it's all

**00:21** there. So I just ran the command to check that all of the raw dicombs were there for

**00:26** each of the subjects. And now let's take a look at the first subject with Parkinson's

**00:31** disease. Now looking into the folder of each of the subjects, we should see their

**00:38** FLARE DICOMS as well as their MPRAGE DICOMS. So now let's move on to part two.

**00:44** Our goal in part two is to use nano to edit a script so that we can convert the

**00:51** MPRAGE and FLARE DICOM folders into nifty images. So now we're going to enter our

**00:57** script. So after opening the nano script you'll see that there are three

**01:04** different to-do sections so that we can finish the script and convert all of the

**01:08** dicomms into nifty images. The first to do is to list all of the subjects in the quotation

**01:15** marks, just like that. And now we can move down to to do number two. So in to do number

**01:24** two, we are to convert the subjects MPRage dicomms into nifty images. In order to do

**01:31** so, we're going to be using the DCM2Nix command, just like that. And what this code does is

**01:39** it uses DCM2Nix to convert the mph.coms from the raw directory into the nifty images and

**01:47** put it into the output directory. And now we're going to do the same thing for to do number

**01:53** three, but with the flare. And now to save our script, we want to make sure to hit control

**02:08** O return and then control X. And now let's try running our code. It may take a while to

**02:19** fully convert, but once it's done, we can check to make sure that it's all converted in there.

**02:24** Ta-da! As you can see, we have all of our converted MPRage and Flare Nifties.

**02:31** Now in Part 3, we're going to open our converted Nifties into ITK Snap so that we can actually

**02:37** take a look at the MRI scans.

**02:39** Once we open up ITK Snap, we want to make sure that we're opening the right files.

**02:44** So here I'm going to be using the first subject with Parkinson's Disease, and I'm going to

**02:49** be opening up their Flare.

**02:56** we can scroll through the axial, sagittal, as well as the coronal slices.

**03:04** Now I can also add the MPRage layer on top. And now I'm going to click Layers so that I can

**03:24** increase the contrast. This will allow me to see the hyperintensities clearer. And now in part four,

**03:33** we want to actually mark up the lesions that we see. If we click the paint brush, we can adjust the

**03:38** brush size to be smaller for my accuracy and we can actually label the lesions that we see.

**03:46** In part five, now we're going to measure and compare the masks that we made for the Parkinson's

**03:50** disease subjects versus the control subjects. And we want to make sure to enter the initials that

**03:55** we use to make our files. So as we can see those with Parkinson's had an average marked hyperintensities

**04:04** of around 4.7000 bahs in comparison to the controls which had only around 150.

# Common questions

Transcript draft — not yet fully checked against the recording. Technical terms may contain transcription errors.

**00:08** Okay, so today we're going to be starting, I'm going to be giving an FAQ about the, about the laundry game.

**00:16** So the laundry game is designed to make remote computing and batch processing easier to understand by using laundry as a simple metaphor.

**00:25** The basic idea is that dirty items go in and a process runs and clean items go out.

**00:34** So then we check the results to make sure that you know the process was you know

**00:40** the process was good. And this represents the same workflow that we're gonna be

**00:44** eventually using in with MRI data. Row data goes in, a script is processing the

**00:50** data and the outputs are produced and then we shortly verify those results. But

**00:55** the goal of it is is not to memorize every command, it's to understand the

**00:59** overall workflow. Input, process, output and then you check. And throughout the

**01:04** game, I'll be using commands like pwd, which stands for print working directory, to check

**01:11** my current location, ls to list the files, mv to move the files, cp to copy the items,

**01:21** basically the scripts, and bash, not the scripts, the items, and bash to basically

**01:29** run the scripts.

**01:30** I'd also be using four loops to process multiple files.

**01:35** So later, the game is going to introduce SSH and SCP and sBatch,

**01:41** which are simulated scripts in order

**01:43** to represent what logging into another remote computing

**01:47** looks like.

**01:48** So then you'll be able to transfer files

**01:50** to another computer and submit jobs to a cluster.

**01:53** If something goes wrong, the first steps

**01:56** that you should always consider

**01:58** is checking where you're at using PWD,

**02:02** looking into the files with LS, and reading the readme

**02:06** documents.

**02:08** So I can also inspect the specific folders

**02:10** involved in the workflow.

**02:12** For example, no dirty clothes found usually

**02:14** means that the files are not what the script expects them.

**02:18** And no such file directory means

**02:19** that you're in the wrong location

**02:23** or that the file was already moved.

**02:24** So all in all, just to finish this thing,

**02:28** is that the clothing images are PNG files.

**02:32** So they cannot be opened as MRI data in micro or micro GL.

**02:37** But the longer game is focused on understanding

**02:39** the workflow logic before applying this concept

**02:42** to actual MRI processing.

**02:44** That was it for today.

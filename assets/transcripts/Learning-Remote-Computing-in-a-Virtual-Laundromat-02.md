# Continuing the laundry workflow

Transcript draft — not yet fully checked against the recording. Technical terms may contain transcription errors.

**00:00** All right, so in round 2, the goal is to understand why working with files manually becomes inefficient

**00:07** when you have too much data.

**00:09** So first, I'm going to want to see how many dirty files am I working with.

**00:14** So I'm going to be listing everything under the round2 folder.

**00:18** So it's round2, and that's quite a few many files.

**00:26** As you can see, there are a lot more files than in round 1.

**00:29** So I could move every single one of these files individually, but that would be repetitive

**00:33** very quickly.

**00:34** So to demonstrate this, I'm just going to move two files, right, into the washer.

**00:40** Let me just move dirty cloud, dirty laundry, around two, lab code, dirty, into washer, move.

**00:53** I'm going to move now one of the dirty shirts into the washer.

**01:08** And now, I'm gonna check the washer

**01:11** to make sure that it's there.

**01:15** They're there, that's cool.

**01:17** But doing the same thing over and over again,

**01:19** imagine when you,

**01:20** because imagine if you have like 100 files,

**01:23** that would be really,

**01:25** that would be really long and time consuming.

**01:27** So, I'm gonna use a wildcard,

**01:30** which is basically this symbol,

**01:33** to move all the remaining dirty files at once.

**01:36** So I'm going to move dirty laundry around to,

**01:43** and I'm going to type the wildcard,

**01:48** then underscore dirty dot png into washer.

**02:01** And that should have moved.

**02:03** The start is basically the wildcard.

**02:04** It matches whatever characters come before

**02:07** the underscore dirty dot png.

**02:10** So this command moves every remaining file

**02:12** ending in dirty PNG into the washer.

**02:15** So let's check to make sure that they're all there.

**02:19** As you can see, they're all there.

**02:20** So with all my dirty inputs in the washer,

**02:22** I can just run the local script.

**02:31** That says that all the files

**02:33** that were in the washer has been cleaned.

**02:35** Now we gotta check to make sure that they're actually clean.

**02:44** And it says that it is.

**02:45** 11 of them are actually clean.

**02:47** So let's look and see again.

**02:50** Let's look and see to clean laundry.

**02:55** Voila.

**02:58** So the main takeaway from round two

**03:00** is that moving files manually works

**03:05** with small amounts of data, but it doesn't scale well.

**03:08** So using wildcards and scripts makes repetitive tasks

**03:11** much faster and much more efficient over time.

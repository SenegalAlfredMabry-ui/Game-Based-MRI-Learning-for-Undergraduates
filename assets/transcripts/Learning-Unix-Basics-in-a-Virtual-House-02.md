# Working with rooms and objects

Transcript draft — not yet fully checked against the recording. Technical terms may contain transcription errors.

**00:00** Hello, this is Chloe King, and this is the second video in the House Game series. So at this point, you should have opened your terminal, you should have House Game downloaded, and you should be in the House Game folder. So a reminder, we can check to make sure we're in that folder by typing the command pwd, clicking Enter, and it seems like yes, we're in the House Game folder, so that's perfect. So now we're going to look around, we're going to type ls, we see all these files in front of us. It seems like the most important file is the one that says, read me in all of these files.

**00:30** So we're going to use a new command.

**00:32** It's called cat cat like the animal and then type in that read me dot txt.

**00:38** So the cat command allows you to look at text files at different types of files,

**00:42** but in this case text files and that's what the txt stands for.

**00:45** It stands for text.

**00:46** So now we get all this text popping up in front of us and this is going to tell you

**00:50** exactly how to play the game and exactly what steps need to be taken.

**00:54** So the first thing that I want to do.

**00:56** I'll walk you through a couple of these steps and then I'll leave it to you to continue working.

**01:01** The first thing that I'm interested in doing is just exploring the house a little bit more.

**01:05** So I'm going to LS again and I'm going to go into the house.

**01:09** So I'm going to use the CD command to go into the house LS.

**01:12** I see we have all these different rooms.

**01:14** I'm interested to look in the kitchen, see if there's anything in there.

**01:17** So I'm going to CD into the kitchen.

**01:18** We're going to type the command LS.

**01:20** It seems like there's nothing in the kitchen.

**01:22** So I'm going to go backwards out of the kitchen.

**01:25** To do that, I'm going to type that same command CD, but then two dots after.

**01:28** It's going to take us one step back, so now we're in the house.

**01:31** And then I'm going to CD once more, so we're in the house game file.

**01:34** LS to sort of reorient ourselves, tell us where we are.

**01:38** And then I'm going to go into this decoration file, because I think maybe in the decoration file,

**01:42** there might be some things that we can put in our kitchen.

**01:44** So let's open this file, let's LS to see what's in it.

**01:48** And it seems like there's a fridge in here, and that sounds like the perfect thing to go in our kitchen.

**01:53** So what I'm going to do is I'm going to exit this decoration file that we're in.

**01:57** We're going to go back into the main house game base.

**02:00** And I'm going to use a command called mv.

**02:03** So the mv command is going to move something from one place to another place.

**02:07** mv like move.

**02:09** So what I'm going to do is I'm going to mv and then I'm going to do the overarching folder.

**02:13** So decoration,

**02:15** forward slash,

**02:17** fridge.txt.

**02:19** So that's our first part.

**02:20** then I'm going to do a space.

**02:22** And then I'm, so that's where it is right now, right?

**02:24** So we're going to move the fridge that's in decoration to a new location.

**02:28** So where we want to move it to is house, which is our other folder, right?

**02:33** We have the big house holder slash kitchen.

**02:36** Now we're going to click enter.

**02:38** And now let's go see if our fridge moved to the kitchen.

**02:42** So let's LS, let's CD into the house.

**02:46** Let's LS again.

**02:48** and let's cd into the kitchen, ls, and our fridge is right there. So we were able to move that into

**02:53** our kitchen. Now we're going to go backwards and we're going to do something new. Actually, we don't

**02:59** even need to leave this file because what I'm interested in doing now is creating something new

**03:05** for the kitchen. So maybe now we have a fridge, but we don't have an oven. So what if I create an oven?

**03:13** So this is going to require a new command that's called touch.

**03:17** So the touch command is you just type out touch and then we're going to type in what I want to create, which is an oven.

**03:26** I forgot that, which is a moment.

**03:27** So I'm going to do oven dot txt.

**03:30** And because I'm creating it in the kitchen, it should just be placed immediately in here.

**03:35** So I'm going to click enter.

**03:36** I'm going to click LS.

**03:38** And now we have two things.

**03:39** We have the fridge and the oven.

**03:40** And one final thing before I go, I'm going to add a description to this oven, right?

**03:49** And so I'm going to use one final command that's called nano.

**03:53** Nano allows us to write in a text file.

**03:56** So I'm going to nano oven dot txt.

**03:58** It's going to pull up this whole thing and I'm going to be able to write a place to bake

**04:03** your cookies.

**04:06** Now anyone who opens this file is able to see this.

**04:10** And so then I'm going to click the button Control and X to exit.

**04:13** I'm going to click Y for yes that I want to save it.

**04:17** And then I'm going to click Enter.

**04:18** And then suddenly our text file, our oven file now has words in it.

**04:25** So we're going to cap that like we learned earlier.

**04:28** And it says a place to bake your cookies.

**04:32** That's all.

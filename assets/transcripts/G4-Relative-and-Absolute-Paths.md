# Relative and absolute paths — Transcript draft

John Heatwole · 3:38

Timestamps are approximate. This transcript is a draft; check commands against the written lesson instructions.

[00:00] Hi everyone, my name is John and today we're just going to go over the different paths and how to navigate them in the bash. So right now we are in the house. I just typed ls and you can see there's bathroom, bedroom, hallway, kitchen, living room. So let's say we want to go into the bathroom. We'll say cd, bathroom, and ls.

[00:25] So now we can see what's in the bathroom. There's toothbrush, paste, hair dryer. If we wanted to access this toothbrush, what we could do is say cat toothbrush.txt. And that reads what the toothbrush text file says. It says this is a toothbrush. But let's say we wanted to access this from the house. Let's go back to the house. What we can say is cat bathroom slash

[00:51] toothbrush.txt. And what this is saying is it's saying this is called the relative path and it's saying go to the bathroom since we're already in the house we can go to the bathroom from the house and then go to the toothbrush.txt and then run this cat command on it. And so that does the same thing. Something else we can do is let's go to the bathroom one more time.

[01:16] If we type in pwd, that tells us the absolute path. So if we say cat slash c slash users slash jm. h slash down loads slash learning. unix basics slash house slash bathroom slash toothbrush.txt.

[01:47] This will do the same thing, and it doesn't even matter which directory you're in. You can call this line from any directory, and it will bring you to the toothbrush. And the reason for that is it's starting at the root directory, which for me here is C, and it's going all the way from basically the beginning of the directory to where you want to be. So you can call that from anywhere, and it'll always give you that toothbrush. A couple other things to mention is that it's important that you have uppercase and lowercase be correct in this, since Bash is case sensitive.

[02:21] If it says lowercase toothbrush, make sure it's lowercase toothbrush, uppercase, same thing. And let's say, so right now we are in the bathroom. Let's say there's a space in the file we're trying to access. So let's say we wanted to call cat Tooth Paste.txt. It looks like it should work, but it doesn't.

[02:47] And the reason for that is there's a space. And the way you get around that is by saying cat with quotation marks Tooth Paste.txt. text. And the quotation marks are basically telling the computer, put all of this name of the text file together. It's all together. And the space is part of the title.

[03:12] Yeah, and if you're ever having trouble, if you're having a file not found there, just type ls and that will tell you what files are available and make sure you're just spelling things correctly. I hope this was helpful and good luck learning the rest of the coding skills.

[Return to video](../../02-learning-the-games/watch-G4-Relative-and-Absolute-Paths.md)

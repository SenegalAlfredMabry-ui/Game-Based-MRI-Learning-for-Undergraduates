# Work through an error and ask for help — Transcript draft

Aaryan Sajwani · 4:41

Timestamps are approximate. This transcript is a draft; check commands against the written lesson instructions.

**On-screen clarification, 02:29–03:00:** The failed filename also omits the underscore before `3`. The correct name is `Round_3_Robot_Washer_Loop.txt`. Case sensitivity depends on the filesystem; use the exact name shown by `ls`. This note is separate from the spoken transcript.

[00:00] So this is G8. We're going to work through an error and ask for help. I'm using a practice copy of the virtual Laundromat game on Mac OS. So I'm going to make two common mistakes on purpose and then show how to fix them. So first we're going to try to trigger the first error. So I'm going to type in head instructions/Round_3_Robot_Washer_Loop.txt, and so before trying anything else, read the error. It names the file that it was


[00:37] looking for and says no such file or directory. That usually means one of two things. Either one, I'm in the wrong folder or two, I spelled the name wrong. So now I'm going to try to check where my location is to check for the first one. So I'm going to go ahead and type pwd and pwd shows where I am. So I'm in /tmp/g8 not in the game folder which means I'm going to go ahead and type ls and ls will show the show the game folders actually here so I'm just simply one level too high. So now I'll try to


[01:08] move into it by typing cd and simply pasting that output and so now it works the command was fine so now I'm just going to go ahead and type in what I was trying to get before, head instructions/Round_3_Robot_Washer_Loop.txt. And so now it works.


[01:40] The command was fine. I was just simply in the wrong place. So now I'm going to go ahead and show you the other possible error by kind of mixing up the file name itself. So I'm going to type in the same thing as before. not really the same thing. I'm going to type in head instructions slash round and I'm going to lowercase round3_robot_washer_loop.txt and we get


[02:12] the same errors before so no such file or directory that was found. But we are in the right folder so now I'll just check by kind of by check the spelling by listing the folder So I'm going to go ahead and type ls instructions. So now you can see the full name here. And you can see the major difference was, of course, the fact that I started each term with the lower case, but in fact it's an upper case. So now the terminal treats, and again, like you shouldn't, it's important to note, the


[02:45] terminal does treat capital letters as different letters. So watch out for spaces and names, which needs quotation marks. A good habit is to try to type the first few letters and press tab so terminal fills the exact name. Just to demonstrate that I'm going to go ahead and type head instructions/Rou and just going to press tab and now you get the full name. Now we can type in and finish the full name here with the Robot.


[03:19] We have the reference right there. underscore Loop. And yeah, there we go. We have the game ready. So now we're going to go ahead and try to consult the troubleshooting help. So now I'm going to go and try and type ls instructions/stuck_instructions. And so it's good to


[03:50] If I'm still stuck, the game has help built in. There's an FAQ file and a stuck file for every round. The part zero instructions also have a good rule. If something fails, don't guess. Run pwd, then ls, then read the command again. So now I'm gonna go ahead and switch to my browser tab. So this will have the troubleshooting for round four. So, so for lesson four, it says read the whole error, check pwd and ls, and compare


[04:22] your command to the instructions. It also says not to reset the whole activity while you're still figuring out the cause, so the problem can be understood. So now, again, you need to read the error, check where you are, what is pwd and ls, the spelling and use the troubleshooting help.

[Return to video](../../02-learning-the-games/watch-G8-Work-Through-an-Error-and-Ask-for-Help.md)

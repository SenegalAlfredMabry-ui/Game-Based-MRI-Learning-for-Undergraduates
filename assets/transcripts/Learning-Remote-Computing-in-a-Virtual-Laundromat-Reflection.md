# Learning Remote Computing in a Virtual Laundromat — Transcript draft

Aaryan Sajwani · 3:41

Timestamps are approximate. This transcript is a draft; check commands against the written lesson instructions.

[00:00] So now I'm going to share some reflections that I had for Game 4. So the first question, what did this game teach you how to do? So I would say for me, it really taught me how research data gets processed when there's too much to handle by hand. In the first round, I moved dirty laundry into the washer one file at a time with mv. Then I used a wildcard to move a whole batch and then a loop script that repeated the move for every file automatically. So that kind of showed me how repeated processing works.


[00:30] When the same step has to happen over and over, you let a script do it. The last two rounds really simulated remote computing. So I logged into the PI Laundromat, copied files over, and submitted a job like you would on a real cluster. And every round ended with checking the output folder and running a checker. So I learned to confirm that the work actually happened. And I would say for the second question, what was one moment where you got stuck? Confused or had to slow down?


[01:01] So I think I probably had to slow down a little bit at the very start, just getting into the game folder. The folder name is too long and my first attempt didn't really put me in the right place. But again, running those two commands that I showed earlier, running pwd and then ls kind of helped me first show where I actually was and then ls showed me what was around me. And then tab completion, filled it in the exact name. And so that moment, like that really helps, really set a habit for the rest of the game.


[01:32] So before assuming anything is broken, check where you are, what files you are. So what files are there, and then ultimately if you need help, then go to the troubleshooting page. And then for the third question, what command file or folder felt most important in this game? So I would say the log files in remote_laundromat/logs, when I submitted the job in round five, I didn't watch it run. So the log was only, it was the only record of what happened and whether anything went


[02:03] wrong. And so the game compares it to a receipt from a dry cleaner and that fit. So without the log and the output check, I just be hoping that the job had worked. And then for the next question, how do you think this game helped you with real research or MRI work. So MRI studies apply the same processing steps to scans from many participants. And the data is often too large for a laptop and that's why researchers often use loops and run their work on servers or clusters.


[02:33] So the simulation ran entirely on my own laptop but it taught me the real order of the steps. So first you want to connect it, you want to copy the data over, you want to run or submit the job, then check the logs and outputs. So when I eventually use SSH, SCP, and a job scheduler, by that point, I think I'll have a really good understanding what each individual step is for. And finally, what would you do first if you had to solve a similar problem on your own? So first, I'd run as before.


[03:04] I'd run pwd and ls to confirm where I am and where my input files are. And next, I'd make sure the inputs are in the folder that the script expects before anything, before running anything. So after it runs, I checked the output folder and the log instead of assuming that it worked. And if something did fail, then I'd read the full error message before trying to fix it. And yeah, those are some of the reflections that I had for the lesson. Overall, I think it was a really great experience to have that first immersion into learning


[03:36] really how the real scans work for an MRI. Yeah.

[Return to video](../../02-learning-the-games/04-learning-remote-computing-in-a-virtual-laundromat/watch-Learning-Remote-Computing-in-a-Virtual-Laundromat-Reflection.md)

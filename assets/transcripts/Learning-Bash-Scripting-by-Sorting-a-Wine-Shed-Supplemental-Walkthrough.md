# Sort a Wine Shed order with a Bash script — Transcript draft

Carlo Bayona · 8:31

Timestamps are approximate. This transcript is a draft; check commands against the written lesson instructions.

[00:00] Hey everyone, my name is Carlo and today, in today's video, we'll be focusing on lesson two, specifically the wine shed in the wine game. We'll be looking at conditions, loops, and checking baskets. So in the first round of the wine game, we ideally focus on just moving the wine text files to customers manually. But for round two, we're going to focus on creating a Bash.

[00:26] That way we can efficiently and like more securely move all the text files without having to go through them manually. It's going to save us a lot of time. So the first thing I'm going to do is just, I'm currently in the wine game, I'm just going to hit ls to see where I am. And since we're in round two, we're going to have to deal with our round two files. So first thing I'm going to check is to see the orders that we have for round two to see like what we need to do exactly.

[00:56] and since it's a CSV file, we just have to hit cat to view. And it shows that we have only one customer, but this customer simply wants a red cherry wine. Now we have to sort all the wines that are following this criteria. So what we could do, usually what we've been doing, is going through every single wine, and we can check really quickly how many wines are in round two by going to wine shed round two.

[01:24] ls so we have eight different wines so instead of going through all these eight manually checking uh what they have in their descriptions and if they match what the customer wants we're going to run a bash script so in the instructions we have a template you can also access it by going to student templates students underscore templates but right now i just have it copy pasted right

[01:51] here so cp student underscore templates specifically we're going to go to round two for one customer template and we're just going to hit enter first we're going to go back to the main directory so we're going to go back one and then we're going to run this student template that we have in one of our files we can ask access to scripts you'll be able to access it through instructions as well as through student underscore templates.

[02:20] We're going to hit enter. And now we're in the template and we're going to hit nano. Nano enables us to actually go inside the text file of the template and edit it. So we're going to do nano sort_round2.sh. That's it. All right. So here we have a little program, a little script.

[02:45] And essentially, it does have our goal, which is to move every red wine, that mentions cherry into the customer's basket. We already clarified that. Now we have some variables specifically to what we have as our objective. So customer, customer one, our color specifically, we have it as red and for our flavor is cherry. So we have it already set out. My shed is specifically wine shed two.

[03:10] Now, for sorting, we're going to go to around here, step two and step three. Essentially, sorting is basically a condition that tells Bash to perform an action only when a particular rule is true. So essentially, if the color, for example, if the color of the file is red, then specifically we'll move on to the very next statement, which is asking about flavor.

[03:42] So if the color is red, and if the flavor is cherry, then mv will be moving the file to the correct basket to the customer. So that is what a condition is, a sorting condition. We've been using like if then statements, or it could just be like, yeah, if, and then we'd have a multiple if. So right now we have two if statements. Other than the sorting condition,

[04:08] we also have a for loop. And essentially the loop, which is visible in step one, enables us to go through every single wine file. So all eight of them and basically check the same thing. So instead of having to write eight different scripts so they could check, let's say, like if, you know, if wine one is red and cherry,

[04:34] we can write just one script and we can go through all eight of the wine text files to check if they're red and cherry. And if they are, we move them to customer one. So essentially this is what this script does. But currently I'm activating this script by removing the hashtags from the program.

[05:03] And now we can clearly see our for loop and then our two if statements and our action, which is like we move it to the basket and yeah. So I'm gonna now exit, save and then enter.

[05:30] Now that we have our script ready, we can run it using a bash command. So we use bash sort_round2.sh. As you can see, it went through all eight of the wine text files and then it says done. It's checked the basket of customer one. We can also double check by using the second command of bash.

[05:56] This is bash scripts/check_baskets.sh round2. And right here it shows us that wines one and three were placed into customer one. Basically, fact checking that they were successfully moved

[06:21] and that wines one and one three are both red and cherry. we can do one final thing um and that is to check the content of wines one and wine three just to be extra sure so what we can do is we're gonna go to ls and then we're gonna visit the wine shed again we're around two and specifically as you can see [wine number unclear] and wine three

[06:58] are already removed from the wine shed, so we can only view them through the customer. So we're going to go back to cd baskets to LS, and we're going to visit customer one

[07:23] with the two wines and then we're going to open one of these so we're going to open with cat wine one just to double check to see if the script correctly identified and yes wine one was red and cherry and we'll quickly also use cat again for wine three

[07:49] and that one also was red and cherry. So yeah, this is how we can use a script to basically run a sorting as well as a for loop in order to quickly move multiple text files or move a text file into a certain category without having to go through them all manually

[08:16] as well as using a couple bash commands to verify and to double check that it was successful. Yeah, that will be the conclusion of today's video.

[Return to video](../../02-learning-the-games/02-learning-bash-scripting-by-sorting-a-wine-shed/watch-Learning-Bash-Scripting-by-Sorting-a-Wine-Shed-Supplemental-Walkthrough.md)

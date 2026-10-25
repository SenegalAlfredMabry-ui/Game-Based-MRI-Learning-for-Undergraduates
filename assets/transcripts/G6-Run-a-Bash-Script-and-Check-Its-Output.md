# Run a Bash script and check its output — Transcript draft

John Heatwole · 4:39

Timestamps are approximate. This transcript is a draft; check commands against the written lesson instructions.

[00:00] Hi everyone, my name is John and today we're going to do some practice with scripts. To get started, let's just do a little bit of background about what our script is doing. What it's doing is moving wine from a wine shed to a customer based on some attributes of the wine. Let's actually look at the wine first.

[00:27] So we're going to wine shed round two, and ls will allow us to look inside. And let's look at wine one. So we can see it has different attributes using the cat function. In this case, it's red and cherry. Let's go back.

[00:52] and let's actually look at the script we want to run. So if we type in nano in the name of the script, we can actually look inside. So nano not only lets us look at it, but also edit it if we want to. What the script does is basically in this first loop here,

[01:19] it's looking through all of the different wines. in the shed and doing some specific action on them. Here this action is it's checking if the color matches the color we want and it's checking if the flavor matches the flavor we want, which in this case is red and cherry. Then if both of these conditions are true, it will do this final action, which is move the wine to the customer.

[01:51] Some things I want to point out here is whenever you see this dollar sign followed by a name, this refers to a variable, something that's already been defined. So this $CUSTOMER means don't actually use the name customer. Instead, look at what customer means and use that instead.

[02:17] So here customer means cust01. So this represents cust01. Another thing I want to mention is echo is basically outputting text to your bash. So that's kind of telling you what's going on in this program, and it can help you kind of keep track of what your code is doing.

[02:43] And yeah, so the output in this example is this echo, this text output, as well as the files that you're moving from your wine shed. And kind of the input is the wine shed that we're giving this code to access. So let's actually see what's going on here. So let's exit and let's run the script.

[03:11] And one way you know that you're dealing with a script is this .sh. That .sh is very important. It means that it is a script. So if we want to run this, we say .slash and the name of the script. So sort_round2.sh. And we can see here this output of it's checking wine1.

[03:40] It moved wine1. Now it's checking wine2. It's checking wine3. It moved wine3. And then it's checking the rest. And then it's done. So that's kind of the output here. And we can also check that it successfully moved these wines by going to the location where it's supposed to move those wines to. So let's go to the baskets and the customer one.

[04:09] So before we ran this script, this customer had no wines. And now if we type in ls, which allows us to look into the customer one directory, we can see it now has wine one and wine three, which checks out with the output of this script. I hope this was helpful, and yeah, see you next time.

[04:35] Bye.

[Return to video](../../02-learning-the-games/watch-G6-Run-a-Bash-Script-and-Check-Its-Output.md)

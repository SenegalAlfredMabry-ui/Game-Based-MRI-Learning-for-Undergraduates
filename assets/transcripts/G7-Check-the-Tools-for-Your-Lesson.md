# Check the tools for your lesson — Transcript draft

Aaryan Sajwani · 3:13

Timestamps are approximate. This transcript is a draft; check commands against the written lesson instructions.

This transcript follows the edited recording.

[00:00] So this is G7. We're checking the tools for your lesson. I'm testing on macOS version. I'm going to type sw_vers and that'll tell me my Mac version. So it looks like I'm running on 15.4.1 on an Apple Silicon Mac. If you're on Windows or Linux, the commands are similar, but the names do differ. And so now we're going to go ahead and check Bash. So I'm going to go ahead and type bash --version.


[00:30] And so this first line shows the Bash version. Newer Macs use a shell called zsh by default, but Bash is still installed. The lessons run their scripts with the Bash command. So this is the version that actually matters. And now we're going to go ahead and check to see if Python is currently installed. So you don't want to type python directly. You want to type python3, as you can see here, and you want to see the version for that. So it looks like we're running on Python 3.9.6.


[01:01] So again, like on a Mac, you do want to type python3 specifically. And if it does print a version number as it is shown here, then it shows that it is ready. And if a window pops up asking to install developer tools, click install, and run the command again. And now we're going to go ahead and try to locate dcm2niix. So we're going to go ahead and type which dcm2niix. And so just for some context, dcm2niix converts DICOM scans from an MRI scanner


[01:36] into NIfTI files, which is the format analysis tools use. The which command shows where it's installed, if nothing prints, it either isn't installed or your computer doesn't know where to look for it. So when I installed it with pip, I got a warning that the install folder wasn't on my path and which said not found. I fixed that by adding the folder to my path in my [shell profile filename unclear] file. If you see that warning, read it carefully because it tells you the folder that you


[02:06] actually need. So now I'm going to go ahead and type dcm2niix and what you're going to see is that running it on its own prints the version and a list of options which confirms that it actually works. And so now we're going to go ahead and try to open an MRI in ITK-SNAP. So we're going to go ahead and say open -a ITK-SNAP.

[02:33] So, you can use ITK-SNAP or MRIcron, depending on what your lesson asks for, but not every lesson needs a viewer. For example, the virtual laundromat game uses regular PNG images, not MRI files, so it only needs the bash command.

[02:52] The MRI lessons are where you'll use dcm2niix and a viewer. So just in summary, if Bash and Python print version numbers, which finds the dcm2niix, and your viewer opens an MRI file, your tools are ready for the lessons. So yeah, that's a quick summary for a G7.

[Return to video](../../02-learning-the-games/watch-G7-Check-the-Tools-for-Your-Lesson.md)

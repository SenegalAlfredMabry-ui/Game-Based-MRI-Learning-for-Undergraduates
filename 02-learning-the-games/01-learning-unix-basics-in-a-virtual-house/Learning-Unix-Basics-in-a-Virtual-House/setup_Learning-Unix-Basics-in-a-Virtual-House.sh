#!/bin/bash
set -e
# ============================================================
# Learning Unix Basics in a Virtual House
# Questions? Email sam469@cornell.edu
# Basic commands and navigation
# ============================================================

# Refuse to overwrite an existing attempt.
if [ -e "Learning-Unix-Basics-in-a-Virtual-House" ]; then
  echo "The lesson folder already exists. Keep your work and choose a new empty working directory."
  exit 1
fi

#  Startup message
echo "Welcome! This will set up your Learning Unix Basics in a Virtual House environment."
echo " When it finishes, open the README for instructions:"
echo "    cat Learning-Unix-Basics-in-a-Virtual-House/README.txt"
echo "Let's rock."

cat <<'INTRO' 
Welcome to the Learning Unix Basics in a Virtual House.

This game helps you get comfortable working in the Terminal. It is the same
kind of environment used every day in MRI analysis. You will build a small
"house" out of folders and files. You will move through it, organize what is
inside, and learn how files and folders are arranged.

Think of your folders as rooms and your files as objects in those rooms. Each
command is a way of moving around or changing something. These are the same
moves you will use later to work through the folders of a real MRI study.


SETTING
------------------------------------------------------------
Congratulations on starting your journey in MRI analysis. To celebrate, your PI/supervisor
has gifted you a brand new house with furnishings. The only problem is that it's 100% virtual.
Still, you get to customize this house however you like. This is the beginning of your
journey into homeownership and into the more exciting world of MRI.


WHY PLAY
------------------------------------------------------------
When you work with MRI data, you’ll manage thousands of files like
raw scans, motion corrections, alignments, warps, and results. Knowing how to move,
rename, and understand those files is essential. The same commands that help
you organize this digital house are the ones that let you navigate an MRI study
and trace data from acquisition to final product (eventually).

INTRO

# ------------------------------------------------------------
# 2) Create base directories
#    #Building the walls of your new home—no hammers required.
# ------------------------------------------------------------
mkdir -p Learning-Unix-Basics-in-a-Virtual-House/Decoration
mkdir -p Learning-Unix-Basics-in-a-Virtual-House/House/{Bedroom,Bathroom,Kitchen,LivingRoom,Hallway}
mkdir -p Learning-Unix-Basics-in-a-Virtual-House/student_notes
cd Learning-Unix-Basics-in-a-Virtual-House

# ------------------------------------------------------------
# 3) Creates items with simple descriptions
#    #Decorate the house however you like. If you want Pop-Tarts in the bathroom,
#    #that’s your business.
# ------------------------------------------------------------

# Living Room
echo "Lamp — tall bronze lamp with cream shade." > Decoration/lamp.txt
echo "Couch — gray fabric, soft and comfortable." > Decoration/couch.txt
echo "Coffee table — oak surface with metal legs." > Decoration/coffee_table.txt
echo "Television — flat screen on a wooden stand." > Decoration/television.txt
echo "Bookshelf — tall wood shelves with space for books or plants." > Decoration/bookshelf.txt
echo "Rug — woven wool, red and navy pattern." > Decoration/rug.txt
echo "Painting — large abstract canvas, orange and blue tones." > Decoration/painting.txt
echo "Plant — tall green fern in a clay pot." > Decoration/plant.txt
echo "Curtains — long beige curtains tied neatly at the sides." > Decoration/curtains.txt
echo "Armchair — blue armchair with wooden frame." > Decoration/armchair.txt

# Kitchen
echo "Stove — stainless steel gas range with four burners." > Decoration/stove.txt
echo "Fridge — white enamel refrigerator with freezer above." > Decoration/fridge.txt
echo "Toaster — two-slot silver toaster." > Decoration/toaster.txt
echo "Kettle — electric kettle, matte black finish." > Decoration/kettle.txt
echo "Cutting board — smooth bamboo board, medium size." > Decoration/cutting_board.txt
echo "Mug — ceramic mug with dark red glaze." > Decoration/mug.txt
echo "Spice rack — small shelf of glass jars labeled with spices." > Decoration/spice_rack.txt
echo "Pan — nonstick skillet, black handle." > Decoration/pan.txt
echo "Dish rack — wire frame beside the sink." > Decoration/dish_rack.txt
echo "Bar stool — tall wooden stool beside the counter." > Decoration/bar_stool.txt

# Bedroom
echo "Bed — queen-sized bed with wooden frame and white bedding." > Decoration/bed.txt
echo "Pillow — soft cotton pillow, medium firmness." > Decoration/pillow.txt
echo "Dresser — six-drawer maple dresser with brass handles." > Decoration/dresser.txt
echo "Nightstand — small table with lamp and drawer." > Decoration/nightstand.txt
echo "Alarm clock — round red clock with a clear face." > Decoration/alarm_clock.txt
echo "Blanket — green knitted throw folded at the foot of the bed." > Decoration/blanket.txt
echo "Wardrobe — tall oak cabinet with sliding doors." > Decoration/wardrobe.txt
echo "Mirror — oval mirror with gold trim above the dresser." > Decoration/bedroom_mirror.txt
echo "Chair — cushioned chair beside the window." > Decoration/bedroom_chair.txt
echo "Curtains — dark blue curtains that block morning light." > Decoration/bedroom_curtains.txt

# Bathroom
echo "Mirror — round mirror with silver frame, 60cm wide." > Decoration/mirror.txt
echo "Towel — navy cotton towel, folded neatly." > Decoration/towel.txt
echo "Toothbrush — green handle, soft bristles." > Decoration/toothbrush.txt
echo "Shampoo — clear citrus bottle." > Decoration/shampoo.txt
echo "Bathmat — gray cotton mat, non-slip." > Decoration/bathmat.txt
echo "Soap — lavender bar in a ceramic dish." > Decoration/soap.txt
echo "Candle — vanilla candle in frosted glass." > Decoration/candle.txt
echo "Laundry basket — wicker basket in the corner." > Decoration/laundry_basket.txt
echo "Towel rack — metal stand with folded towels." > Decoration/towel_rack.txt
echo "Sink — porcelain basin with chrome faucet." > Decoration/sink.txt

# Hallway
echo "Chair — wooden seat near the door." > Decoration/chair.txt
echo "Umbrella stand — black metal stand near the wall." > Decoration/umbrella_stand.txt
echo "Shoes — brown leather shoes neatly placed." > Decoration/shoes.txt
echo "Coat rack — tall wooden rack with jackets hanging." > Decoration/coat_rack.txt
echo "Console table — small hallway table with a bowl of keys." > Decoration/console_table.txt

# ------------------------------------------------------------
# 3b) Smoothie machine (used in Round 3: your first nano script)
#    #The kitchen comes with a smoothie machine and a few starter
#    #ingredients. In Round 3 you will write a script that blends them.
# ------------------------------------------------------------
mkdir -p House/Kitchen/SmoothieMachine/ingredients
echo "Banana — one whole banana, sweet and creamy." > House/Kitchen/SmoothieMachine/ingredients/banana.txt
echo "Strawberry — a handful of fresh strawberries." > House/Kitchen/SmoothieMachine/ingredients/strawberry.txt
echo "Milk — one cup of your favorite milk." > House/Kitchen/SmoothieMachine/ingredients/milk.txt
echo "Honey — a spoonful of honey for sweetness." > House/Kitchen/SmoothieMachine/ingredients/honey.txt

# ------------------------------------------------------------
# 4) Create the sample map
#    #A simple floor plan for your digital house.
# ------------------------------------------------------------
cat <<'MAP' > House/map.txt
HOUSE MAP (read me with: cat House/map.txt)

House/
  Hallway/  
  LivingRoom/
  Kitchen/
  Bedroom/
  Bathroom/
MAP

# ------------------------------------------------------------
# 6) Getting started instructions
# ------------------------------------------------------------
cat <<'INSTRUCTIONS' > README.txt
GETTING STARTED (choose ONE)
------------------------------------------------------------
Option A: Run the setup script directly (no chmod needed)
  1) Save this file as setup_Learning-Unix-Basics-in-a-Virtual-House.sh
  2) In Terminal, go to the folder that contains it (use Finder → right-click → “New Terminal at Folder”, or cd).
  3) Run:   bash setup_Learning-Unix-Basics-in-a-Virtual-House.sh

Option B: Use a prebuilt ZIP (no commands needed at all)
  - If your instructor provided Learning-Unix-Basics-in-a-Virtual-House.zip:
    1) Double-click to unzip (macOS) or right-click → Extract (Linux/Windows).
    2) Open the unzipped “Learning-Unix-Basics-in-a-Virtual-House” folder in your file browser.
    3) You can still open a Terminal inside that folder later and practice commands there.

ROUND 1: YOUR FIRST STEPS
------------------------------------------------------------
1) Enter the game folder:
   cd Learning-Unix-Basics-in-a-Virtual-House

2) See what's here:
   ls
   ls Decoration
   cat House/map.txt

3) Move items into rooms (practice mv):
   mv Decoration/lamp.txt House/LivingRoom/
   mv Decoration/bed.txt House/Bedroom/
   mv Decoration/toothbrush.txt House/Bathroom/
   #Decorate the house however you like. If you want Pop-Tarts in the bathroom, that's your business.

4) Explore (practice cd, ls, pwd):
   cd House/LivingRoom
   pwd
   ls
   cd ../Kitchen
   pwd
   ls

5) Craft your own furniture (practice touch/echo):
   touch Decoration/table.txt
   echo "Wooden dining table with round edges and a polished surface." > Decoration/table.txt
   mv Decoration/table.txt House/Kitchen/

6) Organize & rename (mv) / copy (cp) / remove (rm):
   mv Decoration/rug.txt Decoration/carpet.txt
   cp Decoration/chair.txt Decoration/chair_backup.txt
   rm Decoration/chair_backup.txt      # careful: rm deletes
   #Keeping things tidy matters, whether it's data or decorations.

7) Add a new room — GARDEN (practice mkdir):
   #Build your dream house.
   mkdir House/Garden
   echo "Wooden bench under a maple tree." > Decoration/garden_bench.txt
   echo "Watering can — green metal, slightly dented but reliable." > Decoration/watering_can.txt
   echo "Lantern — hanging light with a soft glow." > Decoration/lantern.txt
   mv Decoration/garden_bench.txt House/Garden/
   mv Decoration/watering_can.txt House/Garden/
   mv Decoration/lantern.txt House/Garden/

8) Pause and reflect:
   nano student_notes/round1_reflection.txt
   # Answer the Round 1 questions while the basic navigation and moving steps
   # are still fresh.

ROUND 2: MOVE FASTER WITH PATHS
------------------------------------------------------------
Goal: learn that you do not always have to move one room at a time.

In Round 1, you stepped through nearby folders one at a time:
   cd House/LivingRoom
   cd ../Kitchen

In Round 2, you will jump straight to a folder using its full path. First you
will save the path to your Learning-Unix-Basics-in-a-Virtual-House folder so this works no matter where your
folder lives.

1) Make sure you are in the main Learning-Unix-Basics-in-a-Virtual-House folder, then save its full path:
   pwd
   HOUSE_PATH="$(pwd)"
   echo "$HOUSE_PATH"

2) Jump straight to a room using that saved path:
   cd "$HOUSE_PATH/House/Bedroom"
   pwd
   ls

3) Jump from one room to another with a relative path:
   cd ../Bathroom
   pwd
   ls

4) Read a file without entering its folder:
   cat "$HOUSE_PATH/House/map.txt"

5) Go back to the last place you were:
   cd -

Note: in other tutorials you may see paths like ~/Desktop/Learning-Unix-Basics-in-a-Virtual-House. That only
works if your Learning-Unix-Basics-in-a-Virtual-House folder is actually on the Desktop. Saving
HOUSE_PATH="$(pwd)" works no matter where you unzipped the game.

Why this matters:
MRI projects often have deep folders. A full path lets you move directly to a
subject folder, script folder, or results folder instead of clicking around or
typing many small cd commands.

Pause and reflect:
   nano student_notes/round2_reflection.txt

ROUND 3: BUILD THE SMOOTHIE MACHINE (your first script)
------------------------------------------------------------
Goal: write your very first script in nano and run it. You will build a
"smoothie machine" that takes ingredient files and blends them into one new
smoothie file. This is the same idea you will use in the Learning Bash Scripting by Sorting a Wine Shed and in real
MRI work: a script takes some input files and produces an output file.

Your kitchen already has a smoothie machine folder with a few ingredients:
   cd "$HOUSE_PATH/House/Kitchen/SmoothieMachine"
   pwd
   ls ingredients
   cat ingredients/banana.txt

1) Add your own fruit (practice nano):
   nano ingredients/mango.txt
   # Type a line such as: Mango — one ripe mango, peeled and diced.
   # Save and exit nano:  Ctrl + O, then Enter, then Ctrl + X
   ls ingredients

2) Write the smoothie machine script (practice nano):
   nano make_smoothie.sh

   Type these four lines exactly:

   #!/bin/bash
   echo "Blending your smoothie..."
   cat ingredients/*.txt > smoothie.txt
   echo "Done. Read it with: cat smoothie.txt"

   Save and exit nano:  Ctrl + O, then Enter, then Ctrl + X

3) Run your script:
   bash make_smoothie.sh
   cat smoothie.txt

4) Run it a second way (practice chmod +x):
   chmod +x make_smoothie.sh
   ./make_smoothie.sh
   # chmod +x makes the file runnable on its own, so ./make_smoothie.sh works
   #   without typing bash in front of it.

What just happened:
Your script read every ingredient file (ingredients/*.txt) and combined them
into one new file called smoothie.txt. You wrote it once and can run it as many
times as you like. That is exactly why scripts matter: they turn a set of steps
into something you can repeat.

When you are done, go back to the main Learning-Unix-Basics-in-a-Virtual-House folder:
   cd "$HOUSE_PATH"

Pause and reflect:
   nano student_notes/round3_reflection.txt

DELIVERABLE: house_tour.txt (keep this)
------------------------------------------------------------
Move the items by following the directions above, then write a short house tour
for your PI/supervisor.
 - Which items are in each room?
 - What rooms did you create for yourself?
 - How do you get from the LivingRoom to the Kitchen using cd?
 - What did your smoothie machine script do?

Create and edit it any way you like:
   echo "Welcome to my house..." > house_tour.txt
   # or open it in a terminal editor later (nano house_tour.txt)

CHEATSHEET
------------------------------------------------------------
- Where am I?                 pwd
- What’s here?                ls
- Go into a folder            cd FolderName
- Go up one level             cd ..
- Jump with a relative path    cd ../Kitchen
- Jump with a saved full path  cd "$HOUSE_PATH/House/Kitchen"
- Return to previous folder    cd -
- Read by path                 cat House/map.txt
- Make a folder               mkdir NewFolder
- Make a file                 touch file.txt
- Write text into a file      echo "hello" > notes.txt
- Append to a file            echo "more" >> notes.txt
- Move/Rename                 mv oldname.txt newname.txt
- Copy                        cp file.txt copy.txt
- Delete                      rm file.txt
- Edit a file                 nano file.txt
- Run a script                bash make_smoothie.sh
- Make a script runnable      chmod +x make_smoothie.sh  (then ./make_smoothie.sh)
INSTRUCTIONS

cat <<'TXT' > student_notes/round1_reflection.txt
Learning Unix Basics in a Virtual House Round 1 Reflection - Basic Navigation
================================================

Open this after Round 1:

  nano student_notes/round1_reflection.txt

1. What did Round 1 teach you how to do in Terminal?


2. Which command helped you check where you were?


3. Which command helped you see what was inside a folder?


4. What was one moment where you got stuck or had to slow down?


5. How might moving through a house folder help you later move through MRI folders?


TXT

cat <<'TXT' > student_notes/round2_reflection.txt
Learning Unix Basics in a Virtual House Round 2 Reflection - Faster Paths
============================================

Open this after Round 2:

  nano student_notes/round2_reflection.txt

1. What did saving HOUSE_PATH help you do?


2. What is the difference between moving one folder at a time and jumping with a full path?


3. Which path command felt most useful?


4. Why might full paths matter in a real MRI project?


5. What would you check first if a full path failed?


TXT

cat <<'TXT' > student_notes/round3_reflection.txt
Learning Unix Basics in a Virtual House Round 3 Reflection - First Script
============================================

Open this after Round 3:

  nano student_notes/round3_reflection.txt

1. What did your smoothie machine script do?


2. What were the input files?


3. What was the output file?


4. Why is a script useful if you need to repeat the same steps later?


5. What part of writing or running the script felt new?


TXT

cat <<'FAQ' > FAQ.txt
HOUSE GAME FAQ
==============

What is the goal?
Practice basic Terminal confidence by moving through a house-shaped folder
structure, reading files, creating notes, and organizing objects into rooms.

Why does this matter for neuroimaging?
MRI projects are folder-heavy. Before students can run analysis software, they
need to know where they are, what files are present, and how to move directly to
the right place.

What should I look at first?
Start with README.txt, then read House/map.txt. Use pwd to check where you are,
ls to see what is nearby, and cat to read small text files.

What commands matter most?
pwd, ls, cd, cat, mv, mkdir, touch, echo, nano, cp, rm, and cd -. Round 2 adds
relative paths and full paths so you can jump directly between rooms. Round 3
adds nano, bash, and chmod +x so you can write and run your first script.

Common problem: cd says "No such file or directory."
Check spelling and capitalization with ls. Terminal paths are exact:
LivingRoom is different from livingroom.

Common problem: I do not know where I am.
Run pwd. Then run ls. If you are deep inside the house, cd ../.. moves up two
levels, and cd ~/Desktop/Learning-Unix-Basics-in-a-Virtual-House returns to the main game folder on most Macs.

Common problem: I moved the wrong item.
Use ls to find where the file went, then move it back with mv. Example:
mv House/Bathroom/lamp.txt Decoration/

Common problem: my smoothie machine script did nothing.
Make sure you are inside House/Kitchen/SmoothieMachine when you run it, and that
your ingredient files end in .txt. Run ls ingredients to check, then read the
result with cat smoothie.txt.

Where should I look for help?
Read README.txt, House/map.txt, and this FAQ. If you are still stuck, take a
screenshot of pwd, ls, and the command that failed.
FAQ

echo "Learning Unix Basics in a Virtual House setup complete ✅ ."
echo " Start exploring with: cd Learning-Unix-Basics-in-a-Virtual-House && cat House/map.txt"
echo "Read your instructions anytime with: cat README.txt"

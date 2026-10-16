#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Learning Bash Scripting by Sorting a Wine Shed
# Fixed four-round version for sharing with students
# Questions? Email sam469@cornell.edu
# ============================================================

GAME_DIR="${1:-Learning-Bash-Scripting-by-Sorting-a-Wine-Shed}"

if [[ -e "$GAME_DIR" ]]; then
  echo "ERROR: '$GAME_DIR' already exists."
  echo "Move it, delete it, or run this script with a new folder name, for example:"
  echo "  bash setup_Learning-Bash-Scripting-by-Sorting-a-Wine-Shed.sh Learning-Bash-Scripting-by-Sorting-a-Wine-Shed_New"
  exit 1
fi

echo "Setting up the Learning Bash Scripting by Sorting a Wine Shed in: $GAME_DIR"
mkdir -p "$GAME_DIR"
cd "$GAME_DIR"

mkdir -p scripts student_templates instructor_notes instructions faq student_notes
mkdir -p wine_shed_round1 baskets_round1
mkdir -p wine_shed_round2 baskets_round2
mkdir -p wine_shed_round3 baskets_round3
mkdir -p wine_shed_round4 baskets_round4 generated_round4

# Helper for wine file: shed, id, color, flavors, price
create_wine () {
  local shed="$1"; shift
  local id="$1"; local color="$2"; local flavors="$3"; local price="$4"
  {
    echo "color: ${color}"
    echo "flavors: ${flavors}"
    echo "price: ${price}"
  } > "${shed}/wine_${id}.txt"
}

# ------------------------------------------------------------
# ROUND 1: Manual mv. Small, readable, all deterministic.
# ------------------------------------------------------------
create_wine wine_shed_round1 01 "Red"   "cherry,oak"        18
create_wine wine_shed_round1 02 "Red"   "chocolate,plum"    22
create_wine wine_shed_round1 03 "White" "citrus,apple"      16
create_wine wine_shed_round1 04 "White" "vanilla,melon"     18
create_wine wine_shed_round1 05 "Rose"  "strawberry,berry"  15
create_wine wine_shed_round1 06 "Rose"  "floral,peach"      17

cat > orders_round1.csv <<'CSV'
customer_id,color,flavor
cust_01,Red,cherry
cust_02,White,citrus
cust_03,Rose,strawberry
CSV
mkdir -p baskets_round1/{cust_01,cust_02,cust_03}

cat > round1_manual_answer_key.txt <<'TXT'
Round 1 manual target moves:

mv wine_shed_round1/wine_01.txt baskets_round1/cust_01/
mv wine_shed_round1/wine_03.txt baskets_round1/cust_02/
mv wine_shed_round1/wine_05.txt baskets_round1/cust_03/

Other wines stay in the shed.
TXT

# ------------------------------------------------------------
# ROUND 2: First command/script. One customer, one decision.
# ------------------------------------------------------------
create_wine wine_shed_round2 01 "Red"   "cherry,oak"        18
create_wine wine_shed_round2 02 "Red"   "chocolate,plum"    22
create_wine wine_shed_round2 03 "Red"   "cherry,vanilla"    20
create_wine wine_shed_round2 04 "White" "citrus,apple"      16
create_wine wine_shed_round2 05 "White" "vanilla,melon"     18
create_wine wine_shed_round2 06 "Rose"  "strawberry,berry"  15
create_wine wine_shed_round2 07 "Rose"  "floral,peach"      17
create_wine wine_shed_round2 08 "Red"   "oak,pepper"        24

cat > orders_round2.csv <<'CSV'
customer_id,color,flavor
cust_01,Red,cherry
CSV
mkdir -p baskets_round2/cust_01

# ------------------------------------------------------------
# ROUND 3: Scaling. More wines, more customers, deterministic.
# ------------------------------------------------------------
create_wine wine_shed_round3 01 "Red"   "cherry,oak"        18
create_wine wine_shed_round3 02 "Red"   "cherry,vanilla"    20
create_wine wine_shed_round3 03 "Red"   "chocolate,plum"    22
create_wine wine_shed_round3 04 "Red"   "chocolate,pepper"  25
create_wine wine_shed_round3 05 "White" "citrus,apple"      16
create_wine wine_shed_round3 06 "White" "citrus,herbal"     14
create_wine wine_shed_round3 07 "White" "vanilla,melon"     18
create_wine wine_shed_round3 08 "White" "vanilla,honey"     21
create_wine wine_shed_round3 09 "Rose"  "strawberry,berry"  15
create_wine wine_shed_round3 10 "Rose"  "strawberry,melon"  16
create_wine wine_shed_round3 11 "Rose"  "floral,peach"      17
create_wine wine_shed_round3 12 "Rose"  "floral,citrus"     19
create_wine wine_shed_round3 13 "Red"   "smoke,oak"         26
create_wine wine_shed_round3 14 "White" "pear,minerals"     23
create_wine wine_shed_round3 15 "Rose"  "watermelon,mint"   18
create_wine wine_shed_round3 16 "Red"   "blackberry,cedar"  28

cat > orders_round3.csv <<'CSV'
customer_id,color,flavor
cust_01,Red,cherry
cust_02,Red,chocolate
cust_03,White,citrus
cust_04,White,vanilla
cust_05,Rose,strawberry
cust_06,Rose,floral
CSV
for i in $(seq 1 6); do mkdir -p "baskets_round3/cust_$(printf "%02d" "$i")"; done

# ------------------------------------------------------------
# ROUND 4: Automatically generated wines.
# ------------------------------------------------------------
cat > scripts/generate_round4.sh <<'GEN'
#!/usr/bin/env bash
set -euo pipefail

# Round 4 intentionally creates new data automatically.
# Run it again to get a different shed.

SHED="wine_shed_round4"
BASKETS="baskets_round4"
ORDERS="orders_round4.csv"

rm -rf "$SHED" "$BASKETS" generated_round4
mkdir -p "$SHED" "$BASKETS" generated_round4

colors=(Red White Rose)
flavors_red=(cherry chocolate plum oak pepper blackberry cedar smoke)
flavors_white=(citrus vanilla apple melon herbal honey pear minerals)
flavors_rose=(strawberry floral berry peach watermelon mint citrus melon)
prices=(12 14 15 16 18 20 22 25 28 30 35 40)

create_wine () {
  local shed="$1"; shift
  local id="$1"; local color="$2"; local flavors="$3"; local price="$4"
  {
    echo "color: ${color}"
    echo "flavors: ${flavors}"
    echo "price: ${price}"
  } > "${shed}/wine_${id}.txt"
}

# First create guaranteed matches so every customer can receive at least one wine.
create_wine "$SHED" 01 "Red"   "cherry,oak"        18
create_wine "$SHED" 02 "Red"   "cherry,vanilla"    20
create_wine "$SHED" 03 "Red"   "chocolate,plum"    22
create_wine "$SHED" 04 "Red"   "chocolate,pepper"  25
create_wine "$SHED" 05 "White" "citrus,apple"      16
create_wine "$SHED" 06 "White" "citrus,herbal"     14
create_wine "$SHED" 07 "White" "vanilla,melon"     18
create_wine "$SHED" 08 "White" "vanilla,honey"     21
create_wine "$SHED" 09 "Rose"  "strawberry,berry"  15
create_wine "$SHED" 10 "Rose"  "strawberry,melon"  16
create_wine "$SHED" 11 "Rose"  "floral,peach"      17
create_wine "$SHED" 12 "Rose"  "floral,citrus"     19

# Then create additional generated wines.
for i in $(seq -w 13 36); do
  color=${colors[$RANDOM % ${#colors[@]}]}
  if [[ "$color" == "Red" ]]; then pool=("${flavors_red[@]}"); fi
  if [[ "$color" == "White" ]]; then pool=("${flavors_white[@]}"); fi
  if [[ "$color" == "Rose" ]]; then pool=("${flavors_rose[@]}"); fi
  f1=${pool[$RANDOM % ${#pool[@]}]}
  f2=${pool[$RANDOM % ${#pool[@]}]}
  while [[ "$f2" == "$f1" ]]; do f2=${pool[$RANDOM % ${#pool[@]}]}; done
  price=${prices[$RANDOM % ${#prices[@]}]}
  create_wine "$SHED" "$i" "$color" "$f1,$f2" "$price"
done

cat > "$ORDERS" <<'CSV'
customer_id,color,flavor
cust_01,Red,cherry
cust_02,Red,chocolate
cust_03,White,citrus
cust_04,White,vanilla
cust_05,Rose,strawberry
cust_06,Rose,floral
CSV
for i in $(seq 1 6); do mkdir -p "$BASKETS/cust_$(printf "%02d" "$i")"; done

cat > generated_round4/README_round4_generated.txt <<'TXT'
Round 4 generated a new wine shed and new customer baskets.

The matching rule is the same as Round 3:
  color must match
  AND the wine must mention the requested flavor.

Because the wines are generated automatically, the exact number of matches can
change each time you run scripts/generate_round4.sh.
TXT

echo "Round 4 generated. Check: $SHED, $BASKETS, $ORDERS"
GEN
chmod +x scripts/generate_round4.sh

# ------------------------------------------------------------
# Student templates
# ------------------------------------------------------------
cat > student_templates/round2_sort_one_customer_template.sh <<'TPL'
#!/usr/bin/env bash
set -euo pipefail

# ROUND 2 TEMPLATE
# Goal: move every Red wine that mentions cherry into cust_01's basket.

CUSTOMER="cust_01"
COLOR="Red"
FLAVOR="cherry"
SHED="wine_shed_round2"
BASKET="baskets_round2/$CUSTOMER"

# Step 1: loop through each wine file in the shed.
for wine_file in "$SHED"/*.txt; do
  echo "Checking $wine_file"

  # Step 2: write an if statement that checks color.
  # Hint:
  # if grep -q "^color: $COLOR$" "$wine_file"; then

    # Step 3: inside the color check, write another if statement that checks flavor.
    # Hint:
    # if grep -q "flavors: .*$FLAVOR" "$wine_file"; then

      # Step 4: move the matching wine into the basket.
      # Hint:
      # mv "$wine_file" "$BASKET/"

    # fi
  # fi
done

echo "Done. Check $BASKET"
TPL
chmod +x student_templates/round2_sort_one_customer_template.sh

cat > student_templates/round3_sort_all_customers_template.sh <<'TPL'
#!/usr/bin/env bash
set -euo pipefail

# ROUND 3 TEMPLATE
# Goal: sort many wines for many customers.
# Matching rule:
#   color must match
#   AND the wine must mention the requested flavor.
#
# Important: a wine is a physical bottle. Once it is moved into one basket,
# it is no longer in the shed for later customers.

ORDERS="orders_round3.csv"
SHED="wine_shed_round3"
BASKETS="baskets_round3"

# Step 1: read orders, skipping the header.
tail -n +2 "$ORDERS" | while IFS=',' read -r customer_id color flavor; do
  echo "Processing $customer_id: wants $color wine with $flavor"

  # Step 2: loop through every wine file still in the shed.
  for wine_file in "$SHED"/*.txt; do
    [[ -e "$wine_file" ]] || continue

    # TODO: check whether color matches.
    # TODO: check whether flavor matches.
    # TODO: move the matching wine into this customer's basket.

  done
done

echo "Done. Check $BASKETS/"
TPL
chmod +x student_templates/round3_sort_all_customers_template.sh

cat > student_templates/round4_run_generated_template.sh <<'TPL'
#!/usr/bin/env bash
set -euo pipefail

# ROUND 4 TEMPLATE
# First generate a new shed:
#   bash scripts/generate_round4.sh
#
# Then adapt your Round 3 script so it uses:
#   ORDERS="orders_round4.csv"
#   SHED="wine_shed_round4"
#   BASKETS="baskets_round4"
#
# Question to answer in summary.txt:
# Did your approach still work when the files were generated automatically?
# What broke, what still worked, and what would you improve?

bash scripts/generate_round4.sh

# TODO: run your adapted sorter here.
# Example after you create it:
# bash sort_round4.sh
TPL
chmod +x student_templates/round4_run_generated_template.sh

# ------------------------------------------------------------
# Helper scripts
# ------------------------------------------------------------
cat > scripts/check_baskets.sh <<'CHK'
#!/usr/bin/env bash
set -euo pipefail

ROUND="${1:-round1}"
BASKETS="baskets_${ROUND}"

if [[ ! -d "$BASKETS" ]]; then
  echo "Could not find $BASKETS"
  echo "Usage examples:"
  echo "  bash scripts/check_baskets.sh round1"
  echo "  bash scripts/check_baskets.sh round2"
  echo "  bash scripts/check_baskets.sh round3"
  echo "  bash scripts/check_baskets.sh round4"
  exit 1
fi

echo "Basket check for $BASKETS"
for basket in "$BASKETS"/*; do
  [[ -d "$basket" ]] || continue
  count=$(find "$basket" -maxdepth 1 -name 'wine_*.txt' | wc -l | tr -d ' ')
  echo "$(basename "$basket"): $count wine(s)"
  ls "$basket" 2>/dev/null | sed 's/^/  - /' || true
done
CHK
chmod +x scripts/check_baskets.sh

cat > scripts/peek_wine.sh <<'PEEK'
#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: bash scripts/peek_wine.sh path/to/wine_file.txt"
  exit 1
fi

wine_file="$1"
if [[ ! -f "$wine_file" ]]; then
  echo "Could not find: $wine_file"
  exit 1
fi

echo "----- $wine_file -----"
cat "$wine_file"
PEEK
chmod +x scripts/peek_wine.sh

cat > scripts/reset_warning.txt <<'TXT'
To reset the game, rerun the setup script into a fresh folder:

  cd ..
  bash setup_Learning-Bash-Scripting-by-Sorting-a-Wine-Shed.sh Learning-Bash-Scripting-by-Sorting-a-Wine-Shed_Reset

This is safer than trying to undo many mv commands.
TXT

# ------------------------------------------------------------
# Instructor notes and solutions
# ------------------------------------------------------------
cat > instructor_notes/solution_round2.sh <<'SOL'
#!/usr/bin/env bash
set -euo pipefail

CUSTOMER="cust_01"
COLOR="Red"
FLAVOR="cherry"
SHED="wine_shed_round2"
BASKET="baskets_round2/$CUSTOMER"

for wine_file in "$SHED"/*.txt; do
  [[ -e "$wine_file" ]] || continue
  if grep -q "^color: $COLOR$" "$wine_file"; then
    if grep -q "flavors: .*$FLAVOR" "$wine_file"; then
      echo "Moving $(basename "$wine_file") to $CUSTOMER"
      mv "$wine_file" "$BASKET/"
    fi
  fi
done

echo "Done. Check $BASKET"
SOL
chmod +x instructor_notes/solution_round2.sh

cat > instructor_notes/solution_round3.sh <<'SOL'
#!/usr/bin/env bash
set -euo pipefail

ORDERS="orders_round3.csv"
SHED="wine_shed_round3"
BASKETS="baskets_round3"

tail -n +2 "$ORDERS" | while IFS=',' read -r customer_id color flavor; do
  echo "Processing $customer_id: wants $color wine with $flavor"
  for wine_file in "$SHED"/*.txt; do
    [[ -e "$wine_file" ]] || continue
    if grep -q "^color: $color$" "$wine_file"; then
      if grep -q "flavors: .*$flavor" "$wine_file"; then
        echo "  -> $(basename "$wine_file") to $customer_id"
        mv "$wine_file" "$BASKETS/$customer_id/"
      fi
    fi
  done
done

echo "Done. Check $BASKETS/"
SOL
chmod +x instructor_notes/solution_round3.sh

cat > instructor_notes/solution_round4.sh <<'SOL'
#!/usr/bin/env bash
set -euo pipefail

ORDERS="orders_round4.csv"
SHED="wine_shed_round4"
BASKETS="baskets_round4"

tail -n +2 "$ORDERS" | while IFS=',' read -r customer_id color flavor; do
  echo "Processing $customer_id: wants $color wine with $flavor"
  for wine_file in "$SHED"/*.txt; do
    [[ -e "$wine_file" ]] || continue
    if grep -q "^color: $color$" "$wine_file"; then
      if grep -q "flavors: .*$flavor" "$wine_file"; then
        echo "  -> $(basename "$wine_file") to $customer_id"
        mv "$wine_file" "$BASKETS/$customer_id/"
      fi
    fi
  done
done

echo "Done. Check $BASKETS/"
SOL
chmod +x instructor_notes/solution_round4.sh

cat > instructor_notes/teaching_notes.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed teaching notes
========================

Core sequence:
1. Learning Unix Basics in a Virtual House: navigation, reading files, and a first nano script.
2. Learning Bash Scripting by Sorting a Wine Shed: manual sorting -> one command -> scaling -> generated data.
3. Getting Hands-On with MRI #1: Converting DICOM to NIfTI: DICOM-to-NIfTI with GUI, command line, and a script.
4. Learning Remote Computing in a Virtual Laundromat: local vs remote computing, scp/ssh, batch jobs.
5. Lesion Game: brain-data QC and identifying lesion-related abnormalities.

Recommended pacing:
- Round 1: 15-20 minutes. Students do manual mv and write pseudocode.
- Round 2: 20-30 minutes. Students complete one customer sorter.
- Round 3: 30-45 minutes. Students scale to many customers.
- Round 4: optional challenge or homework.

Key teaching point:
The purpose is not to make students memorize Bash. The purpose is to show why
scripts exist: they turn a manual rule into a reproducible workflow.

Important caveat:
A wine is a physical object. The scripts use mv, not cp. Once a bottle is moved
from the shed, it cannot also be moved to another customer's basket.

Troubleshooting:
- If students accidentally move the wrong files, have them rerun setup into a
  new folder rather than manually undoing everything.
- If a script says no such file or directory, ask them to run pwd and ls first.
- If a script cannot run directly, use bash scriptname.sh or chmod +x.
TXT

# ------------------------------------------------------------
# WALKTHROUGH (full round-by-round guide, kept alongside README.txt)
# ------------------------------------------------------------
cat > WALKTHROUGH.txt <<'README'
Learning Bash Scripting by Sorting a Wine Shed — Full Walkthrough
=======================================================

Welcome to the Learning Bash Scripting by Sorting a Wine Shed.

This game teaches how manual command-line work becomes automation. You will
start by moving wine files by hand, then write your first command/script, then
ask whether that approach scales, and finally test it on automatically generated
files.

If you have not played the Learning Unix Basics in a Virtual House yet, play that first. Learning Unix Basics in a Virtual House teaches:
  pwd, ls, cd, cat, nano, folders, paths, and reading instructions.

Why this matters for MRI
------------------------
In MRI work, you often need to inspect files, make decisions, and repeat the
same rule across many subjects. A script lets you do the same task consistently
instead of manually repeating commands one at a time.

The story
---------
You are helping at a Finger Lakes-style winery. The wine shed is messy. Each
wine file has a color, a flavor list, and a price. Customers have orders. Your
job is to move matching wines from the shed into customer baskets.

Important rule
--------------
This game uses mv, not cp. A bottle of wine is physical. Once it is moved into
one customer's basket, it is no longer in the shed for another customer.

Getting started
---------------
From the folder that contains this game, enter:

  cd Learning-Bash-Scripting-by-Sorting-a-Wine-Shed

Then check where you are:

  pwd

Then list what is here:

  ls

Round 1: Manual mv
------------------
Goal: Move a few wines by hand and think about how you would automate the rule.

1. Read the orders:

  cat orders_round1.csv

2. Inspect the shed:

  ls wine_shed_round1
  cat wine_shed_round1/wine_01.txt

3. Move matching wines by hand using mv.

Example:

  mv wine_shed_round1/wine_01.txt baskets_round1/cust_01/

4. Check your baskets:

  bash scripts/check_baskets.sh round1

5. Write pseudocode:

  nano pseudocode_round1.txt

Answer these questions:
- What information did you check in each wine file?
- What made you decide to move a wine?
- What steps repeated?
- Which steps could a script do for you?

Round 2: Your first command/script
----------------------------------
Goal: Write a tiny script for one customer.

The order is:

  cat orders_round2.csv

The customer wants Red wine that mentions cherry.

Open the starter:

  nano student_templates/round2_sort_one_customer_template.sh

You may copy it into your main folder before editing:

  cp student_templates/round2_sort_one_customer_template.sh sort_round2.sh
  nano sort_round2.sh

Run it:

  bash sort_round2.sh

Check your basket:

  bash scripts/check_baskets.sh round2

Round 3: Does your approach scale?
----------------------------------
Goal: Sort many wines for many customers using the same logic.

Read the orders:

  cat orders_round3.csv

Inspect the larger shed:

  ls wine_shed_round3

Copy the starter:

  cp student_templates/round3_sort_all_customers_template.sh sort_round3.sh
  nano sort_round3.sh

Run it:

  bash sort_round3.sh

Check results:

  bash scripts/check_baskets.sh round3

Reflection:
- What changed from Round 2 to Round 3?
- Which part of your code repeated?
- Why is a loop useful here?

Round 4: Automatically generated wines
--------------------------------------
Goal: Test whether your approach still works when the files are generated for
you automatically.

Generate a new shed:

  bash scripts/generate_round4.sh

Look at the new files:

  ls wine_shed_round4
  cat orders_round4.csv

Adapt your Round 3 script so it uses:

  ORDERS="orders_round4.csv"
  SHED="wine_shed_round4"
  BASKETS="baskets_round4"

Run it and check:

  bash scripts/check_baskets.sh round4

Deliverables
------------
1. pseudocode_round1.txt
2. sort_round2.sh
3. sort_round3.sh
4. Optional: sort_round4.sh
5. Optional: summary.txt answering what scaled and what broke

Cheatsheet
----------
pwd              print working directory
ls               list files
cd               change directory
cat              read a file
nano             edit a file
mv               move a file
grep -q          quietly test whether text appears in a file
tail -n +2       skip the header row of a CSV
while read       read one line at a time
for ... do       loop over many files
if ... then      make a decision
chmod +x         make a script executable
bash file.sh     run a Bash script
./file.sh        run an executable script in the current folder

Nano reminder
-------------
Open a file:

  nano filename.txt

Save:

  Ctrl + O, then Enter

Exit:

  Ctrl + X
README

cat > instructions/Part_1_Start_Here.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed: Part 1 - Start Here
==============================

What is this game?
You are helping at a messy wine shed. Each wine file has a color, a flavor list,
and a price. Customers have orders. Your job is to inspect files and move the
matching wines into customer baskets.

What should I already know?
Play the Learning Unix Basics in a Virtual House first if possible. You should be able to use pwd, ls, cd,
cat, nano, and basic paths before starting this game.

First commands:
  pwd
  ls
  cat orders_round1.csv
  ls wine_shed_round1
  cat wine_shed_round1/wine_01.txt

Main idea:
Round 1 is manual. Later rounds ask you to turn the same decision into a script.
This is the same jump researchers make when they stop processing files one by
one and start using reproducible workflows.
TXT

cat > instructions/Part_2_Round_1_Manual_Sorting.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed: Part 2 - Round 1 Manual Sorting
==========================================

Goal:
Move a few wines by hand and write down the rule you are using.

Steps:
1. Read the orders.
     cat orders_round1.csv

2. Inspect the shed.
     ls wine_shed_round1
     cat wine_shed_round1/wine_01.txt

3. Move matching wines by hand.
     mv wine_shed_round1/wine_01.txt baskets_round1/cust_01/

4. Check your baskets.
     bash scripts/check_baskets.sh round1

5. Write pseudocode.
     nano pseudocode_round1.txt

Questions to answer in pseudocode_round1.txt:
- What information did you check in each wine file?
- What made you decide to move a wine?
- What steps repeated?
- Which steps could a script do for you?

Then pause and answer the Round 1 reflection:

  nano student_notes/round1_reflection.txt

Reminder:
This game uses mv, not cp. A bottle can only go to one customer because moving a
file removes it from the shed.
TXT

cat > instructions/Part_3_Round_2_First_Script.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed: Part 3 - Round 2 First Script
========================================

Goal:
Write a tiny script for one customer.

The order:
  cat orders_round2.csv

The customer wants Red wine that mentions cherry.

Copy the starter before editing:
  cp student_templates/round2_sort_one_customer_template.sh sort_round2.sh
  nano sort_round2.sh

Commands and concepts:
- for loops check many files.
- grep searches inside a file.
- if statements decide whether a file matches.
- mv moves the matching file.
- variables store reusable values like COLOR, FLAVOR, SHED, and BASKET.

Run your script:
  bash sort_round2.sh

Check your basket:
  bash scripts/check_baskets.sh round2

If no wines move:
Run pwd and ls first. Then use cat on one wine file and compare the exact color
and flavor text to your grep commands.

Pause and answer:

  nano student_notes/round2_reflection.txt
TXT

cat > instructions/Part_4_Round_3_Scaling_Up.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed: Part 4 - Round 3 Scaling Up
======================================

Goal:
Sort many wines for many customers using the same logic from Round 2.

Read the orders:
  cat orders_round3.csv

Inspect the larger shed:
  ls wine_shed_round3

Copy the starter:
  cp student_templates/round3_sort_all_customers_template.sh sort_round3.sh
  nano sort_round3.sh

Run it:
  bash sort_round3.sh

Check results:
  bash scripts/check_baskets.sh round3

Reflection:
- What changed from Round 2 to Round 3?
- Which part of your code repeated?
- Why is a loop useful here?

Open the Round 3 reflection while the scaling step is still fresh:

  nano student_notes/round3_reflection.txt

Research connection:
Many lab tasks involve applying the same rule to many subjects, scans, folders,
or outputs. Round 3 is where the game starts to feel like a real workflow.
TXT

cat > instructions/Part_5_Round_4_Generated_Data.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed: Part 5 - Round 4 Generated Data
==========================================

Goal:
Test whether your approach still works when the files are generated for you
automatically.

Generate a new shed:
  bash scripts/generate_round4.sh

Look at the new files:
  ls wine_shed_round4
  cat orders_round4.csv

Adapt your Round 3 script so it uses:
  ORDERS="orders_round4.csv"
  SHED="wine_shed_round4"
  BASKETS="baskets_round4"

Run it and check:
  bash scripts/check_baskets.sh round4

Question for summary.txt:
Did your approach still work when the files changed? What broke, what still
worked, and what would you improve?

Open the Round 4 reflection:

  nano student_notes/round4_reflection.txt
TXT

cat > student_notes/round1_reflection.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed Round 1 Reflection - Manual Sorting
=============================================

Open this after Round 1:

  nano student_notes/round1_reflection.txt

1. What information did you inspect before moving a wine?


2. What rule told you a wine belonged in a customer's basket?


3. What part of the work felt repetitive?


4. How is manual sorting useful before writing a script?


5. What would be risky about doing this by hand for 100 files?


TXT

cat > student_notes/round2_reflection.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed Round 2 Reflection - First Script
===========================================

Open this after Round 2:

  nano student_notes/round2_reflection.txt

1. What did your first sorting script do?


2. What did grep help the script check?


3. What did the if statements help the script decide?


4. What moved from the shed into the basket?


5. What would you check first if the script moved zero wines?


TXT

cat > student_notes/round3_reflection.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed Round 3 Reflection - Scaling Up
=========================================

Open this after Round 3:

  nano student_notes/round3_reflection.txt

1. What changed when you went from one customer to many customers?


2. Which part of your code repeated?


3. Why is a loop useful here?


4. How does this connect to processing many MRI subjects or files?


5. What part of the scaling step still feels confusing?


TXT

cat > student_notes/round4_reflection.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed Round 4 Reflection - Generated Data
=============================================

Open this after Round 4:

  nano student_notes/round4_reflection.txt

1. Did your approach still work when the files were generated automatically?


2. What broke, if anything?


3. What still worked?


4. What would you improve before using this approach on real research files?


5. Why is it useful to test a script on new data?


TXT

cat > instructions/Part_6_Deliverables_and_Cheatsheet.txt <<'TXT'
Learning Bash Scripting by Sorting a Wine Shed: Part 6 - Deliverables and Cheatsheet
===============================================

Deliverables:
1. pseudocode_round1.txt
2. sort_round2.sh
3. sort_round3.sh
4. Optional: sort_round4.sh
5. Optional: summary.txt answering what scaled and what broke
6. Round reflections in student_notes/

Cheatsheet:
pwd              print working directory
ls               list files
cd               change directory
cat              read a file
nano             edit a file
mv               move a file
grep -q          quietly test whether text appears in a file
tail -n +2       skip the header row of a CSV
while read       read one line at a time
for ... do       loop over many files
if ... then      make a decision
chmod +x         make a script executable
bash file.sh     run a Bash script
./file.sh        run an executable script in the current folder

Nano reminder:
Open: nano filename.txt
Save: Ctrl + O, then Enter
Exit: Ctrl + X
TXT

cat > faq/FAQ.txt <<'TXT'
WINE GAME FAQ
=============

What is the goal?
Learn how a manual file-sorting rule becomes a script. You start by moving a few
files by hand, then write Bash logic that searches, decides, and moves matching
files.

Why does this matter for neuroimaging?
MRI labs constantly search through folders, identify files that match criteria,
and process them consistently. The Learning Bash Scripting by Sorting a Wine Shed makes that pattern visible before
students touch real brain data.

Where should I start?
Read README.txt, then instructions/Part_1_Start_Here.txt. After that, move
through the numbered parts in order.

What commands matter most?
mv, grep, for, if, variables, bash, cat, ls, pwd, nano, and
bash scripts/check_baskets.sh.

Common problem: my script moved zero wines.
Check the exact text inside a wine file with cat. Then compare the color and
flavor to your grep pattern. Also check whether matching wines were already
moved out of the shed.

Common problem: "No such file or directory."
Run pwd and ls. Make sure you are inside the Learning-Bash-Scripting-by-Sorting-a-Wine-Shed folder and that the round
folder names match exactly.

Common problem: I edited the template by accident.
Copy the template again into a new file, then edit the copy:
cp student_templates/round2_sort_one_customer_template.sh sort_round2_retry.sh

Where should I look for help?
Use the numbered instruction files, scripts/reset_warning.txt, and the
student_templates folder. If asking for help, share pwd, ls, and the exact error.
TXT

cat > README.txt <<'README_INDEX'
Learning Bash Scripting by Sorting a Wine Shed
====================================

Welcome to the Learning Bash Scripting by Sorting a Wine Shed.

This game teaches how manual command-line work becomes automation. You will
start by moving wine files by hand, then write a first script, then test whether
that approach scales.

Read these files in order:
1. instructions/Part_1_Start_Here.txt
2. instructions/Part_2_Round_1_Manual_Sorting.txt
3. instructions/Part_3_Round_2_First_Script.txt
4. instructions/Part_4_Round_3_Scaling_Up.txt
5. instructions/Part_5_Round_4_Generated_Data.txt
6. instructions/Part_6_Deliverables_and_Cheatsheet.txt
7. faq/FAQ.txt

Prefer everything in one place? Read the full round-by-round walkthrough:
  cat WALKTHROUGH.txt

Quick start:
  pwd
  ls
  cat instructions/Part_1_Start_Here.txt

If you have not played the Learning Unix Basics in a Virtual House yet, play that first. Learning Unix Basics in a Virtual House teaches
folders, paths, reading files, and basic Terminal movement.
README_INDEX

echo "Learning Bash Scripting by Sorting a Wine Shed setup complete."
echo "Start with: cd $GAME_DIR && cat README.txt"

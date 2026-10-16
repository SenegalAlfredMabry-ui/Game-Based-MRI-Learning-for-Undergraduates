#!/usr/bin/env bash

# ============================================================
# Round_2_Sorting_Assistant.sh
# A tiny Learning-Bash-Scripting-by-Sorting-a-Wine-Shed helper for ROUND 2.
#
# Run this from inside your Learning-Bash-Scripting-by-Sorting-a-Wine-Shed folder:
#   cd Learning-Bash-Scripting-by-Sorting-a-Wine-Shed
#   bash Round_2_Sorting_Assistant.sh
#
# This script teaches:
#   read  = ask the user a question
#   for   = look through many wine files
#   if    = check whether a wine matches
#   grep  = search inside a file
#   mv    = move the matching wine
# ============================================================

SHED="wine_shed_round2"
BASKETS="baskets_round2"

# If there are no .txt files, the loop should not crash.
shopt -s nullglob

# Make sure we are inside the Learning-Bash-Scripting-by-Sorting-a-Wine-Shed folder.
if [ ! -d "$SHED" ]; then
  echo "I cannot find $SHED."
  echo "Run me from inside the Learning-Bash-Scripting-by-Sorting-a-Wine-Shed folder:"
  echo "  cd Learning-Bash-Scripting-by-Sorting-a-Wine-Shed"
  echo "  bash Round_2_Sorting_Assistant.sh"
  exit 1
fi

echo "🍷 Hello, I am SommelierBot (Round 2)."
echo "I search the bigger wine shed and move matching wines."
echo

# Ask what the student wants.
read -p "Wine color? Example: Red, White, Rose: " COLOR
read -p "Flavor? Example: cherry, citrus, oak: " FLAVOR
read -p "Customer basket? Example: cust_01: " CUSTOMER

# Create the customer basket if it does not exist.
mkdir -p "$BASKETS/$CUSTOMER"

echo
echo "Searching $SHED for $COLOR wines with $FLAVOR..."
echo

COUNT=0

# Look through every wine file in Round 2.
for WINE in "$SHED"/*.txt; do

  # Move the wine only if BOTH color and flavor match.
  if grep -qi "^color: $COLOR$" "$WINE" && grep -qi "flavors: .*$FLAVOR" "$WINE"; then
    echo "Moving $(basename "$WINE")"
    mv "$WINE" "$BASKETS/$CUSTOMER/"
    COUNT=$((COUNT + 1))
  fi

done

echo
echo "Done. I moved $COUNT wine(s) to $BASKETS/$CUSTOMER."

if [ "$COUNT" -eq 0 ]; then
  echo "No matches found."
  echo "Try another color or flavor, or check whether the matching wines were already moved."
fi

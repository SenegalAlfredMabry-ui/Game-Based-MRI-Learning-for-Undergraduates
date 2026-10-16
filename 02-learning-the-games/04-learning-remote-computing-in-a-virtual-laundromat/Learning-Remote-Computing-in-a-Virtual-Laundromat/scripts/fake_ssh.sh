#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# fake_ssh.sh
# This simulates logging into a remote computer.

TARGET="$1"

echo "Connecting to $TARGET..."
read -s -p "Password: " PASSWORD
echo

if [ "$PASSWORD" = "spin-cycle-42" ]; then
  echo "Login accepted."
  echo "Welcome to the PI Laundromat."
  echo "Remote folders are inside remote_laundromat/"
  echo "Try:"
  echo "  ls remote_laundromat"
else
  echo "Login failed."
  echo "Hint: ask your instructor for the laundry password."
  exit 1
fi

#!/bin/zsh
# A script to repair a corrupted .zsh_history file

HISTORY_FILE="$HOME/zsh/.zsh_history"
BACKUP_FILE="$HOME/zsh/.zsh_history_bad"

echo "Attempting to repair $HISTORY_FILE..."

# 1. Create a backup of the corrupted file
cp "$HISTORY_FILE" "$BACKUP_FILE"

# 2. Use strings to extract valid text and write to a temporary file
# The -e S flag ensures we look for standard 8-bit characters
strings -e S "$BACKUP_FILE" >"$HISTORY_FILE"

# 3. Reload the history into the current session
fc -R "$HISTORY_FILE"

echo "Done! If your history looks correct, you can delete $BACKUP_FILE."
echo "Tip: Run 'history' to verify."

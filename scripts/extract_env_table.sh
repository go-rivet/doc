#!/bin/bash

# Check if a file was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename.md>"
    exit 1
fi

TARGET_FILE="$1"

# Check if the file actually exists
if [ ! -f "$TARGET_FILE" ]; then
    echo "Error: File '$TARGET_FILE' not found."
    exit 1
fi

# Print the Markdown table headers
echo "| Env | Description |"
echo "| :--- | :--- |"

# Filter, parse, and sort rows
grep "RIVET" "$TARGET_FILE" | awk -F '|' '{
    env = ""
    # Loop through all fields to find the one containing RIVET
    for (i = 1; i <= NF; i++) {
        if ($i ~ /RIVET/) {
            env = $i
            break
        }
    }
    
    # The description is always the second-to-last field
    desc = $(NF-1)
    
    # Clean up leading/trailing whitespaces
    gsub(/^[ \t]+|[ \t]+$/, "", env)
    gsub(/^[ \t]+|[ \t]+$/, "", desc)
    
    # Print the row if an environment variable was found
    if (env != "") {
        print "| " env " | " desc " |"
    }
}' | sort -t '|' -k 2,2

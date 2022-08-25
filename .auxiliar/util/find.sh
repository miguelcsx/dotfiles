#!/bin/bash

# Check if the user has provided the root directory and language
if [ $# -ne 2 ]; then
  echo "Usage: $0 /path/to/root <language>"
  exit 1
fi

ROOT_DIR=$1
LANGUAGE=$2
OUTPUT_DIR="./.auxiliar/util"

# Check if the provided argument is a directory
if [ ! -d "$ROOT_DIR" ]; then
  echo "Error: $ROOT_DIR is not a directory."
  exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Construct the filename to search for
FILE_NAME="${LANGUAGE}.py"

# Define the output file names
CONTAINS_FILE="$OUTPUT_DIR/${LANGUAGE}_yes.txt"
DOES_NOT_CONTAIN_FILE="$OUTPUT_DIR/${LANGUAGE}_not.txt"

# Find subdirectories containing the specified file, excluding __pycache__
contains_temp=$(mktemp)
find "$ROOT_DIR" -type f -name "$FILE_NAME" ! -path '*/__pycache__/*' -exec dirname {} \; | sort -u > "$contains_temp"

# Save the directories that contain the specified file
cat "$contains_temp" > "$CONTAINS_FILE"

# Find all subdirectories under the root directory, excluding __pycache__
all_subdirs=$(mktemp)
find "$ROOT_DIR" -type d ! -path '*/__pycache__/*' | sort -u > "$all_subdirs"

# Save the directories that do not contain the specified file
grep -Fxv -f "$contains_temp" "$all_subdirs" > "$DOES_NOT_CONTAIN_FILE"

# Clean up temporary files
rm "$contains_temp" "$all_subdirs"

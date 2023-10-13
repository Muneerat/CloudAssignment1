#!/bin/bash
#Create a bash script that accepts the directory paths as arguments. 
#For each argument, list the contents of each listed at the top
#the script should accepts an additional argument "a" or "d" that sorts the contents of 
#each directory in either ascending or descending order

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 [a|d] directory1 [directory2 directory3 ...]"
  exit 1
fi

# Check the sorting order argument
sorting_order="$1"
if [ "$sorting_order" != "a" ] && [ "$sorting_order" != "d" ]; then
  echo "Error: Sorting order must be 'a' for ascending or 'd' for descending."
  exit 1
fi

shift 1  # Remove the sorting order argument

# Loop through the provided directory paths
for directory in "$@"; do
  # Check if the path is a valid directory
  if [ -d "$directory" ]; then
    echo "Contents of $directory (sorted $sorting_order):"
    if [ "$sorting_order" == "a" ]; then
      # List the contents of the directory in ascending order
      ls -l "$directory" | sort
    else
      # List the contents of the directory in descending order
      ls -l "$directory" | sort -r
    fi
    echo
  else
    echo "Error: $directory is not a valid directory."
  fi
done

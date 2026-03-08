#!/bin/sh
set -u

# Assignment instructions:
#
# 9) Write a shell script finder-app/finder.sh as described below:
#
# Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, 
# referred to below as filesdir; the second argument is a text string which will be searched within these files, 
# referred to below as searchstr
#
# Exits with return value 1 error and print statements if any of the parameters above were not specified
#
# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
#
# Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files 
# in the directory and all subdirectories and Y is the number of matching lines found in respective files, 
# where a matching line refers to a line which contains searchstr (and may also contain additional content).
#
# Example invocation:
#
#       finder.sh /tmp/aesd/assignment1 linux
#

# Check for correct number of arguments
if [ $# -ne 2 ]
then
    echo "Error: Number of arguments provided is not equal to 2!"
    exit 1
fi

# Get arugments
filesdir=$1
searchstr=$2

# Check that filesdir is a valid directory
if [ ! -d $filesdir ]
then
    echo "Error: Invalid directory provided = $filesdir"
    exit 1
fi

# Find the number of files with matching string
matching_files_list=$(grep -rl "$searchstr" "$filesdir")

# Count the number of files with matching string
num_files=$(echo "$matching_files_list" | grep -c .)

# Count the number of lines with matching string
num_lines=$(grep -rh "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_lines"

exit 0

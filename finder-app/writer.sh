#!/bin/sh
set -u

# 10) Write a shell script finder-app/writer.sh as described below
#
# Accepts the following arguments: 
# the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; 
# the second argument is a text string which will be written within this file, referred to below as writestr
#
# Exits with value 1 error and print statements if any of the arguments above were not specified
#
# Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating 
# the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.
#
# Example:
#
#        writer.sh /tmp/aesd/assignment1/sample.txt ios
#
# Creates file:
#
#     /tmp/aesd/assignment1/sample.txt
#
#             With content:
#
#             ios
#

# Check for correct number of arguments
if [ $# -ne 2 ]
then
    echo "Error: Number of arguments provided is not equal to 2!"
    exit 1
fi

# Get arugments
writefile=$1
writestr=$2

# Create folder if it does not exist
mkdir -p "$(dirname $writefile)"

# Write content to file
printf "%s" "$writestr" > "$writefile"
status=$?

# Give an error if the write was not successful
if [ $status -ne 0 ]
then
    echo "Error: Write file failed with status $status"
    exit 1
fi

exit 0

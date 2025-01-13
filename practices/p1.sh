#!/usr/bin/bash
#Author: Moonwar Al Wardiful
#Date: 13-01-2025
#Description: This is my Practice bash Shell file
# name="John"
# age=25
# price=99.99
# readonly CONSTANT="I cannot be changed"

# if [ $age -ge 20 ]; then
#     echo "name : $name, age: $age"
# fi
# echo $@

# read -n 1 -p "Enter a character: " a
# echo  # To move to the next line after the silent input
# case $a in
#     [a-z])
#         echo "Lower Case"
#         ;;
#     [A-Z])
#         echo "Upper Case"
#         ;;
#     [0-9])
#         echo "Number"
#         ;;
#     *)
#         echo "Special Character"
#         ;;
# esac

# function greet() {
#     echo "Hello, $1!"
# }
# function add() {
#     echo "$(($1 + $2))"
# }

# greet "John"
# add 1 2

# echo "Hello" > output.txt
# echo "World" > output.txt
# echo "Hello World" >> output.txt
# file="output.txt"
# if [ -f "$file" ]; then
#     echo "File Exists"
# else
#     echo "No file found"
# fi

# if [ -w "$file" ] && [ -r "$file" ]; then
#     echo "File is  Writable Readable"
# elif [ -x "$file" ]; then 
#     echo "File is executable"
# else
#     echo "Done"
# fi

##Error handling
if [ $? -eq 0 ]; then 
    echo "Previous command successful"
else
    echo "Previous command failed"
fi

#Error Handling function
handle_error() {
    echo "Error: $1" >&2
    exit 1
}
command || handle_error "command failed"
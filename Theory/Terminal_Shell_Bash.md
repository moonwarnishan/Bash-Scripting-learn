# Shell
A shell is a computer interface to an operating system. 
Shells expose the OS's services to human users or other programs.

The shell takes our commands and gives them to the operating system to perform.

It's named a shell because it is the outer layer around the OS, like the shell around an oyster!

# Terminal
A terminal is a program that runs a shell. Originally, terminals were physical devices, but these days we works with software terminal. 

# Bash
On most Linux-based systems, the default shell program is Bash. There are many other shells, but bash is currently the most popular

The name "Basj is an acronym for "Bourne-Again-Shell", a punny reference to Stephen Bourne, the creator of Bash's direct ancestor shell, sh.
Bash runs on pretty much every version of UNix and Unix-like systems.

Terminal -> Shell -> OS

# Commands are Case sensitive. 

# Commands Structure
    `command -options arguments`
    Most commands support multiple options that modify their behavior. We can decide which options to include, if any when we execute a command.
    Similarly, many commands accept arguments (the things that the command acts upon or uses)
## Arguments
    The terms "argument" and "parameter" are often used interchangeably to refer to values that we provide to commands.

    The echo command is extremely simple. It takes the arguments we provide to it and prints them out. It echoes them back at us. 
# Types of commands
    There are really four types of commands:
    - An executable program, usually stored in /bin, /usr/bin, or /usr/local/bin. These are compiled binary files. (hence bin)
    - A build-in shell command. These commands are part of the shell(bash in our case)
    - A shell function
    -An alias
    `type command`


# Some commands
    - `xdg-open /` : open / directory in graphical order
    - `xdg-open ~` : open Home directory in graphical order
    - `pwd` : print working directory
    - `ls` : The list command will list the contents of a directory
    - `ls -l` : long version of contents with details
    - `ls -a` : shows all files including (.). also hidden files 
    - `cd <path>` : the cd command is used to change the current working directory, "moving" into     another directory.
    - `touch <file name>` : To create a new file from the command line, use the touch command. Provide a file name and that file wil be created for you.
    - `file <file name>` : The file command can be used to determine the file type of a specified file.
    - `mkdir <folder name>` : To create new directories, we use thr make directory command. We provide one or more directory names and it will create them for us.
    
# Nano
    Nano is a simple text editor that we can access right from the terminal. Its far more accessible than other popular command-line editors like vim and emacs.
    Nano includes all the basic text editing functionality you would expect: search, spellcheck, syntax highlighting etc.
    
    To open up a file using nano run `nano FILE`. 
    for example `nano book.txt`

 ## New file opening
    -  `nano <filename>` it will create new file
 We can also provide nano with a specific line number to position the cursor at using nano +LINE FILE
 ## Searching
    Use `crtl-W`and then enter a search phrase to search FORWARD in the file from your current cursor location.
 ## Spell Checking

# Deleting, Moving And Copying
    - `rm app.js` : we use the remove command to remove files from our machine.for example `rm app.js`
    [Note: rm Delete Files, There is no undo or recycling bin to retrieve them from! They are gone!]
    - `rm -d cats` : To delete empty folders we need to use the -d option with rm. (only if it's already epty folder)
    - `rm -r cats` : TO delete folder that are NOT empty, use the -r option.
    - `mv <source> <destination>` : Use the move command to move files and directories from one location to another.
    - `mv <current> <newname>` : We can also use the move command to rename files and folders.
    - `cp <source> <destination>` : We can use the copy command to create copies of files and folders.
# Short cuts
    - `ctrl -l` : to clear the entire screen.
    - `ctrl -a` : to move the cursor to the beginning of the line.
    - `ctrl -e` : to move the cursor to the end of the line.
    - `ctrl -f` : to move the cursor forward one character at a time. same as the right arrow
    - `ctrl -b` : to move the cursor backwards one character at a time. Same as the left arrow
    - `alt -f` : to move the cursor forward one word.
    - `alt -b` : to move the cursor backwards one word.
    - `ctrl -t` : to swap the current character under the cursor with the one preceding it. This can be useful to correct typos made by typing to quickly.
    - `ctrl -k` : to kill the text from the current cursor location until the end of the line. ->
    - `ctrl -u` : to kill the text from the current cursor location to the beginning of the line <-
    - `alt -d` : to kill the text from the current cursor location through the end of the word.
    - ` ctrl -w or alt -delete` : to kill the text from the current cursor through the beginning of the word.
    - `ctrl -y`: we can retrieve the most recently killed text using This
    - `history` : we can also use the history command to view the entire history
    - `history | less` : displays shell command history in a scrollable view using the less pager.
    - `!<number>` : we can easily re-run an easier command if we have its line number from the history.
    - `ctrl -r` : Ofter it's easiest to find an earlier command by searching using a small portion of the command that you remember.

# Working With Files 
 - `cat <filename>` : The cat command concatenates and print the contents of files.
 - `less <filename>` : THe less command displays the contents of a file , one page at a time. We can navigate forwards and backwards through the file which is especially useful with very large files.
        press space or f to go to the next page of the file. press b to go back to the previous page. press enter or down arrow to scroll by one line. to search type forward slash / followed by a pettern. press q to quit.
 - `tac <filename>` : will concatenate and print files in reverse. It prints each line of a file starting the last line. It printing in reverse vetically
 - `rev <filename>` : this command prints the contents of a file, reversing the order of each line. Thinks of it as a horizontal reverse , whereas tac is a vertical reverse
 - `head <filename>` : It prints a portion of a file. Starting from the beginning of the file. By default 10 lines
 - `head -n numofline <filename>` : We can also specify a number of lines for head to print using -n options.
 - `head -c numofbyte <filename>` : provide a number of bytes to print out rather than lines using the -c option.
 - `tail <filename>` : It works similarly to the head command, expect it prints from the end of file.
 the same -n and -c options we sawwith head also work with 
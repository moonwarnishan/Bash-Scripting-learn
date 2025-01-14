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
    - `cd` : the cd command is used to change the current working directory, "moving" into     another directory.

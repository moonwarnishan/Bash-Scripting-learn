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

 # Redirection
  - The redirection output symbol `>` tells the shell to redirect the output of a command to a specific file instead of the screen.
  - to append something in existing file `>>` command use. like `ncal >> output.txt`
  - TO pass the contents of a file to standard input, use the `<` symbol followed by the filename.
    for example `cat < output.txt`
  - We can redirect standard input and output at the same time. like `cat < original.txt > output.txt`
  - `ls hfhf 2> errorlog.txt` since hfhf file does not exists then The error message log into errorlog.txt file.
  - standard output `1>`  standard error `2>`
  - example to store list of file `ls > listoffile.txt`
  - We can redirect multiple streams at once. As example `cat bees.txt ants.txt > insects.txt 2>error.txt`
  - `ls docs > output.txt 2>&1`If we wanted to redirect both standard output and standard error to the same file , we could do this. 
  
  # Pipeing
    Pipes are used to redirect a stream from one program to another program. We can take the output of one command and redirect it to the input of another.

    We use the pipe character `|` to separate two  commands. The output of the first command will be passed to the standard input of the second command.  
    We can use `tr` like this. `cat hello.txt | tr e E` that will replace lowercase with uppercase.
    It will not change the file.
    - `-h` it means human redable sizes. and `du` disk usage . example `du -h output.txt`
    - `tee` The tee program reads standard input and copies it both to standard output AND a fill. This allows us to capture information part of the way through a pipeline, without interrupting the flow. 
    - example : `cat colours.txt words.txt | tee colorsAndWords.txt | wcs` 

   # Expansion
   - `*` The asterisk character represents zero or more character in a filename. For example
    `ls *.html` will match any files that end with .html like index.html or nav.html
   - `cat blue` will match any files that start with "blue" like "blue.html" or "bluesteel.js".
   - a charecter or word middle of it `ls -l *at*`
   - The question mark `?` character represents any single character.
        Example : `ls app.??` will match any files named "app" that ends with two characer file entensions like `app.js`
   - Brace expansion is used to generate arbitrary strings. Basically, it will generate multiple strings for us based on a pattern.
        We provide a set of strings inside of curly braces `{}`, as well as optional surrounding prefixes and suffiexes.
         Example : `touch page{1,2,3}.txt` it will create page1, page2, page3, page4 four different files.
         also we can add range `echo journal{1..29}`
    - The shell will perform arithmetic via expansion using the `S((expression))` syntax. 
        inside the parentheses, we can right artithmetic expressions using:
            +, -. * , /, **, %
    # Finding things
    - The locate command performs a search of pathnames across our machine that match a given substring and then prints out any matching names.
    example : `locate output`
    - The locate command is nice and easy, but it can only do so much! The find command is far more powerful! unlike locate , find does not use a database file.
    example : `find friends/`
    - We can use the -size option to find files of a specific size. For example, to find all files larger than 1gb we could `run find -size +1G`
     TO find all files that are exactly 20KB we could run `find size 20k`
    - We can use the -user option to match files and directories that belong to a particular user.
        `find -user hermione`
    - find empty folders/files `find -empty`

    - We can provide find with our own action to perform using each matching pathname.
      `find -exec command {}`;
    # grep
    - The grep command searches for patterns in each file's contents. Grep will print each line that matches a pattern we provide.
     for example `grep "chicken" animals.txt`
    - Use the -i option with grep to make the search case insensitive.
        Example : `grep -i "chapter" book.txt`
    - Use the -w option to ensure that grep only matches words, rather than fragments located inside of other words. 
        Example : `grep -w "cat" book.txt`
    - Use the -r option to perform a resursive search which will include all files under a directory,
        subdirectories and their files and so on.
        Example: `grep -r "chicken"`

    Regex : 
        . - matches any single character.
        ^ - matches the start of a line.
        $ - matches the end of a line.
        [abc] - matches any character in the set.
        [^abc] - matches any character NOT in set.
        [A-Z] - matches characters in a range.
        * - repeat previousexpression 0 or more times.
        \ - escape meta-characters.
    - The -c option tells grep to print the number of matches instead of print the actual matches.
      Example: `grep -c "\$[1-9]" prices.txt`
    - The -o option tells grep to only print out the matches, rather than the entire line containing each match.
    Example : `grep -o "\$[1-9]" prices.txt`
    - A common use case is thto use grep to whittle down or filter a large chunk of data.
    `ps -aux | grep hermione`
    In this example, the ps-aux command will output a huge list of all processes running on our machine. We pipe that data to grep and then filter it down to only the processes that include "hermione"
    # Permissions
    ## Multiple users
        - Unix and unix-like systems are multiuser operating systems.  More than one person can be using the same computer at the same time.
        - On unix systems a single user may be the owner of files and directories, meaning that they have control over their access. Additionally , users can belong to groups which are given access to particular files and folders by their owners.
        - 
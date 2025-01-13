# Linux Commands

## Command Structure
    1. Command Name
    2. Options(starting with -)
    3. Arguments


## 1. Basic Commands
    `who` : Displays currently logged-in users
    `w`   : Displays currently logged-in users and their tasks
    `whoami` : Displays your login name
    `id` : Displays User IDs (UIDs) and Group Ids (GIDs)
    `uname -a` : Displays system information
    `ls` : Lists files in the current directory
    `ls -l` : for detailed list including file permissions and sizes
    `exit` : Exits out of your current shell
    `su` : switch user command
    `su -root` : switch to root user with environment variables
    `su -c "commands" root` : run a single command as root 
    `mkdir` : make directory
    `touch ` : command for making new file

## 2. Shell Metacharacters
    `$` : variable indentifier
    `~` : Home directory
    `#` : Comment
    `&` : background execution
    `;` : Command separator


### Man Pages
    Manual pages (man pages) are the most common form of linux command documentation.
    Access with : `man` command
    Displays extensive information about the command
    Including syntax, options, related files and commands
### Searching Man pages
    `man [keyword]`
    `apropos [Keyword]`
    These commands search command names and descriptions


### Info Pages
    #### GNU info pages are alternative to man pages:
        Access with : `info [command]`
        Ofter more detailed than man pages
        includes hyperlinks to related information
### help command
    For shell built-in commands without man or info pages:
        Use: `help [command]`
        provides brif description and usage information
### Shutting Down the linux system
    #### proper shutdown is crucial to prevent file damage:
        1. Use the shutdown command to safety power off or reboot
        2. Can schedule shutdown for a future time
        3. Notify Users with the wall command before shutdown
    #### Common Shutdown Commands
        `shutdown -p+15` : Power off in 15 minutes
        `poweroff` : Poweroff immeidately
        `shutdown -r now` : Reboot immediately
        `shutdown -c` : Cancel scheduled shutdown

## Linux Directory Navigation
    ### Home Directory
        1. Each user has unique home directory
        2. Regular users : /home/username
        3. Root user: /root
        4. Use ~ to refer to your home directory
    ### PWD Command
         the `pwd` command shows your current location in the filesystem
    ### CD command
        1. `cd` : Change Directory
        2. `cd /path/to/directory` : Go to specific directory
        3. `cd ~` : Go to the home directory
        4. `cd ..` : Move up one directory
        5. `cd -` : Go to previous directory

### Linux File Types
    1. Text Files
    2. Binary Data Files
    3. Executable program files
    4. Directory Files
    5. Special device files
    6. Named pipes and sockets
### FIle Viewing Commands
    1. `cat` : Display entire file content
    2. `less` : View file content page by page
    3. `head` : Display first few lines of a file
    4. `tail` : Display last few lines of a file
### The File Command
    1. Display file type information
    2. usage : `file filename`
    3. Multiple files : `file file1 file2`
    4. All Files in current directory: `file *`
### The stat command
    1. Displays detailed file information
    2. usage: `stat filename`
    3. Shows creation, access and modification times
    4. provides file size and inode information
### Hidden Files
    1. Files starting with a . are hidden
    2. View hidden files `ls -a`
    3. Common hidden files: .bashrc, .profile
    4. Combine options: ls -aF
### Recursive Listing
    1. List subdirectories : `ls -R`
    2. Alternative : `tree command`
    3. Tree command shows directory structure
    4. Useful for visualizing folder hierarchies
### WildCard Metacharacters
    1. `*` : Matches 0 or more characters
    2. `?` : Matches exactly 1 character
    3. `[aegh]` : Matches any single character in the set
    4. `[a-e]` : Matches any single character in the range
    5. `[!a-e]` : Matches any single character Not in the range
### The grep Command
    1. Searches for patterns in text files
    2. Displays lines matching a specified pattern
    3. Supports regular expressions for advance searching
    4. usage : `grep "ubuntu" package_management.txt`
    ### Regular expression with grep
        1. `.` : Matches any single character
        2. `^` : Matches start of line
        3. `$` : Matches end of line
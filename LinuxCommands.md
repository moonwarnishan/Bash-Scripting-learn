# Linux Command Reference Guide

## Command Structure
A Linux command typically consists of three parts:
1. Command Name
2. Options (starting with `-`)
3. Arguments

## Basic System Commands

### User Information
- `who` - Displays currently logged-in users
- `w` - Shows logged-in users and their current tasks
- `whoami` - Displays your current login name
- `id` - Shows User IDs (UIDs) and Group IDs (GIDs)

### System Information
- `uname -a` - Displays detailed system information
- `pwd` - Shows your current location in the filesystem

### File and Directory Operations
- `ls` - Lists files in the current directory
  - `ls -l` - Detailed list including permissions and sizes
  - `ls -a` - Shows hidden files (starting with .)
  - `ls -R` - Lists subdirectories recursively
  - `ls -aF` - Combines multiple options
- `mkdir` - Creates a new directory
- `touch` - Creates a new empty file
- `cd` - Changes directory
  - `cd /path/to/directory` - Goes to specific directory
  - `cd ~` - Goes to home directory
  - `cd ..` - Moves up one directory
  - `cd -` - Returns to previous directory

### User Switching
- `su` - Switches user
- `su -root` - Switches to root user with environment variables
- `su -c "commands" root` - Runs a single command as root

## Shell Special Characters
- `$` - Variable identifier
- `~` - Home directory
- `#` - Comment
- `&` - Background execution
- `;` - Command separator

## Documentation Access

### Man Pages
- `man [command]` - Displays manual pages for commands
- `man [keyword]` - Searches command documentation
- `apropos [keyword]` - Searches command names and descriptions

### Info Pages
- `info [command]` - Displays GNU info pages
  - Often more detailed than man pages
  - Includes hyperlinks to related information

### Built-in Help
- `help [command]` - Shows help for shell built-in commands

## System Shutdown Commands
- `shutdown -p+15` - Powers off system in 15 minutes
- `poweroff` - Powers off system immediately
- `shutdown -r now` - Reboots system immediately
- `shutdown -c` - Cancels scheduled shutdown

## File Operations

### File Types
1. Text Files
2. Binary Data Files
3. Executable Program Files
4. Directory Files
5. Special Device Files
6. Named Pipes and Sockets

### File Viewing
- `cat` - Displays entire file content
- `less` - Views file content page by page
- `head` - Shows first few lines of a file
- `tail` - Shows last few lines of a file
- `file` - Displays file type information
  - `file filename` - Shows type of a single file
  - `file file1 file2` - Shows type of multiple files
  - `file *` - Shows type of all files in current directory
- `stat` - Shows detailed file information including:
  - Creation, access, and modification times
  - File size and inode information

### Pattern Matching and Searching

#### Wildcard Characters
- `*` - Matches zero or more characters
- `?` - Matches exactly one character
- `[aegh]` - Matches any single character in the set
- `[a-e]` - Matches any single character in the range
- `[!a-e]` - Matches any single character not in the range

#### The grep Command
- Basic usage: `grep "pattern" filename`
- Regular expression support:
  - `.` - Matches any single character
  - `^` - Matches start of line
  - `$` - Matches end of line

## Directory Structure
### Home Directory
- Regular users: `/home/username`
- Root user: `/root`
- `~` shortcut refers to current user's home directory

### Hidden Files
- Files starting with `.` are hidden
- Common examples: `.bashrc`, `.profile`
- Use `ls -a` to view hidden files

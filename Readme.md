# Complete Bash Scripting Guide

## 1. Basic Script Structure

### Script Header
```bash
#!/bin/bash
# Author: Your Name
# Date: Current Date
# Description: Purpose of the script
```

## 2. Variables

### 1. User-Defined Variables
```bash
name="John"           # String
age=25               # Integer
price=99.99          # Float
readonly CONSTANT="I cannot be changed"  # Constant
```

### 2. System Variables
- `$HOME`: Home directory
- `$PWD`: Current directory
- `$USER`: Current username
- `$HOSTNAME`: System hostname
- `$RANDOM`: Random number
- `$PATH`: System path
- `$SHELL`: Current shell
- `$0`: Script name
- `$1-$9`: Script arguments
- `$#`: Number of arguments
- `$*`: All arguments as single string
- `$@`: All arguments as separate strings
- `$?`: Exit status of last command

## 3. Data Types and Operators

### 1. Arithmetic Operators
```bash
a=10
b=5
echo $((a + b))  # Addition
echo $((a - b))  # Subtraction
echo $((a * b))  # Multiplication
echo $((a / b))  # Division
echo $((a % b))  # Modulus
echo $((a ** b)) # Exponentiation
```

### 2. String Operations
```bash
str1="Hello"
str2="World"
# Concatenation
result="$str1 $str2"

# String length
length=${#str1}

# Substring
sub=${str1:0:2}  # He

# String replacement
echo ${str1/l/L}  # HeLlo
```

## 4. Arrays

### 1. Array Declaration and Usage
```bash
# Declare array
declare -a numbers=(1 2 3 4 5)
fruits=("apple" "banana" "orange")

# Accessing elements
echo ${fruits[0]}     # First element
echo ${fruits[-1]}    # Last element
echo ${fruits[@]}     # All elements
echo ${#fruits[@]}    # Array length

# Adding elements
fruits+=("grape")

# Slicing
echo ${fruits[@]:1:2}  # Elements from index 1, length 2
```

## 5. Control Structures

### 1. For Loops
```bash
# Basic for loop
for i in {1..5}; do
    echo $i
done

# For loop with array
for fruit in "${fruits[@]}"; do
    echo $fruit
done

# C-style for loop
for ((i=0; i<5; i++)); do
    echo $i
done
```

### 2. While Loops
```bash
# Basic while loop
count=1
while [ $count -le 5 ]; do
    echo $count
    ((count++))
done

# Reading file line by line
while read -r line; do
    echo "$line"
done < "input.txt"
```

### 3. Case Statements
```bash
echo "Enter a character:"
read char
case $char in
    [a-z])
        echo "Lowercase letter"
        ;;
    [A-Z])
        echo "Uppercase letter"
        ;;
    [0-9])
        echo "Number"
        ;;
    *)
        echo "Special character"
        ;;
esac
```

## 6. Functions

### 1. Function Declaration and Usage
```bash
# Basic function
function greet() {
    echo "Hello, $1!"
}

# Function with return value
function add() {
    local result=$(($1 + $2))
    echo $result
}

# Function with local variables
function process() {
    local temp=$1
    echo "Processing $temp"
}

# Calling functions
greet "John"
sum=$(add 5 3)
process "data"
```

## 7. File Operations

### 1. File Reading and Writing
```bash
# Write to file
echo "Hello" > output.txt     # Overwrite
echo "World" >> output.txt    # Append

# Read from file
while IFS= read -r line; do
    echo "$line"
done < "input.txt"
```

### 2. File Test Operations
```bash
file="test.txt"
if [ -f "$file" ]; then
    echo "Regular file exists"
elif [ -d "$file" ]; then
    echo "Directory exists"
fi

# Check permissions
if [ -r "$file" ]; then
    echo "File is readable"
fi
if [ -w "$file" ]; then
    echo "File is writable"
fi
if [ -x "$file" ]; then
    echo "File is executable"
fi
```

## 8. Error Handling

### 1. Exit Status and Error Checking
```bash
# Check last command status
if [ $? -eq 0 ]; then
    echo "Previous command successful"
else
    echo "Previous command failed"
fi

# Error handling function
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# Using error handling
command || handle_error "Command failed"
```

## 9. Regular Expressions

### 1. Pattern Matching
```bash
# Basic regex matching
if [[ "string" =~ ^str ]]; then
    echo "Starts with 'str'"
fi

# Extended pattern matching
if [[ "file.txt" == *.txt ]]; then
    echo "Text file"
fi
```

## 10. Debugging

### 1. Debug Options
```bash
#!/bin/bash -x  # Print commands and arguments
set -x          # Enable debugging from here
set +x          # Disable debugging from here

# Verbose mode
set -v          # Print input lines as read
set +v          # Disable verbose mode
```

## Best Practices

1. Error Handling
```bash
set -e          # Exit on error
set -u          # Exit on undefined variable
set -o pipefail # Exit on pipe failure
```

2. Security
```bash
# Quote variables
path="$HOME/file"  # Good
path=$HOME/file    # Bad

# Use restricted permissions
chmod 755 script.sh  # rwxr-xr-x
```

3. Code Style
- Use meaningful variable names
- Add comments for complex logic
- Indent consistently (2 or 4 spaces)
- Group related operations
- Use functions for repeated code
- Validate input parameters
- Use constants for fixed values

4. Performance
- Use built-in commands when possible
- Avoid unnecessary subshells
- Use appropriate loop constructs
- Minimize external program calls
## 11. Process Management

### 1. Background Processes
```bash
# Start process in background
command &

# List background jobs
jobs

# Bring job to foreground
fg %1

# Send job to background
bg %1

# Kill a job
kill %1
```

### 2. Process Information
```bash
# Get current process ID
echo $$

# Get parent process ID
echo $PPID

# Get process info
ps aux | grep "process_name"

# Process priority
nice -n 10 command
renice -n 10 -p PID
```

## 12. Signal Handling

### 1. Trap Commands
```bash
# Handle Ctrl+C (SIGINT)
trap 'echo "Ctrl+C caught"' SIGINT

# Cleanup on script exit
trap 'cleanup_function' EXIT

# Custom signal handler
cleanup_function() {
    echo "Cleaning up..."
    rm -f temp_file
}
```

## 13. Network Operations

### 1. Basic Networking
```bash
# Check host
ping -c 4 google.com

# Download file
wget https://example.com/file
curl -O https://example.com/file

# Network information
ifconfig
ip addr show

# Port checking
netstat -tulpn
```

## 14. Advanced Text Processing

### 1. sed (Stream Editor)
```bash
# Replace text
sed 's/old/new/g' file.txt

# Delete lines
sed '/pattern/d' file.txt

# Insert text
sed '2i\New Line' file.txt

# Multiple commands
sed -e 's/old/new/g' -e '/pattern/d' file.txt
```

### 2. awk Programming
```bash
# Print specific columns
awk '{print $1, $3}' file.txt

# Sum numbers
awk '{sum += $1} END {print sum}' file.txt

# Filter lines
awk '$3 > 100' file.txt

# Custom field separator
awk -F: '{print $1}' /etc/passwd
```

## 15. Advanced Data Structures

### 1. Associative Arrays (Dictionaries)
```bash
# Declare associative array
declare -A config

# Initialize
config=(
    ["host"]="localhost"
    ["port"]="8080"
    ["user"]="admin"
)

# Access elements
echo ${config["host"]}

# List all keys
echo ${!config[@]}

# List all values
echo ${config[@]}
```

## 16. Advanced File Operations

### 1. File Descriptors
```bash
# Redirect stdout to file
exec 1>output.log

# Redirect stderr to file
exec 2>error.log

# Custom file descriptor
exec 3>custom.log
echo "Custom log" >&3

# Close file descriptor
exec 3>&-
```

### 2. Advanced File Processing
```bash
# Process multiple files
for file in *.txt; do
    if [[ -f "$file" ]]; then
        echo "Processing $file"
        # Process file
    fi
done

# Find and process files
find . -type f -name "*.txt" -exec process_file.sh {} \;
```

## 17. Environment Management

### 1. Environment Variables
```bash
# Export variable
export MY_VAR="value"

# List all environment variables
env
printenv

# Remove variable
unset MY_VAR
```

### 2. Script Environment
```bash
# Source another script
source ./config.sh
. ./config.sh

# Modify PATH
PATH=$PATH:/new/path

# Temporary environment changes
(
    PATH=/custom/path
    command
)
```

## 18. Advanced Scripting Techniques

### 1. Here Documents
```bash
# Multi-line text
cat << EOF > output.txt
Line 1
Line 2
Variable: $VAR
EOF

# Prevent variable expansion
cat << 'EOF' > output.txt
$VAR will not be expanded
EOF
```

### 2. Process Substitution
```bash
# Compare outputs
diff <(ls dir1) <(ls dir2)

# Multiple inputs
while read a b; do
    echo "$a $b"
done < <(paste file1 file2)
```

## 19. Security Best Practices

### 1. Input Validation
```bash
# Validate numeric input
validate_number() {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        return 0
    fi
    return 1
}

# Validate path
validate_path() {
    if [[ "$1" =~ ^[a-zA-Z0-9_/.-]+$ ]]; then
        return 0
    fi
    return 1
}
```

### 2. Secure Operations
```bash
# Safe temporary files
temp_file=$(mktemp)
trap 'rm -f "$temp_file"' EXIT

# Secure permissions
umask 077
touch secret_file

# Sanitize environment
PATH=/bin:/usr/bin
IFS=$' \t\n'
```

## 20. Performance Optimization

### 1. Profiling
```bash
# Time command
time ./script.sh

# Profile script
PS4='+ $SECONDS\011 '
bash -x ./script.sh 2> profile.log

# Memory usage
/usr/bin/time -v ./script.sh
```

### 2. Optimization Techniques
```bash
# Use built-in commands
# Instead of:
echo $(cat file.txt)
# Use:
cat file.txt

# Efficient loops
while read -r line; do
    process "$line"
done < file.txt
```

## 21. Testing

### 1. Unit Testing
```bash
#!/bin/bash
# test_script.sh

test_addition() {
    result=$(add 2 3)
    [[ $result -eq 5 ]] || echo "Test failed: $result != 5"
}

test_string_concat() {
    result=$(concat "Hello" "World")
    [[ "$result" == "HelloWorld" ]] || echo "Test failed: $result != HelloWorld"
}

# Run tests
test_addition
test_string_concat
```

### 2. Integration Testing
```bash
#!/bin/bash
# integration_test.sh

setup() {
    # Setup test environment
    mkdir -p test_dir
    echo "test data" > test_dir/input.txt
}

teardown() {
    # Clean up test environment
    rm -rf test_dir
}

run_tests() {
    setup
    # Run tests
    ./script.sh test_dir/input.txt
    if [[ $? -eq 0 ]]; then
        echo "Integration test passed"
    else
        echo "Integration test failed"
    fi
    teardown
}
```
## 22. Common Script Templates

### 1. Basic Script Template
```bash
#!/bin/bash

# ===========================================
# Script Name: script_name.sh
# Description: Brief description of purpose
# Author: Your Name
# Date Created: YYYY-MM-DD
# Last Modified: YYYY-MM-DD
# Version: 1.0
# ===========================================

# Exit on error, undefined vars, and pipe failures
set -euo pipefail

# Script variables
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
readonly LOG_FILE="/var/log/${SCRIPT_NAME%.sh}.log"

# Functions
log() {
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $*" | tee -a "$LOG_FILE"
}

usage() {
    cat << EOF
Usage: $SCRIPT_NAME [options]

Options:
    -h, --help     Show this help message
    -v, --verbose  Enable verbose output
EOF
}

cleanup() {
    # Cleanup temporary files
    log "Cleaning up..."
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                usage
                exit 0
                ;;
            -v|--verbose)
                set -x
                shift
                ;;
            *)
                echo "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done
}

main() {
    log "Starting script execution"
    # Main script logic here
    log "Script execution completed"
}

# Setup error handling
trap cleanup EXIT
trap 'echo "Error on line $LINENO" >&2; exit 1' ERR

# Run script
parse_args "$@"
main
```

### 2. Database Backup Template
```bash
#!/bin/bash

# Database backup script template

# Configuration
DB_USER="username"
DB_PASS="password"
DB_NAME="database"
BACKUP_DIR="/backup/mysql"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${DATE}.sql.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Perform backup
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" | gzip > "$BACKUP_FILE"

# Retain only last 7 days of backups
find "$BACKUP_DIR" -name "${DB_NAME}_*.sql.gz" -mtime +7 -delete

# Check backup success
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed" >&2
    exit 1
fi
```

### 3. Log Rotation Template
```bash
#!/bin/bash

# Log rotation script template

# Configuration
LOG_DIR="/var/log/myapp"
MAX_LOGS=5
LOG_PREFIX="app.log"

# Rotate logs
rotate_logs() {
    cd "$LOG_DIR" || exit 1
    
    # Remove oldest log if exists
    [ -f "${LOG_PREFIX}.${MAX_LOGS}" ] && rm "${LOG_PREFIX}.${MAX_LOGS}"
    
    # Rotate existing logs
    for i in $(seq $((MAX_LOGS-1)) -1 1); do
        [ -f "${LOG_PREFIX}.$i" ] && mv "${LOG_PREFIX}.$i" "${LOG_PREFIX}.$((i+1))"
    done
    
    # Rotate current log
    [ -f "${LOG_PREFIX}" ] && mv "${LOG_PREFIX}" "${LOG_PREFIX}.1"
    
    # Create new empty log file
    touch "${LOG_PREFIX}"
    chmod 644 "${LOG_PREFIX}"
}

rotate_logs
```

## 23. Advanced Real-World Examples

### 1. System Monitoring Script
```bash
#!/bin/bash

# System monitoring script

monitor_system() {
    echo "=== System Monitor Report ==="
    date
    
    echo -e "\n=== CPU Usage ==="
    top -bn1 | head -n 20
    
    echo -e "\n=== Memory Usage ==="
    free -h
    
    echo -e "\n=== Disk Usage ==="
    df -h
    
    echo -e "\n=== System Load ==="
    uptime
    
    echo -e "\n=== Network Connections ==="
    netstat -tuln
    
    echo -e "\n=== Process Count ==="
    ps aux | wc -l
    
    echo -e "\n=== Last 5 System Messages ==="
    tail -n 5 /var/log/syslog
}

# Run monitoring every 5 minutes
while true; do
    monitor_system > "/var/log/system_monitor_$(date +%Y%m%d_%H%M).log"
    sleep 300
done
```

### 2. Automated Deployment Script
```bash
#!/bin/bash

# Automated deployment script

# Configuration
APP_NAME="myapp"
DEPLOY_DIR="/var/www/$APP_NAME"
REPO_URL="git@github.com:user/repo.git"
BRANCH="main"

deploy() {
    echo "Starting deployment of $APP_NAME"
    
    # Update code
    if [ -d "$DEPLOY_DIR" ]; then
        cd "$DEPLOY_DIR" || exit 1
        git pull origin "$BRANCH"
    else
        git clone -b "$BRANCH" "$REPO_URL" "$DEPLOY_DIR"
        cd "$DEPLOY_DIR" || exit 1
    fi
    
    # Install dependencies
    npm install
    
    # Build application
    npm run build
    
    # Update permissions
    chown -R www-data:www-data "$DEPLOY_DIR"
    
    # Restart services
    systemctl restart nginx
    systemctl restart "$APP_NAME"
    
    echo "Deployment completed successfully"
}

# Run deployment with error handling
if deploy; then
    echo "Deployment successful"
else
    echo "Deployment failed" >&2
    exit 1
fi
```

## 24. Script Documentation Best Practices

### 1. Inline Documentation
```bash
# Function header template
#######################################
# Brief description of function purpose
# Globals:
#   List of global variables used
# Arguments:
#   $1 - Description of first argument
#   $2 - Description of second argument
# Returns:
#   0 if successful, non-zero on error
# Outputs:
#   Write to stdout or stderr
#######################################
```

### 2. Error Messages
```bash
error() {
    local msg="$1"
    local code="${2:-1}"
    local line="${3:-$LINENO}"
    echo "Error on line $line: $msg" >&2
    exit "$code"
}

warn() {
    local msg="$1"
    echo "Warning: $msg" >&2
}

info() {
    local msg="$1"
    echo "Info: $msg"
}
```

### 3. Configuration Management
```bash
# Configuration file template
CONFIG_FILE="/etc/myapp/config.conf"

# Load configuration
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        # shellcheck source=/dev/null
        source "$CONFIG_FILE"
    else
        error "Configuration file not found: $CONFIG_FILE"
    fi
}

# Validate configuration
validate_config() {
    local required_vars=("DB_HOST" "DB_USER" "DB_PASS")
    for var in "${required_vars[@]}"; do
        if [ -z "${!var}" ]; then
            error "Missing required configuration: $var"
        fi
    done
}
```

These templates and examples provide:
1. Production-ready script structures
2. Real-world automation examples
3. Best practices for documentation
4. Error handling patterns
5. Configuration management

## 22. Common Script Templates

### 1. Basic Script Template
```bash
#!/bin/bash

# ===========================================
# Script Name: script_name.sh
# Description: Brief description of purpose
# Author: Your Name
# Date Created: YYYY-MM-DD
# Last Modified: YYYY-MM-DD
# Version: 1.0
# ===========================================

# Exit on error, undefined vars, and pipe failures
set -euo pipefail

# Script variables
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
readonly LOG_FILE="/var/log/${SCRIPT_NAME%.sh}.log"

# Functions
log() {
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $*" | tee -a "$LOG_FILE"
}

usage() {
    cat << EOF
Usage: $SCRIPT_NAME [options]

Options:
    -h, --help     Show this help message
    -v, --verbose  Enable verbose output
EOF
}

cleanup() {
    # Cleanup temporary files
    log "Cleaning up..."
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                usage
                exit 0
                ;;
            -v|--verbose)
                set -x
                shift
                ;;
            *)
                echo "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done
}

main() {
    log "Starting script execution"
    # Main script logic here
    log "Script execution completed"
}

# Setup error handling
trap cleanup EXIT
trap 'echo "Error on line $LINENO" >&2; exit 1' ERR

# Run script
parse_args "$@"
main
```

### 2. Database Backup Template
```bash
#!/bin/bash

# Database backup script template

# Configuration
DB_USER="username"
DB_PASS="password"
DB_NAME="database"
BACKUP_DIR="/backup/mysql"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${DATE}.sql.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Perform backup
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" | gzip > "$BACKUP_FILE"

# Retain only last 7 days of backups
find "$BACKUP_DIR" -name "${DB_NAME}_*.sql.gz" -mtime +7 -delete

# Check backup success
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed" >&2
    exit 1
fi
```

### 3. Log Rotation Template
```bash
#!/bin/bash

# Log rotation script template

# Configuration
LOG_DIR="/var/log/myapp"
MAX_LOGS=5
LOG_PREFIX="app.log"

# Rotate logs
rotate_logs() {
    cd "$LOG_DIR" || exit 1
    
    # Remove oldest log if exists
    [ -f "${LOG_PREFIX}.${MAX_LOGS}" ] && rm "${LOG_PREFIX}.${MAX_LOGS}"
    
    # Rotate existing logs
    for i in $(seq $((MAX_LOGS-1)) -1 1); do
        [ -f "${LOG_PREFIX}.$i" ] && mv "${LOG_PREFIX}.$i" "${LOG_PREFIX}.$((i+1))"
    done
    
    # Rotate current log
    [ -f "${LOG_PREFIX}" ] && mv "${LOG_PREFIX}" "${LOG_PREFIX}.1"
    
    # Create new empty log file
    touch "${LOG_PREFIX}"
    chmod 644 "${LOG_PREFIX}"
}

rotate_logs
```

## 23. Advanced Real-World Examples

### 1. System Monitoring Script
```bash
#!/bin/bash

# System monitoring script

monitor_system() {
    echo "=== System Monitor Report ==="
    date
    
    echo -e "\n=== CPU Usage ==="
    top -bn1 | head -n 20
    
    echo -e "\n=== Memory Usage ==="
    free -h
    
    echo -e "\n=== Disk Usage ==="
    df -h
    
    echo -e "\n=== System Load ==="
    uptime
    
    echo -e "\n=== Network Connections ==="
    netstat -tuln
    
    echo -e "\n=== Process Count ==="
    ps aux | wc -l
    
    echo -e "\n=== Last 5 System Messages ==="
    tail -n 5 /var/log/syslog
}

# Run monitoring every 5 minutes
while true; do
    monitor_system > "/var/log/system_monitor_$(date +%Y%m%d_%H%M).log"
    sleep 300
done
```

### 2. Automated Deployment Script
```bash
#!/bin/bash

# Automated deployment script

# Configuration
APP_NAME="myapp"
DEPLOY_DIR="/var/www/$APP_NAME"
REPO_URL="git@github.com:user/repo.git"
BRANCH="main"

deploy() {
    echo "Starting deployment of $APP_NAME"
    
    # Update code
    if [ -d "$DEPLOY_DIR" ]; then
        cd "$DEPLOY_DIR" || exit 1
        git pull origin "$BRANCH"
    else
        git clone -b "$BRANCH" "$REPO_URL" "$DEPLOY_DIR"
        cd "$DEPLOY_DIR" || exit 1
    fi
    
    # Install dependencies
    npm install
    
    # Build application
    npm run build
    
    # Update permissions
    chown -R www-data:www-data "$DEPLOY_DIR"
    
    # Restart services
    systemctl restart nginx
    systemctl restart "$APP_NAME"
    
    echo "Deployment completed successfully"
}

# Run deployment with error handling
if deploy; then
    echo "Deployment successful"
else
    echo "Deployment failed" >&2
    exit 1
fi
```

## 24. Script Documentation Best Practices

### 1. Inline Documentation
```bash
# Function header template
#######################################
# Brief description of function purpose
# Globals:
#   List of global variables used
# Arguments:
#   $1 - Description of first argument
#   $2 - Description of second argument
# Returns:
#   0 if successful, non-zero on error
# Outputs:
#   Write to stdout or stderr
#######################################
```

### 2. Error Messages
```bash
error() {
    local msg="$1"
    local code="${2:-1}"
    local line="${3:-$LINENO}"
    echo "Error on line $line: $msg" >&2
    exit "$code"
}

warn() {
    local msg="$1"
    echo "Warning: $msg" >&2
}

info() {
    local msg="$1"
    echo "Info: $msg"
}
```

### 3. Configuration Management
```bash
# Configuration file template
CONFIG_FILE="/etc/myapp/config.conf"

# Load configuration
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        # shellcheck source=/dev/null
        source "$CONFIG_FILE"
    else
        error "Configuration file not found: $CONFIG_FILE"
    fi
}

# Validate configuration
validate_config() {
    local required_vars=("DB_HOST" "DB_USER" "DB_PASS")
    for var in "${required_vars[@]}"; do
        if [ -z "${!var}" ]; then
            error "Missing required configuration: $var"
        fi
    done
}
```

These templates and examples provide:
1. Production-ready script structures
2. Real-world automation examples
3. Best practices for documentation
4. Error handling patterns
5. Configuration management

Would you like:
1. More specific examples for any use case?
2. Additional templates for other common scenarios?
3. More detailed explanations of any patterns used?

## 25. Advanced Utilities

### 1. Script Progress Indicator
```bash
#!/bin/bash

# Progress bar function
show_progress() {
    local current=$1
    local total=$2
    local width=50
    local percentage=$((current * 100 / total))
    local completed=$((width * current / total))
    
    printf "\rProgress: ["
    printf "%${completed}s" | tr ' ' '#'
    printf "%$((width - completed))s" | tr ' ' '-'
    printf "] %d%%" "$percentage"
}

# Example usage
total_steps=100
for ((i = 0; i <= total_steps; i++)); do
    show_progress "$i" "$total_steps"
    sleep 0.1
done
echo
```

### 2. Advanced Logging System
```bash
#!/bin/bash

# Advanced logging system
declare -A LOG_LEVELS=([DEBUG]=0 [INFO]=1 [WARN]=2 [ERROR]=3 [FATAL]=4)
LOG_LEVEL="INFO"

log() {
    local level=$1
    shift
    local message="$*"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    if [[ ${LOG_LEVELS[$level]} -ge ${LOG_LEVELS[$LOG_LEVEL]} ]]; then
        printf '[%s] %-5s %s\n' "$timestamp" "$level" "$message" | \
        tee -a "/var/log/application.log"
    fi
}

# Usage
log "DEBUG" "Debugging information"
log "INFO"  "Normal operation"
log "WARN"  "Warning message"
log "ERROR" "Error occurred"
log "FATAL" "Fatal error"
```

## 26. System Administration Scripts

### 1. System Backup Script
```bash
#!/bin/bash

# System backup script
BACKUP_DIR="/backup/system"
EXCLUDE_FILE="/etc/backup-exclude.txt"
DATE=$(date +%Y%m%d)

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Create system backup
create_backup() {
    local backup_file="$BACKUP_DIR/system_backup_$DATE.tar.gz"
    
    # Create exclude file if it doesn't exist
    if [[ ! -f "$EXCLUDE_FILE" ]]; then
        cat > "$EXCLUDE_FILE" << EOF
/proc/*
/sys/*
/tmp/*
/run/*
/mnt/*
/media/*
/lost+found
/backup/*
EOF
    fi
    
    # Create backup
    tar --exclude-from="$EXCLUDE_FILE" \
        -czf "$backup_file" /
        
    # Verify backup
    if tar -tf "$backup_file" &>/dev/null; then
        echo "Backup created successfully: $backup_file"
    else
        echo "Backup verification failed" >&2
        return 1
    fi
}

# Cleanup old backups
cleanup_old_backups() {
    find "$BACKUP_DIR" -name "system_backup_*.tar.gz" -mtime +30 -delete
}

create_backup && cleanup_old_backups
```

### 2. System Health Check
```bash
#!/bin/bash

# System health check script
check_system_health() {
    local report_file="/var/log/health_check_$(date +%Y%m%d).log"
    
    {
        echo "=== System Health Report ==="
        echo "Date: $(date)"
        echo
        
        echo "=== Disk Space Usage ==="
        df -h | grep -v "tmpfs"
        echo
        
        echo "=== Memory Usage ==="
        free -h
        echo
        
        echo "=== CPU Load ==="
        uptime
        echo
        
        echo "=== System Services Status ==="
        systemctl list-units --type=service --state=failed
        echo
        
        echo "=== Last System Errors ==="
        journalctl -p err..emerg --since "24 hours ago" --no-pager
        echo
        
        echo "=== Network Connections ==="
        ss -tuln
        echo
        
        echo "=== Disk I/O Statistics ==="
        iostat -x 1 5
        echo
        
        echo "=== Top CPU Processes ==="
        ps -eo pid,ppid,%cpu,%mem,cmd --sort=-%cpu | head -n 10
        echo
        
        echo "=== Top Memory Processes ==="
        ps -eo pid,ppid,%cpu,%mem,cmd --sort=-%mem | head -n 10
        
    } > "$report_file"
    
    # Send email if configured
    if command -v mail >/dev/null; then
        mail -s "System Health Report $(date +%Y-%m-%d)" admin@example.com < "$report_file"
    fi
}
```

## 27. Security and Hardening

### 1. Security Audit Script
```bash
#!/bin/bash

# Security audit script
security_audit() {
    local report_file="/var/log/security_audit_$(date +%Y%m%d).log"
    
    {
        echo "=== Security Audit Report ==="
        echo "Date: $(date)"
        echo
        
        echo "=== System Information ==="
        uname -a
        echo
        
        echo "=== Users with Root Access ==="
        grep -Po '^sudo.+:\K.*$' /etc/group
        echo
        
        echo "=== SUID Files ==="
        find / -type f -perm -4000 2>/dev/null
        echo
        
        echo "=== SGID Files ==="
        find / -type f -perm -2000 2>/dev/null
        echo
        
        echo "=== World-Writable Files ==="
        find / -type f -perm -2 2>/dev/null
        echo
        
        echo "=== World-Writable Directories ==="
        find / -type d -perm -2 2>/dev/null
        echo
        
        echo "=== Listening Ports ==="
        netstat -tuln
        echo
        
        echo "=== Active SSH Sessions ==="
        who
        echo
        
        echo "=== Failed Login Attempts ==="
        grep "Failed password" /var/log/auth.log
        echo
        
        echo "=== Last 10 Successful Logins ==="
        last | head -n 10
        
    } > "$report_file"
}
```

### 2. Intrusion Detection
```bash
#!/bin/bash

# Simple intrusion detection system
monitor_system_changes() {
    local baseline="/var/lib/ids/baseline.db"
    local current="/var/lib/ids/current.db"
    
    # Create directories
    mkdir -p "$(dirname "$baseline")"
    
    # Create baseline if it doesn't exist
    if [[ ! -f "$baseline" ]]; then
        find / -type f -exec md5sum {} \; 2>/dev/null > "$baseline"
        echo "Baseline created"
        return
    }
    
    # Create current snapshot
    find / -type f -exec md5sum {} \; 2>/dev/null > "$current"
    
    # Compare and report changes
    diff "$baseline" "$current" | grep "^[<>]" | \
    while read -r line; do
        echo "File change detected: ${line#* }"
    done
}
```

## 28. Performance Monitoring

### 1. Resource Usage Monitor
```bash
#!/bin/bash

# Resource usage monitoring
monitor_resources() {
    local interval=${1:-60}  # Default 60 seconds
    local log_file="/var/log/resource_usage.log"
    
    while true; do
        {
            echo "=== Resource Usage Report ==="
            echo "Timestamp: $(date)"
            
            echo "CPU Usage:"
            top -bn1 | head -n 3
            
            echo "Memory Usage:"
            free -h
            
            echo "Disk I/O:"
            iostat -x 1 1
            
            echo "Network I/O:"
            sar -n DEV 1 1
            
            echo "================================"
            echo
        } >> "$log_file"
        
        sleep "$interval"
    done
}

# Start monitoring
monitor_resources &
```

### 2. Application Performance Monitor
```bash
#!/bin/bash

# Application performance monitoring
monitor_application() {
    local app_name="$1"
    local pid
    local log_file="/var/log/${app_name}_performance.log"
    
    while true; do
        pid=$(pgrep -x "$app_name")
        
        if [[ -n "$pid" ]]; then
            {
                echo "=== Application Monitor Report ==="
                echo "Timestamp: $(date)"
                echo "Application: $app_name (PID: $pid)"
                
                echo "Process Statistics:"
                ps -p "$pid" -o %cpu,%mem,rss,vsz
                
                echo "Open Files:"
                lsof -p "$pid" | wc -l
                
                echo "Network Connections:"
                lsof -i -a -p "$pid"
                
                echo "================================"
                echo
            } >> "$log_file"
        else
            echo "Application $app_name not running" >> "$log_file"
        fi
        
        sleep 60
    done
}
```

These additions provide:
1. Advanced system monitoring capabilities
2. Security auditing tools
3. Performance monitoring utilities
4. System health checks
5. Resource usage tracking

## 29. Cron Job Management

### 1. Cron Job Template
```bash
#!/bin/bash

# Lock file mechanism
LOCK_FILE="/var/run/script.lock"

# Ensure only one instance runs
if [ -f "$LOCK_FILE" ]; then
    pid=$(cat "$LOCK_FILE")
    if kill -0 "$pid" 2>/dev/null; then
        echo "Script already running with PID: $pid"
        exit 1
    fi
fi

# Create lock file
echo $$ > "$LOCK_FILE"

# Cleanup on exit
trap 'rm -f "$LOCK_FILE"' EXIT

# Your script logic here
```

## 30. Docker Integration

### 1. Docker Management Scripts
```bash
#!/bin/bash

# Docker container health check
check_containers() {
    echo "=== Docker Container Status ==="
    docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Health}}"
    
    # Check for unhealthy containers
    unhealthy=$(docker ps -a --filter "health=unhealthy" --format "{{.Names}}")
    if [ -n "$unhealthy" ]; then
        echo "Unhealthy containers found:"
        echo "$unhealthy"
        # Restart unhealthy containers
        for container in $unhealthy; do
            docker restart "$container"
        done
    fi
}

# Docker cleanup
cleanup_docker() {
    # Remove stopped containers
    docker container prune -f
    
    # Remove unused images
    docker image prune -a -f
    
    # Remove unused volumes
    docker volume prune -f
    
    # Remove unused networks
    docker network prune -f
}
```

## 31. Kubernetes Integration

### 1. Kubernetes Management Scripts
```bash
#!/bin/bash

# Kubernetes namespace cleanup
cleanup_namespace() {
    local namespace="$1"
    
    # Delete all resources in namespace
    kubectl delete all --all -n "$namespace"
    
    # Delete config maps
    kubectl delete configmap --all -n "$namespace"
    
    # Delete secrets
    kubectl delete secret --all -n "$namespace"
    
    # Delete PVCs
    kubectl delete pvc --all -n "$namespace"
}

# Pod health check
check_pods() {
    local namespace="$1"
    
    echo "=== Pod Status in $namespace ==="
    kubectl get pods -n "$namespace" \
        -o custom-columns=NAME:.metadata.name,STATUS:.status.phase,RESTARTS:.status.containerStatuses[*].restartCount
    
    # Check for crashed pods
    crashed_pods=$(kubectl get pods -n "$namespace" --field-selector status.phase=Failed -o name)
    if [ -n "$crashed_pods" ]; then
        echo "Crashed pods found:"
        echo "$crashed_pods"
        # Delete crashed pods
        kubectl delete "$crashed_pods" -n "$namespace"
    fi
}
```

## 32. CI/CD Integration

### 1. GitLab CI Helper Scripts
```bash
#!/bin/bash

# Deploy to staging environment
deploy_staging() {
    local app_name="$1"
    local version="$2"
    
    echo "Deploying $app_name version $version to staging..."
    
    # Update deployment configuration
    sed -i "s/image: .*$/image: $app_name:$version/" deployment.yaml
    
    # Apply deployment
    kubectl apply -f deployment.yaml
    
    # Wait for rollout
    kubectl rollout status deployment/"$app_name"
    
    # Run smoke tests
    run_smoke_tests
}

# Run smoke tests
run_smoke_tests() {
    echo "Running smoke tests..."
    
    # Health check endpoint
    curl -f http://localhost/health
    
    # Basic functionality tests
    ./run_tests.sh --suite smoke
}
```

## 33. Monitoring Integration

### 1. Prometheus Integration
```bash
#!/bin/bash

# Export custom metrics to Prometheus
export_metrics() {
    # Create metrics directory
    mkdir -p /var/lib/node_exporter/textfile_collector
    
    # Export disk usage metric
    df -h --output=target,pcent | tail -n+2 | \
    while read -r mount usage; do
        echo "# HELP disk_usage_percent Disk usage in percent"
        echo "# TYPE disk_usage_percent gauge"
        echo "disk_usage_percent{mount=\"$mount\"} ${usage%\%}"
    done > /var/lib/node_exporter/textfile_collector/disk_usage.prom
}

# Export application metrics
export_app_metrics() {
    local app_name="$1"
    local metric_file="/var/lib/node_exporter/textfile_collector/${app_name}_metrics.prom"
    
    # Get application metrics
    echo "# HELP ${app_name}_process_count Number of running processes"
    echo "# TYPE ${app_name}_process_count gauge"
    echo "${app_name}_process_count $(pgrep -c "$app_name")" > "$metric_file"
}
```

## 34. Error Recovery

### 1. Auto-Recovery Scripts
```bash
#!/bin/bash

# Service recovery
recover_service() {
    local service_name="$1"
    local max_attempts=3
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        echo "Recovery attempt $attempt for $service_name"
        
        # Check service status
        if systemctl is-active --quiet "$service_name"; then
            echo "$service_name is running"
            return 0
        fi
        
        # Try to restart service
        systemctl restart "$service_name"
        
        # Wait for service to start
        sleep 10
        
        ((attempt++))
    done
    
    echo "Failed to recover $service_name after $max_attempts attempts"
    return 1
}

# Database recovery
recover_database() {
    local db_name="$1"
    
    echo "Attempting to recover database $db_name"
    
    # Check database status
    if ! mysql -e "SELECT 1" &>/dev/null; then
        # Try to restart MySQL
        systemctl restart mysql
        
        # Wait for MySQL to start
        sleep 10
        
        # Check if database needs repair
        mysqlcheck --repair "$db_name"
    fi
}
```

## 35. Automated Documentation

### 1. Script Documentation Generator
```bash
#!/bin/bash

# Generate documentation for shell scripts
generate_docs() {
    local script_dir="$1"
    local output_dir="$2"
    
    mkdir -p "$output_dir"
    
    # Process each script
    find "$script_dir" -name "*.sh" | while read -r script; do
        local script_name=$(basename "$script")
        local doc_file="$output_dir/${script_name%.sh}.md"
        
        {
            echo "# $script_name"
            echo
            echo "## Description"
            grep "^#" "$script" | grep -v "^#!/bin/bash" | sed 's/^# //'
            echo
            echo "## Functions"
            grep -A 1 "^function" "$script" | sed 's/function /### /'
            echo
            echo "## Usage"
            grep "^usage()" -A 5 "$script" 2>/dev/null
            
        } > "$doc_file"
    done
}
```

These final additions provide:
1. Production-ready maintenance scripts
2. Container orchestration integration
3. CI/CD automation tools
4. Monitoring system integration
5. Auto-recovery mechanisms
6. Documentation generation

## 36. Advanced Troubleshooting

### 1. System Diagnostics Suite
```bash
#!/bin/bash

# Comprehensive system diagnostics
run_diagnostics() {
    local report_dir="/var/log/diagnostics/$(date +%Y%m%d_%H%M)"
    mkdir -p "$report_dir"

    # System Information
    {
        echo "=== Hardware Info ==="
        lshw -short
        
        echo -e "\n=== CPU Info ==="
        lscpu
        
        echo -e "\n=== Memory Segments ==="
        cat /proc/meminfo
        
        echo -e "\n=== Disk Layout ==="
        lsblk -f
        
        echo -e "\n=== Mount Points ==="
        findmnt
        
        echo -e "\n=== Network Interfaces ==="
        ip -s link
        
        echo -e "\n=== Route Table ==="
        ip route
        
        echo -e "\n=== DNS Configuration ==="
        cat /etc/resolv.conf
    } > "$report_dir/system_info.log"

    # Performance Metrics
    {
        echo "=== Load Average History ==="
        sar -q
        
        echo -e "\n=== Memory Usage History ==="
        sar -r
        
        echo -e "\n=== Swap Usage History ==="
        sar -S
        
        echo -e "\n=== IO Statistics ==="
        sar -b
    } > "$report_dir/performance_metrics.log"

    # Process Analysis
    {
        echo "=== Process Tree ==="
        pstree -p
        
        echo -e "\n=== Top CPU Consumers ==="
        ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -20
        
        echo -e "\n=== Top Memory Consumers ==="
        ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem | head -20
        
        echo -e "\n=== Zombie Processes ==="
        ps aux | awk '$8=="Z"'
    } > "$report_dir/process_analysis.log"
}

# Generate diagnostic report
run_diagnostics
```

### 2. Advanced Network Diagnostics
```bash
#!/bin/bash

# Network troubleshooting suite
network_diagnostics() {
    local target="$1"
    local report_file="/var/log/network_diag_$(date +%Y%m%d_%H%M).log"

    {
        echo "=== Network Diagnostics Report ==="
        echo "Target: $target"
        echo "Date: $(date)"
        echo

        echo "=== DNS Resolution ==="
        dig +trace "$target"
        
        echo -e "\n=== Reverse DNS ==="
        dig -x "$(dig +short "$target")"
        
        echo -e "\n=== Path MTU Discovery ==="
        tracepath "$target"
        
        echo -e "\n=== TCP Connection Test ==="
        nc -zv "$target" 22 80 443 2>&1
        
        echo -e "\n=== SSL Certificate Check ==="
        openssl s_client -connect "$target":443 </dev/null 2>/dev/null | openssl x509 -text
        
        echo -e "\n=== Network Statistics ==="
        ss -tunapl
        
        echo -e "\n=== Interface Statistics ==="
        ip -s link show
    } > "$report_file"
}
```

## 37. Specialized Automation

### 1. Application Auto-Scaling
```bash
#!/bin/bash

# Auto-scaling manager
manage_scaling() {
    local app_name="$1"
    local min_instances=2
    local max_instances=10
    local cpu_threshold=80
    
    while true; do
        # Get current CPU usage
        cpu_usage=$(get_cpu_usage "$app_name")
        current_instances=$(get_instance_count "$app_name")
        
        if [ "$cpu_usage" -gt "$cpu_threshold" ] && [ "$current_instances" -lt "$max_instances" ]; then
            # Scale up
            scale_up "$app_name"
        elif [ "$cpu_usage" -lt "$((cpu_threshold/2))" ] && [ "$current_instances" -gt "$min_instances" ]; then
            # Scale down
            scale_down "$app_name"
        fi
        
        sleep 60
    done
}

# Helper functions
get_cpu_usage() {
    local app="$1"
    # Implementation depends on monitoring system
    # Example using docker stats
    docker stats "$app" --no-stream --format "{{.CPUPerc}}" | sed 's/%//'
}

get_instance_count() {
    local app="$1"
    docker ps --filter "name=$app" --format "{{.Names}}" | wc -l
}

scale_up() {
    local app="$1"
    docker-compose up -d --scale "$app"=$((current_instances + 1))
}

scale_down() {
    local app="$1"
    docker-compose up -d --scale "$app"=$((current_instances - 1))
}
```

### 2. Database Maintenance Automation
```bash
#!/bin/bash

# Database maintenance automation
maintain_database() {
    local db_name="$1"
    local backup_dir="/backup/db"
    local max_backup_age=7
    
    # Backup rotation
    rotate_backups() {
        find "$backup_dir" -name "*.sql.gz" -mtime +"$max_backup_age" -delete
    }
    
    # Database optimization
    optimize_database() {
        mysql -e "
            SELECT concat('OPTIMIZE TABLE ', table_schema, '.', table_name, ';')
            FROM information_schema.tables
            WHERE table_schema = '$db_name'
        " | mysql
    }
    
    # Index maintenance
    maintain_indexes() {
        mysql -e "
            SELECT concat('ANALYZE TABLE ', table_schema, '.', table_name, ';')
            FROM information_schema.tables
            WHERE table_schema = '$db_name'
        " | mysql
    }
    
    # Execute maintenance tasks
    rotate_backups
    optimize_database
    maintain_indexes
    
    # Check database health
    mysqlcheck --check-upgrade --all-databases --auto-repair
}
```

## 38. Advanced Git Operations

### 1. Git Repository Management
```bash
#!/bin/bash

# Git repository maintenance
maintain_git_repo() {
    local repo_path="$1"
    
    cd "$repo_path" || exit 1
    
    # Cleanup and optimization
    git gc --aggressive --prune=now
    
    # Remove merged branches
    git branch --merged main | grep -v '^* main$' | xargs git branch -d
    
    # Update all remote branches
    git fetch --all --prune
    
    # Check repository health
    git fsck --full
    
    # Optimize pack files
    git repack -Ad
    
    # Verify objects
    git verify-pack -v .git/objects/pack/*.idx
}

# Repository statistics
repo_stats() {
    local repo_path="$1"
    
    cd "$repo_path" || exit 1
    
    echo "=== Repository Statistics ==="
    
    echo "Largest files:"
    git rev-list --objects --all |
    git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
    sed -n 's/^blob //p' |
    sort -k2nr |
    head -10
    
    echo -e "\nCommit history:"
    git log --pretty=format:"%h - %an, %ar : %s" --since="1 month ago"
    
    echo -e "\nBranch information:"
    git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'
}
```

These final additions include:
1. Advanced system diagnostics
2. Network troubleshooting tools
3. Auto-scaling automation
4. Database maintenance
5. Git repository management

The guide now provides a comprehensive reference for:
- System administration
- Network management
- Application deployment
- Database maintenance
- Performance optimization
- Security monitoring
- Version control
- Automation tools

## 39. Comprehensive Testing Framework

### 1. Test Suite Framework
```bash
#!/bin/bash

# Test suite framework
TEST_DIR="./tests"
TEST_REPORT="test_report.log"
FAILED_TESTS=0
PASSED_TESTS=0

run_test_suite() {
    echo "Starting test suite: $(date)" | tee "$TEST_REPORT"
    
    # Find and run all test files
    for test_file in "$TEST_DIR"/*_test.sh; do
        if [ -f "$test_file" ]; then
            echo "Running test file: $(basename "$test_file")" | tee -a "$TEST_REPORT"
            run_test_file "$test_file"
        fi
    done
    
    # Print summary
    echo "Test Summary:" | tee -a "$TEST_REPORT"
    echo "Passed: $PASSED_TESTS" | tee -a "$TEST_REPORT"
    echo "Failed: $FAILED_TESTS" | tee -a "$TEST_REPORT"
    
    # Return failure if any tests failed
    [ "$FAILED_TESTS" -eq 0 ]
}

# Test assertion functions
assert_equals() {
    local expected="$1"
    local actual="$2"
    local message="$3"
    
    if [ "$expected" = "$actual" ]; then
        echo "PASS: $message" | tee -a "$TEST_REPORT"
        ((PASSED_TESTS++))
    else
        echo "FAIL: $message (Expected: $expected, Got: $actual)" | tee -a "$TEST_REPORT"
        ((FAILED_TESTS++))
    fi
}

assert_file_exists() {
    local file="$1"
    local message="$2"
    
    if [ -f "$file" ]; then
        echo "PASS: $message" | tee -a "$TEST_REPORT"
        ((PASSED_TESTS++))
    else
        echo "FAIL: $message (File does not exist: $file)" | tee -a "$TEST_REPORT"
        ((FAILED_TESTS++))
    fi
}

assert_command_success() {
    local command="$1"
    local message="$2"
    
    if eval "$command"; then
        echo "PASS: $message" | tee -a "$TEST_REPORT"
        ((PASSED_TESTS++))
    else
        echo "FAIL: $message (Command failed: $command)" | tee -a "$TEST_REPORT"
        ((FAILED_TESTS++))
    fi
}
```

### 2. Code Coverage Tool
```bash
#!/bin/bash

# Simple code coverage tool
generate_coverage() {
    local script_file="$1"
    local output_file="${script_file}.coverage"
    
    # Create instrumented version of script
    awk '
        /^[[:space:]]*[^#]/ {
            print "echo \"" NR "\" >> /tmp/coverage.txt"
            print $0
        }
        /^[[:space:]]*#/ { print $0 }
    ' "$script_file" > "${script_file}.instrumented"
    
    # Run instrumented script
    bash "${script_file}.instrumented"
    
    # Generate coverage report
    {
        echo "Coverage Report for $script_file"
        echo "=========================="
        total_lines=$(grep -c '^[[:space:]]*[^#]' "$script_file")
        covered_lines=$(sort -u /tmp/coverage.txt | wc -l)
        coverage=$((covered_lines * 100 / total_lines))
        echo "Lines covered: $covered_lines of $total_lines ($coverage%)"
        
        # Show uncovered lines
        echo -e "\nUncovered lines:"
        while read -r line_num; do
            if ! grep -q "^$line_num$" /tmp/coverage.txt; then
                sed -n "${line_num}p" "$script_file"
            fi
        done < <(seq "$(wc -l < "$script_file")")
    } > "$output_file"
    
    # Cleanup
    rm -f "${script_file}.instrumented" /tmp/coverage.txt
}
```

## 40. Script Validation and Static Analysis

### 1. Static Analysis Tool
```bash
#!/bin/bash

# Static analysis for bash scripts
analyze_script() {
    local script_file="$1"
    local report_file="${script_file}.analysis"
    
    {
        echo "Static Analysis Report for $script_file"
        echo "================================="
        
        echo -e "\nSyntax Check:"
        bash -n "$script_file" 2>&1
        
        echo -e "\nShellcheck Analysis:"
        if command -v shellcheck >/dev/null; then
            shellcheck -f gcc "$script_file"
        else
            echo "Shellcheck not installed"
        fi
        
        echo -e "\nStyle Check:"
        # Check for consistent indentation
        grep -n "^[ ]*[^ ]" "$script_file" | while read -r line; do
            if [[ $(echo "$line" | cut -d: -f2 | sed 's/^[ ]*//' | wc -c) -ne $(echo "$line" | cut -d: -f2 | wc -c) ]]; then
                echo "Inconsistent indentation at line $(echo "$line" | cut -d: -f1)"
            fi
        done
        
        echo -e "\nCommon Issues:"
        # Check for common issues
        {
            grep -n "rm [^-]" "$script_file" && echo "Warning: 'rm' without -f or -r option"
            grep -n "\$[A-Za-z]*" "$script_file" | grep -v "\"\$[A-Za-z]*\"" && echo "Warning: Unquoted variables"
            grep -n "== " "$script_file" && echo "Warning: Using '==' in '[' test, use '=' instead"
        } || true
        
    } > "$report_file"
}
```

### 2. Performance Profiler
```bash
#!/bin/bash

# Script performance profiler
profile_script() {
    local script_file="$1"
    local profile_file="${script_file}.profile"
    
    # Add profiling instrumentation
    awk '
        BEGIN { print "declare -A TIMES START" }
        /^[[:space:]]*[^#]/ {
            print "START[" NR "]=\\$(date +%s%N)"
            print $0
            print "TIMES[" NR "]=\\$(( (\\$(date +%s%N) - START[" NR "]) / 1000000 ))"
        }
        /^[[:space:]]*#/ { print $0 }
        END {
            print "for line in \\${!TIMES[@]}; do"
            print "    echo \"Line \\$line took \\${TIMES[\\$line]}ms\""
            print "done | sort -k4 -nr"
        }
    ' "$script_file" > "${script_file}.profiled"
    
    # Run profiled script
    bash "${script_file}.profiled" > "$profile_file"
    
    # Cleanup
    rm -f "${script_file}.profiled"
}
```

These final additions provide:
1. Comprehensive testing framework
2. Code coverage analysis
3. Static code analysis
4. Performance profiling
5. Validation tools

The complete guide now covers everything from:
- Basic scripting concepts
- Advanced system administration
- Security and monitoring
- Testing and validation
- Performance optimization
- Automation tools
- Best practices

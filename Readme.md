# Bash Scripting Guide

## Variables

### 1. User-Defined Variables
- Created and maintained by users
- No spaces around the equals sign when assigning values
- Example: `name="John"`
- Access value using `$` symbol: `echo $name`

### 2. System Variables
- Created and maintained by the operating system
- Written in UPPERCASE by convention
- Common examples: `$HOME`, `$PATH`, `$USER`

## Input Commands

### Basic Input
```bash
read variable_name    # Basic input
```

### Command Options
- `-p`: Allows prompt message in the same line
  ```bash
  read -p "Enter your name: " username
  ```
- `-sp`: Secure input (hidden, like passwords)
  ```bash
  read -sp "Enter password: " password
  ```
- `-a`: Array input
  ```bash
  read -a names    # Read input into array
  echo ${names[0]} # Access first element
  ```

## Conditional Statements

### Basic If-Else Syntax
```bash
if [ condition ]; then
    # Commands for true condition
else
    # Commands for false condition
fi
```

### Extended If-Elif-Else Syntax
```bash
if [ condition1 ]; then
    # Commands for condition1
elif [ condition2 ]; then
    # Commands for condition2
else
    # Commands for none of the above
fi
```

## Conditional Operators

### 1. Numerical Comparisons
| Operator | Description             | Example              |
|----------|-------------------------|----------------------|
| -eq      | Equal to               | `[ $a -eq $b ]`      |
| -ne      | Not equal to           | `[ $a -ne $b ]`      |
| -gt      | Greater than           | `[ $a -gt $b ]`      |
| -lt      | Less than              | `[ $a -lt $b ]`      |
| -ge      | Greater than or equal  | `[ $a -ge $b ]`      |
| -le      | Less than or equal     | `[ $a -le $b ]`      |

### 2. String Comparisons
| Operator | Description           | Example              |
|----------|--------------------|----------------------|
| ==       | Equal to           | `[ "$a" == "$b" ]`  |
| !=       | Not equal to       | `[ "$a" != "$b" ]`  |
| -z       | String is empty    | `[ -z "$string" ]`  |
| -n       | String not empty   | `[ -n "$string" ]`  |

### 3. File Test Operators
| Operator | Description           | Example           |
|----------|--------------------|-------------------|
| -f       | Regular file exists | `[ -f $file ]`    |
| -d       | Directory exists    | `[ -d $dir ]`     |
| -e       | File exists         | `[ -e $path ]`    |
| -r       | File is readable    | `[ -r $file ]`    |
| -w       | File is writable    | `[ -w $file ]`    |
| -x       | File is executable  | `[ -x $file ]`    |

## Practical Examples

### 1. Number Comparison
```bash
#!/bin/bash
echo "Enter a number:"
read num
if [ $num -gt 10 ]; then
    echo "Number is greater than 10"
else
    echo "Number is less than or equal to 10"
fi
```

### 2. String Comparison
```bash
#!/bin/bash
echo "Enter a word:"
read word
if [ "$word" == "hello" ]; then
    echo "You said hello!"
else
    echo "You didn't say hello."
fi
```

### 3. File Check
```bash
#!/bin/bash
if [ -f "/etc/passwd" ]; then
    echo "The file exists"
else
    echo "The file does not exist"
fi
```

### Best Practices
1. Always quote string variables: `"$variable"`
2. Use proper spacing in conditions: `[ $a -eq $b ]`
3. End scripts with `fi` to close if statements
4. Use meaningful variable names
5. Add comments to explain complex logic

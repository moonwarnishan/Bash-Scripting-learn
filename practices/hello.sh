# #!  /usr/bin/bash
# # this is a comment
# echo "Hello World!" #this is also a comment

# #System defined variables
# echo Our shell name is $BASH
# echo Bash version is $BASH_VERSION
# echo Home directory is $HOME
# echo Current working directory is $PWD

# #User defined variables
# name=Mark
# echo $name

# #Taking input
# read -p 'username:' user_var 
# read -sp 'password:' pass_var
# echo $user_var $pass_var

# #input and print arrays 
# echo "Enter names : "
# read -a names
# echo "names : ${names[0]}, ${names[1]}"


# echo $1 $2 $3 '> $1 $2 $3'


# #If else statement in shell scripting
# read -p "Write two number: " number1 number2

# if [ $number1 -eq $number2 ]; then 
#     echo "twos are equal"
# elif [ $number1 -gt $number2 ]; then 
#     echo "number1 is bigger"
# else
#     echo "number2 is bigger"
# fi


#FILE handling
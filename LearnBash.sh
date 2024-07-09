#!/usr/bin/env bash
#

echo "Hello1" ; echo "Hello2"


## 1. Variable
#
variable1="Haha"
variable2 = "Haha"   # this won't work, think about you're working in terminal

# parameter expansion
echo "${variable1}"     # syntax
echo "${variable1/a/i}" # replace the first occurance of 'a' to 'i'

# default value but no assignment
echo "${foo:-"Default"}"

# substring 
echo "${variable1:0:3}"  # print "hah"
echo "${variable1: -2}"  # print "ha"   space is mandatory

# String len
echo "${#variable1}"

# indirect expansion
another="variable1"  # note the double quotes
echo ${!another}     # must have the "!" to expand

## 2. Array
array=(one two three four five six)
echo "${array[0]}"

echo "${array[@]}"   # print all elem
echo "${#array[@]}"  # print len
echo "${#array[0]}"  # print len of the first elem, 3

echo "${array[@]:2}" # print elem start from the '2', here is 'three'
echo "${array[@]:2:2}" # start from '2', and only prints 2 elem


## 3. loop
#  3.1 traditional way
for ((a=1; a<=3; a++))
do
    echo $a
done

#  3.2 with brackets
for Variable in {1..3}
do
    echo "$Variable"
done

#  3.3 use with array
for item in "${array[@]}"; do
    echo "$item"
done

#  3.4 work with files
for Variable in file1 file2
do
    cat "$Variable"
done
#  3.5 output from cmds
for Output in $(ls)
do
    cat "$Output"
done

#  3.6 while loop
while [ true ]
do
    echo "loop body here..."
    break
done


### 4. global variables
echo "Last program's return value: $?"
echo "Script PID: $$"
echo "Num of args passed to script: $#"
echo "All args: $@"
echo "Scripts args: $1, $2, $3"

### 4. brace expansion
echo {1..10} # 1, 2... 10
echo {a..z}  # a, b, c... to z

### 5. exec commands
echo "I am at $(pwd)" # exec pwd cmd


### 6. read input
echo "What's your name?"
read name

echo "$name" # the value now stores in the variable


### 7. if condition
# spaces are important
if [[ "$name" != "$USER"]]; then
    echo "Your name is not your username"
else
    echo "Your name is your username"
fi

### 8. condition operator
# -ne : not equal
# -lt : less than
# -gt : greater than
# -le : <=
# -ge : >=
read age
if [[ "$name" == "Steve" ]] && [[ "$age" -eq 15 ]]; then
    echo "This runs when name is Steve and age is 15."
fi

if [[ "$name" == "John" ]] || [[ "$name" == "Zach" ]]; then
    echo "This runs when name is John or Zach"
fi

### 9. regex with `=~`
email=me@example.com
if [[ "$email" =~ [a-z]+@[a-z]{2,}\.(com|net|org) ]]
then
    echo "Valid email!"
fi

### 10. commands || && operator
echo "Always executed" || echo "Only executed if first command fails"
# => Always executed
echo "Always executed" && echo "Only executed if first command does NOT fail"
# => Always executed
# => Only executed if first command does NOT fail


### 11. use redirect
#
#   11.1 input redirect
#
#   In directory, there are files `input.in` and `hello.py`

###
# import sys
# 
# def main():
#    input_txt = sys.stdin.read()
#    print(input_txt)
#
# if __name__ == "__main__":
#     main()

# this will read the input.in file and work as input to hello.py
python hello.py < input.in


#   11.2 redirect error
python hello.py 2> error.err

#   11.3 redirect both stderr to the same destination as stdout
#   
#   this is helpful when you capture the err msg, and send it also to where you save the standard output
command > output.txt 2>&1


#   11.4 redirect to black hole
python hello.py > /dev/null 2>&1

#   11.5 go to seperate files
#   stdout will go to output.out while error goes to error.err 
python hello.py > output.out 2> error.err



### 12. write or save to file
# Overwrite output.out with "#helloworld":
cat > output.out <(echo "#helloworld")
echo "#helloworld" > output.out
echo "#helloworld" | cat > output.out
echo "#helloworld" | tee output.out >/dev/null


### 13. run cmd in cmd
# use $()
echo "There are $(ls | wc -l) items here."


### 14. case switch statement
case "$var" in
    0) echo "It's zero";;
    1) echo "It's one";;
    *) echo "Default";;
esac

# with str too
read inputs 

case "$inputs" in
    jojo) echo "it's jojo";;
    haha) echo "haha";;
    *) echo "default";;
esac


### 15. function
# define a function
function foo() {
    echo "Arguments work just like script arguments: $@"
    echo "And: $1 $2..."
    echo "This is a function"
    returnValue=0    # Variable values can be returned
    return $returnValue
}

# call a func
foo arg1 arg2
resultValue=$?    # return val can be obtained with $?

# the function keyword is optional
bar() {
    echo "This works too"
    return 0
}

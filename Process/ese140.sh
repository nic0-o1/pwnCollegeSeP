# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific (network) client process : shellscript
# - the challenge will listen for input on a TCP port : 1356
# - the challenge will force the parent process to solve a number of arithmetic problems : 5
# - the challenge will use the following arithmetic operations in its arithmetic problems : +*%
# - the complexity (in terms of nested expressions) of the arithmetic problems : 3

# ONWARDS TO GREATNESS!

# [INFO] This challenge is a network server, and will only communicate on TCP port 1356.


#!/usr/bin/bash

exec 3<>/dev/tcp/127.0.0.1/1356

while read line <&3
do
    echo $line
        challenge=`echo $line | grep " Please send the solution for"`

        if [ ! -z "$challenge" ];
        then
                challenge=${challenge#*: }
                echo "Challenge: " $challenge
                echo "print($challenge)" | python >&3
        fi
done


# Terminale 1
# /challenge/embryoio_level140

# Terminale 2
# bash ese140.sh
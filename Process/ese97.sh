# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : shellscript
# - the challenge will require the parent to send number of signals : 1

# ONWARDS TO GREATNESS!

# [INFO] This challenge will now perform a bunch of checks.
# [INFO] If you pass these checks, you will receive the flag.
# [TEST] Performing checks on the parent process of this process.
# [TEST] Checking to make sure the process is a non-interactive shell script.
# [GOOD] You have passed the checks on the parent process!
# [INFO] This program will stop and wait for you to send it a number of signals. For more information on signals,
# [INFO] look at the man page of the kill command.
# [TEST] You must send me (PID 467) the following signals, in exactly this order: ['SIGINT']
# ^C[INFO] Received signal 2! Is it correct?
# [GOOD] Correct!
# [INFO] Nice, you sent one of the signals!
# [GOOD] You successfully passed the signal challenges!
# [GOOD] Success! You have satisfied all execution requirements. Here is your flag:

#!/bin/bash

/challenge/embryoio_level97

#bash test.sh
# Ctrl + c
# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : shellscript
# - the challenge will make sure that stdin is redirected from a fifo
# - the challenge will check for a hardcoded password over stdin : vdkohxym

# ONWARDS TO GREATNESS!

# [INFO] This challenge will now perform a bunch of checks.
# [INFO] If you pass these checks, you will receive the flag.
# [TEST] Performing checks on the parent process of this process.
# [TEST] Checking to make sure the process is a non-interactive shell script.
# [FAIL] You did not satisfy all the execution requirements.
# [FAIL] Specifically, you must fix the following issue:
# [FAIL]    The shell process must be executing a shell script that you wrote like this: `bash my_script.sh`


#!/bin/bash

# mkfifo f1
# echo vdkohxym > f1 | bash test.sh  oppure
# echo vdkohxym > f1 & bash test.sh  

/challenge/embryoio_level90 < f1
# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : shellscript
# - the challenge will make sure that stdin is redirected from a fifo
# - the challenge will make sure that stdout is a redirected from fifo
# - the challenge will check for a hardcoded password over stdin : svmjoumz

# ONWARDS TO GREATNESS!

# [INFO] This challenge will now perform a bunch of checks.
# [INFO] If you pass these checks, you will receive the flag.
# [TEST] Performing checks on the parent process of this process.
# [TEST] Checking to make sure the process is a non-interactive shell script.
# [FAIL] You did not satisfy all the execution requirements.
# [FAIL] Specifically, you must fix the following issue:
# [FAIL]    The shell process must be executing a shell script that you wrote like this: `bash my_script.sh`

#!/bin/bash

/challenge/embryoio_level92 < f1 > f2


#Terminale 1 (input)
#cat > f1
#Terminale 2 (output)
#cat < f2
#Terminale 3
#bash test.sh
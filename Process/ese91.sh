# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : shellscript
# - the challenge will make sure that stdout is a redirected from fifo

# ONWARDS TO GREATNESS!

# [INFO] This challenge will now perform a bunch of checks.
# [INFO] If you pass these checks, you will receive the flag.
# [TEST] Performing checks on the parent process of this process.
# [TEST] Checking to make sure the process is a non-interactive shell script.
# [FAIL] You did not satisfy all the execution requirements.
# [FAIL] Specifically, you must fix the following issue:
# [FAIL]    The shell process must be executing a shell script that you wrote like this: `bash my_script.sh`

#!/bin/bash

/challenge/embryoio_level91 > f1

#bash test.sh
#mentre va nuovo terminale cat f1
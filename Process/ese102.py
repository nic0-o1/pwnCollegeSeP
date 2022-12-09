# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge will check that argv[NUM] holds value VALUE (listed to the right as NUM:VALUE) : 0:ipkcbu

# ONWARDS TO GREATNESS!

# [INFO] This challenge will now perform a bunch of checks.
# [INFO] If you pass these checks, you will receive the flag.
# [TEST] Performing checks on the parent process of this process.
# [TEST] We will now check that that the process is a non-interactive python instance (i.e., an executing python script).
# [INFO] The process' executable is /usr/bin/bash.
# [INFO] This might be different than expected because of symbolic links (for example, from /usr/bin/python to /usr/bin/python3 to /usr/bin/python3.8).
# [INFO] To pass the checks, the executable must be python3.8.
# [FAIL] You did not satisfy all the execution requirements.
# [FAIL] Specifically, you must fix the following issue:
# [FAIL]    Executable must be 'python'. Yours is: bash
# hacker@embryoio_level102:~/Soluzioni/Process$ export PATH

import subprocess

subprocess.run(['ipkcbu'])

#ln -s /challenge/embryoio_level102 ipkcbu
#export PATH=.:$PATH
#python test.py 
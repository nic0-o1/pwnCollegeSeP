# //TESTO

# hacker@embryoio_level59:~$ /challenge/embryoio_level59 
# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge checks for a specific process at the other end of stdin : rev
# - the challenge will check for a hardcoded password over stdin : ijzmepur

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

# //SOLUZIONE

from subprocess import Popen, PIPEt
p1 = Popen(("rev"),stdout=PIPE)
p2 = Popen(("rev"), stdin=p1.stdout, stdout=PIPE)
p3 = Popen(("/challenge/embryoio_level59"), stdin=p2.stdout)
p3.wait()

# hacker@embryoio_level59:~$ python my_script.py 
# ijzmepur
# è

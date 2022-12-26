# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge will take input on a specific file descriptor : 1
# - the challenge will check for a hardcoded password over stdin : thgnlyxm

import subprocess
import os

f = open('f1')
f2 = os.dup2(f.fileno(), 0)


# subprocess.run('/challenge/embryoio_level107')

p=subprocess.Popen(['/challenge/embryoio_level109'],pass_fds=[1], close_fds=False)

p.wait()

#  0>&1-
# python ese109.py
# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge will take input on a specific file descriptor : 242
# - the challenge will check for a hardcoded password over stdin : bezmucpk

import subprocess
import os

f = open('f1')
f2 = os.dup2(f.fileno(), 242)


# subprocess.run('/challenge/embryoio_level107')

p=subprocess.Popen(['/challenge/embryoio_level107'],pass_fds=[0,1,2,242])

p.wait()

#python test.py & cat > f1
#bezmucpk
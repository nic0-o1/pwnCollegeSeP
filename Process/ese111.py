# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge will require the parent to send number of signals : 1

import subprocess
import os

p=subprocess.Popen(['/challenge/embryoio_level111'])

p.wait()

# python ese110.py
#nuovo terminale 
#kill -sigID PID
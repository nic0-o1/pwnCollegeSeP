# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge will make sure that stdout is a redirected from fifo

import subprocess

subprocess.run('/challenge/embryoio_level104')


#mkfifo f1
#python test.py > f1

#Terminale 2
#cat < f1
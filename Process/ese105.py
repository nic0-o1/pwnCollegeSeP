# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge will make sure that stdin is redirected from a fifo
# - the challenge will make sure that stdout is a redirected from fifo
# - the challenge will check for a hardcoded password over stdin : tvhwkiyy


import subprocess

subprocess.run('/challenge/embryoio_level105')


#mkfifo f1
#mkfifo f2

#python test.py < f1 > f2

#Terminale 2
#cat > f1
# tvhwkiyy

#Terminale 3
#cat < f2
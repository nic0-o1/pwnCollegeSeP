# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge will make sure that stdin is redirected from a fifo
# - the challenge will check for a hardcoded password over stdin : dhfxmaac


import subprocess

subprocess.run('/challenge/embryoio_level103')


#mkfifo f1
#python test.py < f1

#Terminale 2
#cat > f1
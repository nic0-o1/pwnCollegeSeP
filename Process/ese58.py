# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge checks for a specific process at the other end of stdin : cat
# - the challenge will check for a hardcoded password over stdin : kaeuhyse

from subprocess import Popen, PIPE
p1 = Popen(("cat"),stdout=PIPE)
p2 = Popen(("/challenge/embryoio_level58"), stdin=p1.stdout)
p2.wait()
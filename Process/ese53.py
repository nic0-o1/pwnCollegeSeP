# hacker@embryoio_level53:~$ nano my_script.py

from subprocess import Popen, PIPE
from shlex import split
p1 = Popen(split("rev"),stdout=PIPE)
p2 = Popen(split("rev"),stdin=p1.stdout, stdout=PIPE)
p3 = Popen(split("/challenge/embryoio_level53"), stdin=p2.stdout)
stdout_data = p3.communicate()
# hacker@embryoio_level53:~$ ipython
# In [1]: %run my_script.py
# wfjeedja
# è
# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific parent process : python
# - the challenge checks for a specific process at the other end of stdin : cat
# - the challenge checks for a specific process at the other end of stdout : cat
# - the challenge will force the parent process to solve a number of arithmetic problems : 50
# - the challenge will use the following arithmetic operations in its arithmetic problems : +*&^%|
# - the complexity (in terms of nested expressions) of the arithmetic problems : 5


import subprocess
import os

r1,w1=os.pipe()

p0 = subprocess.Popen(["cat"], stdin=subprocess.PIPE, stdout=w1)

r2,w2=os.pipe()

p1 = subprocess.Popen(["/challenge/embryoio_level134"],stdin=r1, stdout=w2)


p2 = subprocess.Popen(["cat"], stdin=r2, stdout=subprocess.PIPE)

while True:
    s=p2.stdout.readline().decode()
    index=s.find("for: ")
    flag= s.find("pwn")
    print(s)
    print('\n')
    if flag != -1:
        break
    if index != -1:
        t1=s[index+4:-1]
        print(t1)
        t2=eval(t1)
        print(b"%d\n"%t2)
        p0.stdin.write(b"%d\n"%t2)
        p0.stdin.flush()

for i in range(50):
	print(p2.stdout.readline().decode(),end="")
import os
import re
import subprocess
import signal
f1=open("t2", 'r')
# f2=open("t1","w")


while 1:
    s=f1.readline()
    print(s)
    index=s.find("order: [")
    flag= s.find("pwn")
    pidIndex = s.find("(PID ")
    pid = ''
    if flag != -1:
        print(s)
        break
    if pid != -1:
         pid = [int(s) for s in re.findall(r'\b\d+\b', s[pidIndex+5:pidIndex+10])]
    if index != -1:
        t1=s[index+8:-1]
        t1 = t1[:-1]
        t1 = t1.replace("'", "")
        t1 = t1[0] + t1[1:].replace(' ','')
        sigs = t1.split(',')

        for i, item in enumerate(sigs):
            code = 0
            if item == 'SIGHUP': code = 1
            elif item == 'SIGINT': code =2 
            elif item == 'SIGUSR2': code = 12
            elif item == 'SIGUSR1': code = 10
            elif item == 'SIGABRT': code = 6

            cmd = f'kill -{code} {pid[0]}'
            print(cmd)
            print('\n')
        break

f1.close()
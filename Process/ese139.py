f1=open("t1","r")
f2=open("t2","w")
count=0
while 1:
    s=f1.readline()
    print(s,end='')
    flag= s.find("pwn.college")
    if flag != -1:
        break
    if "for: " in s:
        count+=1
        index=s.find("for: ")
        a=s[index+4:-1]
        b=eval(a)
        print(b)
        f2.write("%d\n"%b)
        f2.flush()

f1.close()
f2.close()
f1=open("t2", 'rb')
f2=open("t1","wb")


while 1:
    s=f1.readline()
    print(s)
    index=s.find(b"for: ")
    flag= s.find(b"pwn")
    if flag != -1:
        break
    if index != -1:
        t1=s[index+4:-1]
        print(t1)
        t2=eval(t1)
        print(b"%d\n"%t2)
        f2.write(b"%d\n"%t2)
        f2.flush()

f1.close()
f2.close()
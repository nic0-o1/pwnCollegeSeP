f1=open("t1","rb")
f2=open("t2","wb")
for i in range(200):
    s=f1.readline()
    print(s)
    index=s.find(b"for: ")
    if index != -1:
        t1=s[index+4:-1]
        print(t1)
        t2=eval(t1)
        print(b"%d\n"%t2)
        f2.write(b"%d\n"%t2)
        f2.flush()

f1.close()
f2.close()
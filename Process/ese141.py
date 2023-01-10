# WELCOME! This challenge makes the following asks of you:
# - the challenge checks for a specific (network) client process : python
# - the challenge will listen for input on a TCP port : 1927
# - the challenge will force the parent process to solve a number of arithmetic problems : 5
# - the challenge will use the following arithmetic operations in its arithmetic problems : +*%
# - the complexity (in terms of nested expressions) of the arithmetic problems : 3

import socket
import threading
import time
from sys import argv,stdout,stderr,version_info

PY2 = True if version_info[0] == 2 else False
if PY2:
	input=raw_input
	cout=stdout
else:
	cout=stdout.buffer

def recvdata(conn):
	while not event.is_set():
		try:
			data=conn.recv(4096)
			if not data:
				stderr.write("disconnesso\n")
				event.set()
				conn.close()
				break
			cout.write(data)
			stdout.flush()
		except Exception as e:
			stderr.write(str(e))
			conn.close()
			event.set()
			stderr.write("Disconnesso\n")

def senddata(conn):
	try:
		if PY2:
			while not event.is_set():
				data=input()
				if not event.is_set():
					conn.sendall(data+b'\n')
		else:
			while not event.is_set():
				data=input()
				if not event.is_set():
					conn.sendall(data.encode()+b'\n')
	except Exception as e:
		stderr.write(e)
		conn.close()
		event.set()
		stderr.write("Errore nell'invio dei dati!\n")

def listener(host,port):
	if type(port)==type(''):
		port=int(port)
	s= socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	s.bind((host,port))
	s.listen(1)
	stderr.write("listening on %s %s\n"%(host,port))
	conn,addr=s.accept()
	stderr.write("Connection received on %s %s\n"%addr)
	try:
		read=threading.Thread(target=recvdata,args=(conn,))
		read.setDaemon(True)
		read.start()
		write=threading.Thread(target=senddata,args=(conn,))
		write.setDaemon(True)
		write.start()
		while not event.is_set(): time.sleep(1)
	except KeyboardInterrupt as e:
		conn.close()
		event.set()
		stderr.write("\nDisconnessione\n")

def requester(host,port):
	if type(port)==type(''):
		port=int(port)
	s= socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	s.connect((host,port))
	stderr.write("connected to %s %s\n"%(host,port))
	conn=s
	try:
		read=threading.Thread(target=recvdata,args=(conn,))
		read.setDaemon(True)
		read.start()
		write=threading.Thread(target=senddata,args=(conn,))
		write.setDaemon(True)
		write.start()
		while not event.is_set(): time.sleep(1)
	except KeyboardInterrupt as e:
		conn.close()
		event.set()
		stderr.write("\nDisconnessione\n")
		
def main():
	if len(argv)==3:
		host,port=argv[1:]
	elif len(argv)==2:
		port=argv[1]
	else:
		host=input("Inserire l'indirizzo ip da richiedere:")
		if host=="":
			host="0.0.0.0"
		port=input("Inserire la porta da richiedere.")
	requester(host,port)
	
if __name__=='__main__':
	event=threading.Event()
	main()
 
 
# Terminale 1
#  /challenge/embryoio_level141 

# Terminale 2
# python ese141.py
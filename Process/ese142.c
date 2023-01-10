// WELCOME! This challenge makes the following asks of you:
// - the challenge checks for a specific (network) client process : binary
// - the challenge will listen for input on a TCP port : 1493
// - the challenge will force the parent process to solve a number of arithmetic problems : 5
// - the challenge will use the following arithmetic operations in its arithmetic problems : +*%
// - the complexity (in terms of nested expressions) of the arithmetic problems : 3

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>


#define PORT 1493
#define SIZE 1024

void pwncollege(){
	return;
}

int ainb(char* a,char* b){
	long unsigned int len1=strlen(a);
	long unsigned int len2=strlen(b);
	//printf("len(a):%ld\n",len1);
	//printf("len(b):%ld\n",len2);
	
	if(len1>len2) return 0;
	
	int xflag=0;
	for(int i=0;i<len2-len1;i++){
		if(strncmp(a,b+i,len1)==0){
			xflag=1;
			break;
		}
	}
	return xflag;
}

int main(int argc,char* argv[],char* env[])
{
	int client_socket = socket(AF_INET, SOCK_STREAM, 0);   //创建和服务器连接套接字
	if(client_socket == -1)
	{
		perror("socket");
		return -1;
	}
	struct sockaddr_in addr;
	memset(&addr, 0, sizeof(addr));
	
	addr.sin_family = AF_INET;  /* Internet地址族 */
    addr.sin_port = htons(PORT);  /* 端口号 */
    addr.sin_addr.s_addr = htonl(INADDR_ANY);   /* IP地址 */
	inet_aton("127.0.0.1", &(addr.sin_addr));

	int addrlen = sizeof(addr);
	int listen_socket =  connect(client_socket,  (struct sockaddr *)&addr, addrlen);  //连接服务器
	if(listen_socket == -1)
	{
		perror("connect");
		return -1;
	}
	
	char buf[SIZE] = {0};
	int ret;
	
	while(1)        
	{
		while(1){
			memset(buf, 0, SIZE);
			ret = read(client_socket, buf, SIZE);
			if(0>=ret) break;
			printf("%s", buf);
			printf("\n");
			if(1==ainb("Please send the solution for: ",buf))
			{
				break;
			}
		}
		
		printf("Res: ");
		scanf("%s", buf);
		write(client_socket, buf, strlen(buf));
		write(client_socket, "\n", 1);
	}
	close(listen_socket);
	
	return 0;
}

// Terminale 1
// /challenge/embryoio_level142 

// Terminale 2
// ./a.out

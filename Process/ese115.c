// WELCOME! This challenge makes the following asks of you:
// - the challenge checks for a specific parent process : binary
// - the challenge will check that argv[NUM] holds value VALUE (listed to the right as NUM:VALUE) : 0:ioxprq

#include <stdio.h>
#include <unistd.h>

void pwncollege(char* argv[],char *env[]){
        argv[0] = "ioxprq";
        execve("ioxprq",argv,env);
        return ;
}

int main(int argc,char* argv[],char* env[]){
        pid_t fpid;

        fpid=fork();
        if (fpid==0){
                pwncollege(argv,env);
        }
        else{
                wait(NULL);
        }
        return 0;
}


// ln -s /challenge/embryoio_level115 ioxprq
// export PATH=.:$PATH
// gcc ese115.c
// ./a.out
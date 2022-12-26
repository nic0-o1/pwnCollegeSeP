// WELCOME! This challenge makes the following asks of you:
// - the challenge checks for a specific parent process : binary
// - the challenge will check that argv[NUM] holds value VALUE (listed to the right as NUM:VALUE) : 0:/tmp/nwzmjt

#include <stdio.h>
#include <unistd.h>

void pwncollege(char* argv[],char *env[]){
        argv[0] = "/tmp/nwzmjt";
        execve("/challenge/embryoio_level114",argv,env);
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
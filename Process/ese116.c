// WELCOME! This challenge makes the following asks of you:
// - the challenge checks for a specific parent process : binary
// - the challenge will make sure that stdin is redirected from a fifo
// - the challenge will check for a hardcoded password over stdin : iwxsfbks

#include <stdio.h>
#include <unistd.h>

void pwncollege(char* argv[],char *env[]){
        execve("/challenge/embryoio_level116",argv,env);
}

int main(int argc,char* argv[],char* env[]){
        pid_t fpid;

        fpid=fork();

        if (fpid == 0)
                pwncollege(argv,env);
        else
                wait(NULL);
        
        return 0;
}


//mkfifo f1
//echo iwxsfbks > f1 & ./a.out < f1
// WELCOME! This challenge makes the following asks of you:
// - the challenge checks for a specific parent process : binary
// - the challenge will make sure that stdout is a redirected from fifo

#include <stdio.h>
#include <unistd.h>

void pwncollege(char* argv[],char *env[]){
        execve("/challenge/embryoio_level117",argv,env);
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

//Term1
//./a.out > f1

//Term2
//cat < f1
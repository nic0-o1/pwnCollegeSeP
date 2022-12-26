// WELCOME! This challenge makes the following asks of you:
// - the challenge checks for a specific parent process : binary
// - the challenge will force the parent process to solve a number of arithmetic problems : 1
// - the challenge will use the following arithmetic operations in its arithmetic problems : +*
// - the complexity (in terms of nested expressions) of the arithmetic problems : 1

#include <stdio.h>
#include <unistd.h>

void pwncollege(char* argv[],char *env[]){
        execve("/challenge/embryoio_level112",argv,env);
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
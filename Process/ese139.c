// WELCOME! This challenge makes the following asks of you:
// - the challenge checks for a specific parent process : binary
// - the challenge checks for a specific process at the other end of stdin : cat
// - the challenge checks for a specific process at the other end of stdout : cat
// - the challenge will force the parent process to solve a number of arithmetic problems : 50
// - the challenge will use the following arithmetic operations in its arithmetic problems : +*&^%|
// - the complexity (in terms of nested expressions) of the arithmetic problems : 5

#include <stdio.h>
#include <unistd.h>

void pwncollege(char* argv[],char *env[]){
        execve("/challenge/embryoio_level139",argv,env);
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


// Terminale
// cat < t2 | ./a.out | cat > t1 & python ese139.py
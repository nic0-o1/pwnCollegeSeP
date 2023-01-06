// WELCOME! This challenge makes the following asks of you:
// - the challenge checks for a specific parent process : binary
// - the challenge will take input on a specific file descriptor : 1
// - the challenge will check for a hardcoded password over stdin : bmknopsa

#include <stdio.h>
#include <unistd.h>

void pwncollege(char* argv[],char *env[]){
        dup2(3, 1);
        execve("/challenge/embryoio_level122",argv,env);
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

// [GOOD] You have passed the checks on the parent process!
// [TEST] This program expects you to enter a simple password (specifically, bmknopsa). Send it now!
// [INFO] Reading in your input now...
// bmknopsa
// [GOOD] You successfully passed the password!
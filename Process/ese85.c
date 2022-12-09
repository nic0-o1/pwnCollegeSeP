#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/*
mkdir /tmp/jgbvtv
*/

void pwncollege(char *args[], char *env[]){

    chdir("/tmp/jgbvtv");
    execve("/challenge/embryoio_level85", args,env);

    return;
}

int main(int argc, char* argv[], char* env[]){
    pid_t fpid;

    fpid =fork();

    if(fpid == 0){
        pwncollege(argv,env);
    }
    else{
        wait(NULL);
    }
}

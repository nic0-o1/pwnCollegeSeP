#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/*
mkdir /tmp/keelvr
cd /tmp/keelvr
touch pmcwpr
*/

void pwncollege(char *args[], char *env[]){

    execve("/challenge/embryoio_level84", args,env);

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

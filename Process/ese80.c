#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>


void pwncollege(char *args[], char *env[]){
    char *argv[179];

    argv[0] = "embryoio_level80";

    for(int i = 1; i< 179;i++)
        argv[i] = "aioxtvwrcm";
    
    argv[178] = NULL;

    execve("/challenge/embryoio_level80", argv,env);

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

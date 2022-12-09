#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>


void pwncollege(char *args[], char *env[]){
    char *envp[] =
    {
        "255=zdvgyaqolu",
        0
    };
    execve("/challenge/embryoio_level82", args,envp);

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

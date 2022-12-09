#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>


void pwncollege(char *args[], char *env[]){
    char *envp[] =
    {
        "133=gzmovgdbao",
        0
    };

    char *argv[105];

    argv[0] = "embryoio_level83";

    for(int i = 1; i< 105;i++)
        argv[i] = "nvzlhnnran";
    
    argv[104] = NULL;

    execve("/challenge/embryoio_level83", argv,envp);

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

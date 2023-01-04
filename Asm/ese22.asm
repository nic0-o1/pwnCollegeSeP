In previous levels you implemented a while loop to count the number of
consecutive non-zero bytes in a contiguous region of memory. In this level
you will be provided with a contiguous region of memory again and will loop
over each performing a conditional operation till a zero byte is reached.
All of which will be contained in a function!

A function is a callable segment of code that does not destory control flow.
Functions use the instructions "call" and "ret".

The "call" instruction pushes the memory address of the next instruction onto
the stack and then jumps to the value stored in the first argument.

Let's use the following instructions as an example:
0x1021 mov rax, 0x400000
0x1028 call rax
0x102a mov [rsi], rax

1. call pushes 0x102a, the address of the next instruction, onto the stack.
2. call jumps to 0x400000, the value stored in rax.
The "ret" instruction is the opposite of "call". ret pops the top value off of
the stack and jumps to it.
Let's use the following instructions and stack as an example:
                            Stack ADDR  VALUE
0x103f mov rax, rdx         RSP + 0x8   0xdeadbeef
0x1042 ret                  RSP + 0x0   0x0000102a
ret will jump to 0x102a
Please implement the following logic:
str_lower(src_addr):
    rax = 0
    if src_addr != 0:
        while [src_addr] != 0x0:
            if [src_addr] <= 90:
                [src_addr] = foo([src_addr])
                rax += 1
            src_addr += 1
foo is provided at 0x403000. foo takes a single argument as a value

We will now run multiple tests on your code, here is an example run:
- (data) [0x404000] = {10 random bytes},
- rdi = 0x404000

mov rax,0
mov rsi,rdi

cmp rsi,0
je done

loop:
    mov bl,[rsi]
    cmp bl,0
    je done

    cmp bl,90
    ja next

    mov dil,bl
    mov rdx,rax
    mov rcx,0x403000
    call rcx
    mov [rsi],al
    mov rax,rdx
    add rax,1
next:
    add rsi,1
    jmp loop
done:
    ret

;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level22

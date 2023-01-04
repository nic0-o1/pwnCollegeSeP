In this level you will be working with control flow manipulation. This involves using instructions
to both indirectly and directly control the special register `rip`, the instruction pointer.
You will use instructions like: jmp, call, cmp, and the like to implement requests behavior.



In  a previous level you computed the average of 4 integer quad words, which
was a fixed amount of things to compute, but how do you work with sizes you get when
the program is running? In most programming languages a structure exists called the
for-loop, which allows you to do a set of instructions for a bounded amount of times.
The bounded amount can be either known before or during the programs run, during meaning
the value is given to you dynamically. As an example, a for-loop can be used to compute
the sum of the numbers 1 to n:
sum = 0
i = 1
for i <= n:
    sum += i
    i += 1

Please compute the average of n consecutive quad words, where:
rdi = memory address of the 1st quad word
rsi = n (amount to loop for)
rax = average computed

We will now set the following in preparation for your code:
- [0x404230:0x4043e8] = {n qwords]}
- rdi = 0x404230
- rsi = 55

xor rax,rax
xor rcx,rcx
mov rbx,rsi

loop:
    sub rbx,1
    mov ecx,[rdi+rbx*8]
    add rax,rcx
    cmp rbx,0
    jne loop

div rsi


;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level20

Welcome to EmbryoASMLevel17
==================================================

To interact with any level you will send raw bytes over stdin to this program.
To efficiently solve these problems, first run it once to see what you need
then craft, assemble, and pipe your bytes to this program.

We will now set some values in memory dynamically before each run. On each run
the values will change. This means you will need to do some type of formulaic
operation with registers_use. We will tell you which registers_use are set beforehand
and where you should put the result. In most cases, its rax.

In this level you will be working with control flow manipulation. This involves using instructions
to both indirectly and directly control the special register `rip`, the instruction pointer.
You will use instructions like: jmp, call, cmp, and the like to implement requests behavior.



Earlier, you learned how to manipulate data in a pseudo-control way, but x86 gives us actual
instructions to manipulate control flow directly. There are two major ways to manipulate control
flow: 1. through a jump; 2. through a call. In this level, you will work with jumps. There are
two types of jumps:
1. Unconditional jumps
2. Conditional jumps
Unconditional jumps always trigger and are not based on the results of earlier instructions.
As you know, memory locations can store data and instructions. You code will be stored
at 0x40009f (this will change each run).
For all jumps, there are three types:
1. Relative jumps
2. Absolute jumps
3. Indirect jumps
In this level we will ask you to do both a relative jump and an absolute jump. You will do a relative
jump first, then an absolute one. You will need to fill space in your code with something to make this
relative jump possible. We suggest using the `nop` instruction. It's 1 byte and very predictable.
Useful instructions for this level is:
jmp (reg1 | addr | offset) ; nop
Hint: for the relative jump, lookup how to use `labels` in x86.

Using the above knowledge, perform the following:
Create a two jump trampoline:
1. Make the first instruction in your code a jmp
2. Make that jmp a relative jump to 0x51 bytes from its current position
3. At 0x51 write the following code:
4. Place the top value on the stack into register rdi
5. jmp to the absolute address 0x403000

We will now set the following in preparation for your code:
- Loading your given gode at: 0x40009f
- (stack) [0x7fffff1ffff8] = 0x4b

        global _start
        section .text
_start:
        jmp next
        %rep 0x51
                nop
        %endrep
next:
        mov rdi,[rsp]
        mov r12,0x403000
        jmp r12

;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level17
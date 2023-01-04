We will now introduce you to conditional jumps--one of the most valuable instructions in x86.
In higher level programming languages, an if-else structure exists to do things like:
if x is even:
   is_even = 1
else:
   is_even = 0
This should look familiar, since its implementable in only bit-logic. In these structures, we can
control the programs control flow based on dynamic values provided to the program. Implementing the
above logic with jmps can be done like so:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; assume rdi = x, rax is output
; rdx = rdi mod 2
mov rax, rdi
mov rsi, 2
div rsi
; remainder is 0 if even
cmp rdx, 0
; jump to not_even code is its not 0
jne not_even
; fall through to even code
mov rbx, 1
jmp done
; jump to this only when not_even
not_even:
mov rbx, 0
done:
mov rax, rbx
; more instructions here
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Often though, you want more than just a single 'if-else'. Sometimes you want two if checks, followed
by an else. To do this, you need to make sure that you have control flow that 'falls-through' to the
next `if` after it fails. All must jump to the same `done` after execution to avoid the else.
There are many jump types in x86, it will help to learn how they can be used. Nearly all of them rely
on something called the ZF, the Zero Flag. The ZF is set to 1 when a cmp is equal. 0 otherwise.

Using the above knowledge, implement the following:
if [x] is 0x7f454c46:
   y = [x+4] + [x+8] + [x+12]
else if [x] is 0x00005A4D:
   y = [x+4] - [x+8] - [x+12]
else:
   y = [x+4] * [x+8] * [x+12]
where:
x = rdi, y = rax. Assume each dereferenced value is a signed dword. This means the values can start as
a negative value at each memory position.
A valid solution will use the following at least once:
jmp (any variant), cmp

We will now run multiple tests on your code, here is an example run:
- (data) [0x404000] = {4 random dwords]}
- rdi = 0x404000

mov ebx,[rdi+4]
mov ecx,[rdi+8]
mov edx,[rdi+12]
mov eax,[rdi]

cmp eax, 0x7f454c46

jne eif

add ebx,ecx
add ebx,edx

jmp done

eif:
    cmp eax, 0x00005A4D
    jne not
    sub ebx,ecx
    sub ebx,edx
    jmp done

not:
    imul ebx,ecx
    imul ebx,edx

done:
    mov eax, ebx


;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level18

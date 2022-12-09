        global _start

_start:
        mov     r8, rdx
        mov     eax, edi             
        mov     edx, esi               
        mul     edx     
        add     rax, r8

;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level3


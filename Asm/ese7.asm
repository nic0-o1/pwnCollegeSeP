        global _start
        section .text
_start:
        shr rdi,32
        mov al,dil


;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level3

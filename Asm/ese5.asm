        global _start

_start:

        mov rax, rdi
        div rsi 
        mov rax, rdx 

;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level3


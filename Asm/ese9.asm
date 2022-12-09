        global _start
        section .text
_start:
        and rdi, 1
        xor rdi,1
        xor rax, rax
        or rax, rdi


;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level3

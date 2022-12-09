        global _start
        section .text
_start:
        mov r8, 0x404000
        mov r9, 0x1337
        mov rax, [r8]
        add [r8], r9


;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level3

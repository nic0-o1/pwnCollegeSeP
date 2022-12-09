        global _start
        section .text
_start:
        mov r8,0xdeadbeef00001337
        mov r9, 0xc0ffee0000

        mov [rdi], r8
        mov [rsi], r9


;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level3

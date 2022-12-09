        global _start
        section .text
_start:
        mov al, [0x404000]
        mov bx, [0x404000]
        mov ecx, [0x404000]
        mov rdx, [0x404000]


;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level3

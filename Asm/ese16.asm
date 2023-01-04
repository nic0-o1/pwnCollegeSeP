Without using pop please calculate the average of 4 consecutive quad words stored on the stack.
Store the average on the top of the stack. Hint:
RSP+0x?? Quad Word A
RSP+0x?? Quad Word B
RSP+0x?? Quad Word C
RSP      Quad Word D
RSP-0x?? Average

mov rax,[rsp]
add rax,[rsp+8]
add rax,[rsp+16]
add rax,[rsp+24]
mov rbx,4
div rbx
mov [rsp-8],rax
sub rsp,8

;nasm -felf64 file.asm -o file.o
;objcopy -O binary --only-section=.text file.o file.a
;cat file.a | /challenge/embryoasm_level16
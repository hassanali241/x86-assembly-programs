.model large
.stack 100h
.data
    text1 db 'Enter a number: $'
    text2 db 'Enter another number: $'
    text3 db 'Enter operator (+ or -): $'
    text4 db 'Result is: $'
    text5 db 'Repeat? (y/Y): $'

    operator db ?
    variable1 db ?
    variable2 db ?
    result db ?
    newline db 0dh, 0ah, '$'

.code

main proc
    mov ax, @data
    mov ds, ax

repeatProg:
    ; Prompt for first number
    mov ah, 09h
    lea dx, text1
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov variable1, al

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Prompt for second number
    mov ah, 09h
    lea dx, text2
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov variable2, al

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Prompt for operator
    mov ah, 09h
    lea dx, text3
    int 21h

    mov ah, 01h
    int 21h
    mov operator, al

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Perform the operation
    cmp operator, '+'
    jne check_subtraction
    jmp NEAR PTR addition

check_subtraction:
    cmp operator, '-'
    jne ASKrepeatProg
    jmp NEAR PTR subtraction

addition:
    mov al, variable1
    add al, variable2
    mov result, al
    jmp NEAR PTR print_result

subtraction:
    mov al, variable1
    sub al, variable2
    mov result, al
    jmp NEAR PTR print_result

print_result:
    mov ah, 09h
    lea dx, text4
    int 21h

    mov al, result
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

ASKrepeatProg:
    mov ah, 09h
    lea dx, newline
    int 21h
    lea dx, text5
    int 21h

    mov ah, 01h
    int 21h

    cmp al, 'y'
    je repeatProg
    cmp al, 'Y'
    je repeatProg

exit_program:
    mov ah, 4ch
    int 21h

main endp
end main

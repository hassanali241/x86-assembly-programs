.model small
.stack 100h
.data
    prompt db 'Enter password: $'
    password db 20 dup('?') 
    newline db 13,10, '$'    
    msgPassword db 'Your password is: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, prompt
    int 21h

    mov si, 0

input_loop:
    mov ah, 08h
    int 21h

    cmp al, 0Dh
    je done_input

    mov [password + si], al

    mov dl, '*'
    mov ah, 02h
    int 21h

    inc si
    jmp input_loop

done_input:
    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, msgPassword
    int 21h

    mov cx, si
    mov si, 0

print_password:
    mov dl, password[si]
    mov ah, 02h
    int 21h
    inc si
    loop print_password

    mov ah, 4Ch
    int 21h

main endp
end main

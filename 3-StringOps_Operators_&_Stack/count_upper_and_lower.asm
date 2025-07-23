.model small
.stack 100h
.data
	text1 db 'Enter sequence of character: $'
	text2 db 'Number of capital characters: $'
	text3 db 'Number of small characters: $'
	countupper db 0
	countlower db 0
	newline db 0dh,0ah, '$'
.code

main proc

	mov ax, @data
	mov ds, ax

	mov ah, 09h
	lea dx, text1
	int 21h

while_start:
	mov ah, 01h
	int 21h

	cmp al, 0dh
	je end_prog

	cmp al, 'A'
	jl check_lower

	cmp al, 'Z'
	jg check_lower

	inc countupper
	jmp while_start


check_lower:
	cmp al, 'a'
	jl while_start

	cmp al, 'z'
	jg while_start

	inc countlower
	jmp while_start

end_prog:

	mov ah, 09h
	lea dx, text2
	int 21h

	mov al, countupper
	add al, '0'
	mov dl, al
	mov ah, 02h
	int 21h

	mov ah, 09h
	lea dx, newline
	int 21h

	mov ah, 09h
	lea dx, text3
	int 21h

	mov al, countlower
	add al, '0'
	mov dl, al
	mov ah, 02h
	int 21h

 mov ah, 4ch
 int 21h

main endp
end main
	

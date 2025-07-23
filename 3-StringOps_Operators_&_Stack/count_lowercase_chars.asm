.model small
.stack 100h
.data
	text1 db 'Enter sequence of character: $'
	text2 db 'Number of small characters: $'
	count db 0
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

	cmp al, 'a'
	jl while_start

	cmp al, 'z'
	jg while_start

	inc count
	jmp while_start

end_prog:

	mov ah, 09h
	lea dx, text2
	int 21h

	mov al, count
	add al, '0'
	mov dl, al
	mov ah, 02h
	int 21h

 mov ah, 4ch
 int 21h

main endp
end main
	

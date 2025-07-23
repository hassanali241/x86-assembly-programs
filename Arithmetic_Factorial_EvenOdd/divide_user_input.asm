.model small
.stack 100h
.data
	i1 db ?
	i2 db ?
	r2 db ?
	line db 13,10, '$'
.code
main proc
	mov ax, @data
	mov ds, ax

	mov ah, 01h
	int 21h
	sub al, '0'
	mov i1,al
	
	mov ah, 01h
	int 21h
	sub al, '0'
	mov i2,al

	mov al, i1
	mov ah, 0 
	mov bl, i2
	div bl

	add ah, '0'
	mov r2, ah
	
	mov ah,09h
	lea dx,line
	int 21h

	mov ah, 02h
	add al, '0'
	mov dl, al
	int 21h

	mov ah,09h
	lea dx,line
	int 21h

	mov ah, 02h
	mov dl, r2
	int 21h

	mov ah, 4ch
	int 21h

main endp
end main


	

	
		

	

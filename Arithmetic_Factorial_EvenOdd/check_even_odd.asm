.model small
.stack 100h
.data
	i1 db ?
	r2 db ?
	txt1 db 'EVEN $'
	txt2 db 'ODD $'
	line db 13,10, '$'
.code
main proc
	mov ax, @data
	mov ds, ax

	mov ah, 01h
	int 21h
	sub al, '0'
	mov i1,al

	mov al, i1
	mov ah, 0 
	mov bl, 2
	div bl

	add ah, '0'
	mov r2, ah

	cmp ah, '0'
	je evenNUM
	
	mov ah,09h
	lea dx,line
	int 21h

	mov ah,09h
	lea dx,txt2
	int 21h

	jmp endprogram

	evenNUM:

	mov ah,09h
	lea dx,line
	int 21h

	mov ah,09h
	lea dx,txt1
	int 21h

	endprogram:

	mov ah, 4ch
	int 21h

main endp
end main


	

	
		

	

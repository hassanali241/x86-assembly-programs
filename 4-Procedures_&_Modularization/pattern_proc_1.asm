.model small
.stack 100h
.data
	count db '1'
	space db 13,10, '$'
	c db 1
.code
main proc 
	mov ax, @data
	mov ds, ax
	
	call myproc
	
	mov ah,4ch
	int 21h

main endp

myproc proc
	
		mov cx, 5

outer_loop:
	
	push cx

	mov count, '1'

	mov cl, c

inner_loop:

	mov ah, 02h
	mov dl, count
	int 21h

	inc count
 
	loop inner_loop

	mov ah, 09h
	lea dx, space
	int 21h
	
	inc c
	
	pop cx
	
	loop outer_loop
	
ret
myproc endp
	
end main

	
	
		

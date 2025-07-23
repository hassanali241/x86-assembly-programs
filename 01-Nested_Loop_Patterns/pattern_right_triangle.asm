.model small
.stack 100h
.data
	num db '1'
	counter db 1
	newline db 13,10,'$'
.code
main proc

	mov ax,@data
	mov ds,ax

	mov cx, 5
outerloop:
	push cx
	
	mov cl, counter

innerloop:
	
	mov ah, 02h
	mov dl, num
	int 21h

	inc num
	
	loop innerloop
	
	mov num, '1'
	
	mov ah, 09h
	lea dx, newline
	int 21h

	inc counter
	pop cx

	loop outerloop
	
	mov ah, 4ch
	int 21h

main endp
end main

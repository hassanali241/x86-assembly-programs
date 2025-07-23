.model small
.stack 100h
.data
	arr db 5 dup(?) 
	msg1 db ' Is Even$'
	msg2 db' Is Odd$'
.code
main proc
	mov ax,@data
	mov ds,ax

	mov cx, 5
	mov si,0

loop1:
	mov ah,01h
	int 21h

	mov arr[si],al

	inc si

	loop loop1

	mov cx, 5
	mov si,0
loop2:
	mov ah, 02h
	mov dl,arr[si]	
	int 21h

	mov al, arr[si]
	mov ah, 0
	mov bl, 2
	
	div bl

	inc si

	cmp ah,0
	je even1
	jne odd1
	
	even1:

	mov ah,09h
	lea dx, msg1
	int 21h

	jmp _

	odd1:

	mov ah,09h
	lea dx, msg2
	int 21h

	_:
	loop loop2

	mov ah,4ch
	int 21h

main endp
end main
	

	

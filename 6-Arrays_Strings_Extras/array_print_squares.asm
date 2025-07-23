.model small
.stack 100h
.data
	num db '1','2','3'
	count dw 3
	space db '     $'
	newline db 13,10, '$'
.code
main proc
	mov ax, @data
	mov ds,ax

	mov cx,count
	mov si,0
	
begin:

	mov al, num[si]
	mov dl,al
	mov ah,02h
	int 21h

	sub al,'0'
 	mov ah, 0  
	mul al

	mov ah, 09h
	lea dx, space
	int 21h

	add al,'0'
	mov dl,al
	mov ah,02h
	int 21h

	mov ah, 09h
	lea dx, newline
	int 21h

	inc si
	loop begin

	mov ah,4ch
	int 21h

main endp
end main
	
	
	

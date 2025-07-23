.model small
.stack 100h
.data
	arr db 10 dup(?)
	space db 13,10, '$'	
	count dw 10
.code
main proc
	mov ax, @data
	mov ds,ax

	mov cx , count
	mov si,0

input_loop:
	mov ah,01h
	int 21h

	mov arr[si] ,al
	
	inc si
	loop input_loop

	mov ah,09h
	lea dx ,space
	int 21h

	mov cx, count
output_loop:
	mov ah,02h
	mov dl, arr[si]
	int 21h
	
	dec si
	loop output_loop
		
	mov ah,4ch
	int 21h
main endp
end main
	

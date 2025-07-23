.model small
.stack 100h
.data
	arr db 5 dup(?)
	prompt1 db 'enter 5 numbers: $'
	space db 13,10, '$'
	prompt2 db 'values in array are: $'
	count dw 5
.code
main proc
	mov ax, @data
	mov ds, ax

	mov ah, 09h
	lea dx, prompt1	
	int 21h

	mov cx, count
	mov si, 0
begin:

	mov ah,01h
	int 21h
	
	mov arr[si], al

	inc si
	loop begin

	mov cx, count
	mov si, 0
	
	mov ah, 09h
	lea dx, space
	int 21h
	mov ah, 09h
	lea dx, prompt2
	int 21h
 
printloop:
	
	mov dl, arr[si]
	mov ah,02h
	int 21h
	
	inc si
	loop printloop

	mov ah, 4ch
	int 21h
main endp
end main
	
	
		

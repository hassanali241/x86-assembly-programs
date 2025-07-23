.model small
.stack 100h
.data
	text1 db 'Enter the first number: $'
	text2 db 0ah, 'Enter the second number: $'
	prompt1 db ?
	prompt2 db ?
	result db 0ah, 'the smaller number is: $'
.code
main proc
	mov ax, @data
	mov ds, ax

	mov ah, 09h
	lea dx, text1
	int 21h	

	mov ah, 01h
	int 21h
	sub al, 30h
	mov prompt1, al
	
	mov ah, 09h
	lea dx, text2
	int 21h

	mov ah, 01h
	int 21h
	sub al, 30h
	mov prompt2, al
	
	mov al, prompt1
	cmp al, prompt2

	jg greater
	jl less

	greater:

		mov ah, 09h
		lea dx, result
		int 21h

		mov ah, 02h
		mov dl, prompt2
		add dl,30h
		int 21h
		
		jmp endprog
	less:

		mov ah, 09h
		lea dx, result
		int 21h

		mov ah, 02h
		mov dl, prompt1
		add dl,30h
		int 21h
	endprog:
		mov ah, 4ch
		int 21h

	main endp
	end main

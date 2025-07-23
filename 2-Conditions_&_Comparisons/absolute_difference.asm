.model small
.stack 100h
.data
	text1 db 'Enter the first number: $'
	text2 db 0ah, 'Enter the second number: $'
	prompt1 db ?
	prompt2 db ?
	result db 0ah, 'the absolute difference is: $'
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
	
	sub al, prompt1

	jns skip_neg
	neg al

	skip_neg:
 		add al, 30h 
    		mov result, al
		
		mov ah, 09h
		lea dx, result
		int 21h

		mov ah, 02h
		mov dl, al
		int 21h

		mov ah, 4ch
		int 21h

	main endp
	end main

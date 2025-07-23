.model small
.stack 100h
.data
	msg1 db 'Enter the first number: $'
	msg2 db 10,'Enter the second number: $'
	msg3 db 10,'The first number is greater. $'
	msg4 db 10,'The second number is greater. $'
	msg5 db 10,'Both numbers are equal. $'
	input1 db ?
	input2 db ?
	result db ?
.code
main proc
	mov ax, @data
	mov ds, ax
	
	mov ah,09h
	lea dx, msg1
	int 21h
	
	mov ah,01h
	int 21h
	sub al, '0'
	mov input1, al
	
	mov ah,09h
	lea dx, msg2
	int 21h
	
	mov ah,01h
	int 21h
	sub al, '0'
	mov input2, al
	
	mov al, input1
	cmp al,input2

	je equal
	jg first_greater
	
	mov ah,09h
	lea dx, msg4
	int 21h
		
	jmp endprog

	equal:
		mov ah,09h
		lea dx, msg5
		int 21h

		jmp endprog
		
	first_greater:

		mov ah,09h
		lea dx, msg3
		int 21h

		jmp endprog
	
	endprog:	
		mov ah,4ch
		int 21h

main endp
end main
	

	
	

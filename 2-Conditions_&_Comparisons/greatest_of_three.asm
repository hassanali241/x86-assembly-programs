.model small
.stack 100h
.data
	msg1 db 'Enter the first number: $'
	msg2 db 10,'Enter the second number: $'
	msg3 db 10,'Enter the third number: $'
	msg4 db 10,'the greatest number is: $'
	n1 db ?
	n2 db ?
	n3 db ?

	max db ?
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
	mov n1, al
	
	mov ah,09h
	lea dx, msg2
	int 21h
	
	mov ah,01h
	int 21h
	sub al, '0'
	mov n2, al
	
	mov ah,09h
	lea dx, msg3
	int 21h
	
	mov ah,01h
	int 21h
	sub al, '0'
	mov n3, al
	
	mov al, n1
	cmp al, n2

	jg n1greater
	jl n2greater		
	jmp endprog
	
	n2greater:
		mov al,n2
		cmp al,n3
		jl n3greater

		add al,'0'
		mov max,al
	
		jmp endprog

	n1greater:

		cmp al,n3
		
		jl n3greater

		add al,'0'
		mov max, al
		
		jmp endprog

	n3greater:
		
		mov al,n3
		add al, '0'
		mov max, al

	endprog:

		mov ah,09h
		lea dx, msg4	
		int 21h
		
		mov ah,02h
		mov dl, max
		int 21h
			
		mov ah,4ch
		int 21h

main endp
end main
	

	
	

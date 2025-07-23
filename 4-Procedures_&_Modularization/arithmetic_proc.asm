.model small
.stack 100h
.data
	t1 db 10,'Enter a number: $'
	t2 db 10,'Enter the oper (+ or -): $'
	t3 db 10,'The result is: $'
	num1 db ?
	num2 db ?
	result db ?
.code
main proc
	mov ax, @data
	mov ds, ax
	
	mov ah, 09h
	lea dx, t1
	int 21h
	
	mov ah, 01h
	int 21h
	sub al, '0'
	mov num1, al
	
	mov ah, 09h
	lea dx, t1
	int 21h

	mov ah, 01h
	int 21h
	sub al, '0'
	mov num2, al
	
	mov ah, 09h
	lea dx, t2
	int 21h

	mov ah, 01h
	int 21h
	
	cmp al, '+'
	je addd
	
	cmp al, '-'
	je subb

	jmp ending

	addd:

		call addproc
		jmp ending

	subb:
		call subproc	

	ending:

		mov ah, 02h
		add result, '0'
		mov dl, result
		int 21h

		mov ah, 4ch
		int 21h
main endp
addproc proc
	mov dl, num2
	add dl,num1
	mov result, dl	
ret
addproc endp	

subproc proc
	mov dl, num1
	sub dl,num2
	mov result, dl	
ret
subproc endp
end main
	
		

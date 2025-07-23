.model small
.stack 100h
.data
	t1 db 'Enter the first number: $'
	t2 db 10,'Enter the second number: $'
	t3 db 10,'the first number is greater.$'
	t4 db 10,'the second number is greater.$'
	result db ?
	num1 db ?
	num2 db ?
.code
main proc
	mov ax, @data
	mov ds, ax

	mov ah,09h
	lea dx, t1
	int 21h

	mov ah, 01h
	int 21h
	sub al, '0'
	mov num1, al 

	mov ah,09h
	lea dx, t2
	int 21h

	mov ah, 01h
	int 21h
	sub al, '0'
	
	cmp num1, al
	jge num1great
	jl num2great
	jmp ending

	num1great:
		mov dl, num1
		mov result, dl
		call num1proc
		jmp ending
	num2great:
		mov result, al
		call num2proc
	ending:
		mov ah,4ch	
		int 21h

main endp
num1proc proc
	mov ah, 02h
	add result, '0'
	mov dl, result
	int 21h

	mov ah, 09h
	lea dx, t3
	int 21h
ret
num1proc endp

num2proc proc
	mov ah, 02h
	add result, '0'
	mov dl, result
	int 21h

	mov ah, 09h
	lea dx, t4
	int 21h
ret
num2proc endp

end main

	 
	

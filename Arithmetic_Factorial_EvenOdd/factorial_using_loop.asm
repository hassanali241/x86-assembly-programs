.model small
.stack 100h
.data
	i1 db ?
	r2 db ?
	txt1 db 'Factorial: $'
	product db 1
.code
main proc
	mov ax, @data
	mov ds, ax

	mov ah, 01h
	int 21h
	sub al, '0'
	mov i1,al

	mov bl, i1             
    	mov al, 1 

	fact_loop:
		
	mul bl
	dec bl
	cmp bl,1
	jge fact_loop
	
	mov ah,0
	mov bl,10
	div bl

	add ah, '0'
	mov r2, ah

	add al, '0'
	mov dl,al
	mov ah,02h
	int 21h

	mov dl,r2
	mov ah,02h
	int 21h

	mov ah, 4ch
	int 21h

main endp
end main


	

	
		

	

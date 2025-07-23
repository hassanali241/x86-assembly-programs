.model small
.stack 100h
.data
	txt1 db 'Enter a txt and press enter: $'
	txt2 db 'no of integers: $'
	newline db 0dh, 0ah, '$'
	num db 0
	
.code

main proc

	mov ax, @data
	mov ds, ax

	mov ah, 09h
	lea dx, txt1
	int 21h
	
	mov cx, 0

loopone:
	mov ah, 01h
	int 21h

	cmp al, 0dh
	je print_reverse

	push ax
	inc cx
	jmp loopone
	
print_reverse:
	mov ah, 09h
	lea dx, newline
	int 21h


print_loop:
	cmp cx, 0
	je end_prog

	pop dx
	
	cmp dl, '0'
	jl not_digit

	cmp dl, '9'
	jg not_digit

	inc num

not_digit:
	dec cx
	jmp print_loop

end_prog:

	mov ah, 09h
	lea dx, txt2
	int 21h

  	 mov al, num
    	add al, '0'  
    	mov dl, al
    	mov ah, 02h 
    	int 21h

	mov ah, 4ch
	int 21h

main endp
end main

		
	
	
	

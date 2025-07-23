.model small
.stack 100h
.data
	txt1 db 'Enter a txt and press enter: $'
	txt2 db 'In reverse order: $'
	newline db 0dh, 0ah, '$'
	
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

	mov ah, 09h
	lea dx, txt2
	int 21h

print_loop:
	cmp cx, 0
	je end_prog

	pop dx
	mov ah, 02h
	int 21h

	dec cx
	jmp print_loop

end_prog:
	mov ah, 4ch
	int 21h

main endp
end main

		
	
	
	

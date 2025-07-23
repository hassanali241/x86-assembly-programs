.model small
.stack 100h
.data
	t1 db 'The numbers displayed using procedure are: $'	
	n db '0'
.code
main proc
	mov ax, @data
	mov ds, ax
	
	call loop_proc
	
	mov ah, 4ch
	int 21h

main endp
loop_proc proc
	mov cx, 10

	loopproc:
	
	mov ah, 02h
	mov dl, n
	int 21h

	inc n

	loop loopproc 
ret
loop_proc endp
end main	

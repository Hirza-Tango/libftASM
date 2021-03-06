BITS 64

section .text
global _ft_bzero

_ft_bzero:
	push rdi		; save 1st argument to stack
	mov al, 0		; put zero in al register (byte version of rax)
	mov rcx, rsi	; move 2nd argument to count register
	; we don't care what direction we write in, so cld and std don't matter
	rep stosb		; move al to [rdi] rcx times
	pop rax			; retrieve rax value from stack
	ret

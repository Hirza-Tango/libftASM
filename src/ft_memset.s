BITS 64

section .text
global _ft_memset

_ft_memset:
	push rdi		; save 1st argument to stack
	mov al, sil		; put 2nd argument in al register (byte version of rax)
	mov rcx, rdx	; move 3rd argument to count register
	; we don't care what direction we write in, so cld and std don't matter
	rep stosb		; move al to [rdi] rcx times
	pop rax			; retrieve rax value from stack
	ret

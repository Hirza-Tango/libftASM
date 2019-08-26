BITS 64

section .text
global _ft_memcpy

_ft_memcpy:
	push rdi 		; save dst
	mov rcx, rdx	; save length in rcx
	rep movsb
	pop rax			; return dst
	ret

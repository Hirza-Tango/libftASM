BITS 64

section .text
global _ft_strlen

_ft_strlen:
	mov al, 0		; tell scas to look for 0
	mov rcx, 0xffffffffffffffff	; scas decrements rcx, and stops at 0
	; hence, 0 can't be used as a start value
	repne scasb		; scan until null byte is found
	not rcx			; invert rcx to get what we want
	dec rcx			; decrease by 1 to account for the -1 start
	mov rax, rcx	; move count to return value
	ret

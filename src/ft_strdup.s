BITS 64

extern _malloc

section .text
global _ft_strdup

_ft_strdup:
	cld
	push rdi
	mov al, 0		; tell scas to look for 0
	mov rcx, 0xffffffffffffffff	; scas decrements rcx, and stops at 0
	; hence, 0 can't be used as a start value
	repnz scasb		; scan until null byte is found
	not rcx			; invert rcx to get what we want + 1
	mov rdi, rcx	; copy rcx to rdi for malloc call
	push rcx		; preserve rcx
	call _malloc	; malloc
	pop rcx
	pop rsi
	mov rdi, rax
	rep movsb		; load from rsi to rax
	ret

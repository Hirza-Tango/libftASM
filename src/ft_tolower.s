BITS 64

section .text
global _ft_tolower

ALIGN 16
_ft_tolower:
	mov rax, rdi	; move input to RAX
	cmp rdi, 0x41	; if less than 'A'
	jl nochange		; nothing to change
	cmp rdi, 0x5B	; if greater/equal 'Z' + 1
	jge nochange	; nothing to change
	add rax, 0x20	; add difference to RAX
	ret				; return

nochange:
	ret				;return

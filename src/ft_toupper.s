BITS 64

section .text
global _ft_toupper

ALIGN 16
_ft_toupper:
	mov rax, rdi	; move input to RAX
	cmp rdi, 0x61	; if less than 'a'
	jl nochange		; nothing to change
	cmp rdi, 0x7B	; if greater/equal 'z' + 1
	jge nochange	; nothing to change
	add rax, -0x20	; subtract difference from RAX
	ret				; return

nochange:
	ret				; return

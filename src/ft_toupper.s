BITS 64

section .text
global _ft_toupper

ALIGN 16
_ft_toupper:
	mov eax, edi	; move input to RAX
	cmp eax, 0x61	; if less than 'a'
	jl nochange		; nothing to change
	cmp eax, 0x7B	; if greater/equal 'z' + 1
	jge nochange	; nothing to change
	add eax, -0x20	; subtract difference from RAX
	ret				; return

nochange:
	ret				; return

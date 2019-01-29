BITS 64

section .text
global _ft_isascii

ALIGN 16
_ft_isascii:
	cmp rdi, 0x00	; if less than 0
	jl false		; return false
	cmp rdi, 0x80	; if less than 255 + 1
	jl true			; return true
	jmp false		; return false

true:
	mov rax, 1	; return value 1
	ret			; return

false:
	mov rax, 0	; return value 0
	ret			; return

BITS 64

section .text
global _ft_isprint

ALIGN 16
_ft_isprint:
	cmp rdi, 0x20	; if less than sp
	jl false		; return false
	cmp rdi, 0x7F	; if less than '~' + 1
	jl true			; return true

false:
	mov rax, 0	; return value 0
	ret			; return

true:
	mov rax, 1	; return value 1
	ret			; return

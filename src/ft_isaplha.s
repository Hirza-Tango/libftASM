BITS 64

section .text
global _ft_isalpha

ALIGN 16
_ft_isalpha:
	cmp rdi, 0x41	; if less than 'A'
	jl false		; return false
	cmp rdi, 0x5B	; if less than 'Z' + 1 (jb saves 1 cycle vs jbe)
	jl true			; return true
	cmp rdi, 0x61	; if less than 'a'
	jl false		; return false
	cmp rdi, 0x7B	; if less than 'z' + 1
	jl true			; return true
	jmp false		; return false

true:
	mov rax, 1	; return value 1
	ret			; return

false:
	mov rax, 0	; return value 0
	ret			; return

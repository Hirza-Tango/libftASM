BITS 64

section .text
global _ft_isalpha

ALIGN 16
_ft_isalpha:
	cmp edi, 0x41	; if less than 'A'
	jl false		; return false
	cmp edi, 0x5B	; if less than 'Z' + 1 (jl saves 1 cycle vs jle)
	jl true			; return true
	cmp edi, 0x61	; if less than 'a'
	jl false		; return false
	cmp edi, 0x7B	; if less than 'z' + 1
	jl true			; return true

false:
	mov eax, 0	; return value 0
	ret			; return

true:
	mov eax, 1	; return value 1
	ret			; return

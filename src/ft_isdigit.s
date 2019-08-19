BITS 64

section .text
global _ft_isdigit

ALIGN 16
_ft_isdigit:
	cmp edi, 0x30	; if less than '0'
	jl false		; return false
	cmp edi, 0x3A	; if less than '9' + 1 (jb saves 1 cycle vs jbe)
	jl true			; return true

false:
	mov eax, 0	; return value 0
	ret			; return

true:
	mov eax, 1	; return value 1
	ret			; return

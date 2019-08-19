BITS 64

section .text
global _ft_isalnum

ALIGN 16
_ft_isalnum:
	; we reimplement this because it's more efficient than calling
	; each call creates a new stack, which we don't need
	cmp edi, 0x30	; if less than '0'
	jl false		; return false
	cmp edi, 0x3A	; if less than '9' + 1 (jb saves 1 cycle vs jbe)
	jl true			; return true
	cmp edi, 0x41	; if less than 'A'
	jl false		; return false
	cmp edi, 0x5B	; if less than 'Z' + 1 (jb saves 1 cycle vs jbe)
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

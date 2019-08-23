BITS 64

section .text
global _ft_toupper

ALIGN 16
_ft_toupper:
	mov eax, edi	; move input to EAX
	cmp eax, 0x61	; if less than 'a'
	jl end			; nothing to change
	cmp eax, 0x7B	; if greater/equal 'z' + 1
	jge end			; nothing to change
	sub eax, 0x20	; subtract difference from EAX

end:
	ret				; return

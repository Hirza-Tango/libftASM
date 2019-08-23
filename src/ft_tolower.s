BITS 64

section .text
global _ft_tolower

ALIGN 16
_ft_tolower:
	mov eax, edi	; move input to EAX
	cmp eax, 0x41	; if less than 'A'
	jl end			; nothing to change
	cmp eax, 0x5B	; if greater/equal 'Z' + 1
	jge end			; nothing to change
	add eax, 0x20	; add difference to EAX

end:
	ret				; return

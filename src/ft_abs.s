BITS 64

section .text
global _ft_abs

ALIGN 16
_ft_abs:
	mov eax, edi 
	neg edi			;negate. Would've been handy earlier, eh?
	cmovl edi, eax	; conditional move if rax less than rdi, move rdi to rax
	ret

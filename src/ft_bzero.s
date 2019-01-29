BITS 64

section .text
global _ft_bzero

_ft_bzero:
	mov rcx, rsi	; loop RSI times
	loop zero

zero:
	mov [rdi], byte 0; put a zero byte in what's in RDI
	inc rdi; increment RDI by 1 byte

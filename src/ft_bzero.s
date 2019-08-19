BITS 64

section .text
global _ft_bzero

_ft_bzero:
	cmp rsi, 0			; if n is zero
	je __end			; return
	mov rcx, rsi		; Move 2nd argument to count register

__zero:
	mov byte [rdi + rcx - 1], byte 0	; put a zero byte at pointer + counter
	loop __zero

__end:
	ret

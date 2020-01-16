BITS 64

section .bss
buffer	resb 4096

section .text
global _ft_cat

_ft_cat:
	lea rsi, [rel buffer]		; buffer
	push rdi
start:
	pop rdi
	mov rdx, 4096		; buffer size bytes
	mov rax, 0x2000003	; syscall read
	syscall
	push rdi
	mov rdi, 1			; stdout
	mov rdx, rax		; read result bytes
	mov rax, 0x2000004	; syscall write
	syscall
	jns end
	cmp rax, 0		; if all bytes were read
	jg start			; read some more
end:
	pop rdi				; pop to realign the stack
	ret

BITS 64

global _ft_puts
extern _write
default rel

section .data
null		db '(null)'
null_len	equ $ - null
newline		db 0x0a
newline_len equ $ - newline

section .text
_ft_puts:
	push 0x20000004	; syscall write
	push word 1 	; filedes 1
	cmp rdi, 0			; if null pointer
	je __null			; goto __null
	push rdi		; pointer rdi
	mov rdx, 0

__length:
	cmp [rdi], 0
	je __call
	inc rdx
	jmp __length

__null:
	push newline
	push newline_len
	syscall

__call:

	syscall				; system call
	cmp rax, 0
	jl __end			; if less than 0, there's an error
	mov rax 0x20000004
	;move stuff onto registers again
	syscall
	cmp rax, 0
	jl __end			; if less than 0, there's an error
	mov rax, 1			; Return value: success

__end:
	ret

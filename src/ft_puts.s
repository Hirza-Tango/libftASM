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
	cmp rdi, 0	; if null pointer
	je __null	; goto __null
	; now we calculate the string length
	mov al, 0		; tell scas to look for 0
	mov rcx, 0xffffffffffffffff	; scas decrements rcx, and stops at 0
	; hence, 0 can't be used as a start value
	push rdi
	repne scasb		; scan until null byte is found
	not rcx			; invert rcx to get what we want
	dec rcx			; decrease by 1 to account for the -1 start
	mov rdx, rcx	; move count to 3rd argument
	pop rsi			; move buffer to 2nd argument
	jmp __call		; goto call

__null:
	lea rsi, [rel null]	; 2nd argument (null)
	mov rdx, null_len	; 3rd argument length

__call:
	mov rdi, 1
	mov rax, 0x2000004	; syscall write
	syscall				; system call
	cmp rax, 0
	jl err			; if less than 0, there's an error
	mov rdi, 1
	mov rax, 0x2000004	; rdi and rax are clobbered by the syscall
	lea rsi, [rel newline]
	mov rdx, newline_len
	syscall
	cmp rax, 0
	jl err			; if less than 0, there's an error
	mov rax, 1			; Return value: success
	ret

err:
	ret

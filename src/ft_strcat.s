BITS 64

section .text
global _ft_strcat

_ft_strcat:
	mov rax, rdi

__move_to_end:
	cmp byte [rdi], 0	; at null terminator
	je __write_over		; start writing
	inc rdi				; rdi++
	jmp __move_to_end	; loop

__write_over:
	movsb				; copy byte from rsi to rdi
	cmp byte [rsi], 0	; at null terminator
	jne __write_over	; loop if not null
	ret

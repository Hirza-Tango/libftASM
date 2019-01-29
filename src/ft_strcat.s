BITS 64

section .text
global _ft_strcat

_ft_strcat:
	; loop until null character
	cmp [rdi], 0

.intel_syntax noprefix

.include "atoi.S"
.include "constants.S"
.include "data.S"
.include "print.S"

.lcomm input, 3

.global _start

_start:
	mov  rax, offset welcome_message
	mov  rdi, 37
	call print_str

	call loop

	mov rax, 60
	xor rdi, rdi
	syscall

loop:
	mov  rax, offset number_prompt
	mov  rdi, 34
	call print_str
	call print_flush

	xor rax, rax
	xor rdi, rdi
	mov rsi, offset input
	mov rdx, 3
	syscall
	xor rdx, rdx

	mov  rdi, offset input
	call atoi

	cmp rax, number
	jl  low
	jg  high

	mov  rax, offset win_message
	mov  rdi, 26
	call print_str
	call print_flush
	ret

low:
	mov  rax, offset low_message
	mov  rdi, 20
	call print_str
	jmp  loop

high:
	mov  rax, offset high_message
	mov  rdi, 21
	call print_str
	jmp  loop

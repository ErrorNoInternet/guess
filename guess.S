.intel_syntax noprefix

.include "atoi.S"
.include "constants.S"
.include "data.S"

.lcomm input, 3

.global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, offset welcome
	mov rdx, 37
	syscall

	call loop

	mov rax, 60
	xor rdi, rdi
	syscall

loop:
	mov rax, 1
	mov rdi, 1
	mov rsi, offset number_prompt
	mov rdx, 34
	syscall

	xor rax, rax
	xor rdi, rdi
	mov rsi, offset input
	mov rdi, 2
	syscall

	mov  rdi, offset input
	call atoi

	cmp rax, number
	jl  low
	jg  high
	je  correct

low:
	mov rax, 1
	mov rdi, 1
	mov rsi, offset low_message
	mov rdx, 20
	syscall
	jmp loop

high:
	mov rax, 1
	mov rdi, 1
	mov rsi, offset high_message
	mov rdx, 21
	syscall
	jmp loop

correct:
	mov rax, 1
	mov rdi, 1
	mov rsi, offset win_message
	mov rdx, 26
	syscall
	ret

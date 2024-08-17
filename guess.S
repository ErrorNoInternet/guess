.intel_syntax noprefix

.include "atoi.S"
.include "constants.S"
.include "data.S"
.include "itoa.S"
.include "print.S"

.lcomm tries, 1
.lcomm input, 10

.global _start

_start:
	mov bl, max_tries
	mov [tries], bl

	mov  rax, offset welcome_message
	mov  rdi, 37
	call print_str

	call loop

exit:
	mov rax, 60
	xor rdi, rdi
	syscall

loop:
	mov  rax, offset tries_message_0
	mov  rdi, 9
	call print_str

	push rdx
	mov  rax, tries
	mov  rbx, 10
	call itoa
	mov  rdi, rax
	mov  rax, offset itoa_buf
	pop  rdx
	call print_str

	mov bl, tries
	cmp bl, 1
	jg  loop_
	mov rax, offset tries_message_1_last
	mov rdi, 47
	jmp loop__

loop_:
	mov rax, offset tries_message_1
	mov rdi, 44

loop__:
	call print_str

	mov  rax, offset number_prompt
	mov  rdi, 18
	call print_str
	call print_flush

	xor rax, rax
	xor rdi, rdi
	mov rsi, offset input
	mov rdx, 10
	syscall
	xor rdx, rdx

	test rax, rax
	je   exit

	mov  rdi, offset input
	call atoi

	cmp rax, 1
	jl  invalid
	cmp rax, 100
	jg  invalid
	cmp rax, number
	jl  low
	jg  high

	mov  rax, offset win_message
	mov  rdi, 26
	call print_str
	call print_flush
	ret

lose:
	mov  rax, offset lose_message_0
	mov  rdi, 44
	call print_str

	push rdx
	mov  rax, number
	mov  rbx, 10
	call itoa
	mov  rdi, rax
	mov  rax, offset itoa_buf
	pop  rdx
	call print_str

	mov  rax, offset lose_message_1
	mov  rdi, 27
	call print_str
	call print_flush

	ret

low:
	mov  rax, offset low_message
	mov  rdi, 9
	call print_str
	jmp  dec_tries

high:
	mov  rax, offset high_message
	mov  rdi, 10
	call print_str
	jmp  dec_tries

invalid:
	mov  rax, offset invalid_message
	mov  rdi, 16
	call print_str
	jmp  loop

dec_tries:
	mov bl, [tries]
	dec bl

	test bl, bl
	je   lose

	mov [tries], bl
	jmp loop

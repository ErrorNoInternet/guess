.lcomm _print_buf, 4096

print_str:
	mov bl, [rax]
	inc rax

	mov [_print_buf + rdx], bl
	inc rdx

	dec  rdi
	test rdi, rdi
	jne  print_str

	ret

print_flush:
	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, offset _print_buf
	syscall

	xor rdx, rdx
	ret

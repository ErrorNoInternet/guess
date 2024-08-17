.lcomm itoa_buf, 20

itoa:
	mov rsi, 20

itoa_loop:
	test rax, rax
	jne  itoa_convert
    mov rcx, 20
    sub rcx, rsi
	jmp  itoa_done

itoa_convert:
	xor rdx, rdx
	div rbx
	add rdx, 48
	dec rsi
	mov [itoa_buf + rsi], dl
	jmp itoa_loop

itoa_done:
	mov dl, [itoa_buf + rsi + rax]
	mov [itoa_buf + rax], dl
	inc rax
	cmp rax, rcx
	jne itoa_done

	ret

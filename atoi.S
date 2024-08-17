atoi:
	xor rax, rax

atoi_convert:
	mov   bl, [rdi]
	movzx rsi, bl
	inc   rdi

	test rsi, rsi
	je   done
	cmp  rsi, 10
	je   done

	cmp rsi, 48
	jl  error
	cmp rsi, 57
	jg  error

	sub  rsi, 48
	imul rax, 10
	add  rax, rsi

	jmp atoi_convert

error:
	mov rax, -1

done:
	ret

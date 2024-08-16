atoi:
	xor rax, rax

convert:
	mov   bl, [rdi]
	movzx rsi, bl

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

	inc rdi
	jmp convert

error:
	mov rax, -1

done:
	ret

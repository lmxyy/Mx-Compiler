global main

extern malloc
section .text

___check:
___check..check.entry:
	push rbp
	mov rbp,rsp
	sub rsp,256
	mov r8,qword [___m]
	mov qword [rbp-56],r8
	mov r8,qword [___sat]
	mov qword [rbp-8],r8
	mov r8,qword [___assignment]
	mov qword [rbp-144],r8
	mov r8,0
	mov qword [rbp-104],r8
	mov r8,0
	mov qword [rbp-136],r8
	mov r8,0
	mov qword [rbp-104],r8
	jmp ___check..for_cond
___check..for_cond:
	mov r8,qword [rbp-104]
	mov r9,qword [rbp-56]
	cmp r8,r9
	mov r10,0
	setl r10b
	mov qword [rbp-40],r10
	mov r8,qword [rbp-40]
	cmp r8b,1
	jz ___check..for_loop
	jnz ___check..for_after
___check..for_loop:
	mov r8,0
	mov qword [rbp-128],r8
	mov r8,0
	mov qword [rbp-136],r8
	jmp ___check..for_cond_2
___check..for_cond_2:
	mov r8,qword [rbp-136]
	cmp r8,3
	mov r9,0
	setl r9b
	mov qword [rbp-48],r9
	mov r8,qword [rbp-48]
	cmp r8b,1
	jz ___check..for_loop_2
	jnz ___check..for_after_2
___check..for_loop_2:
	mov r8,qword [rbp-104]
	mov r9,r8
	mov qword [rbp-88],r9
	mov r8,qword [rbp-88]
	imul r8,8
	mov qword [rbp-88],r8
	mov r8,qword [rbp-8]
	mov r9,qword [rbp-88]
	add r9,r8
	mov qword [rbp-88],r9
	mov r8,qword [rbp-88]
	mov r8,qword [r8+8]
	mov qword [rbp-88],r8
	mov r8,qword [rbp-136]
	mov r9,r8
	mov qword [rbp-176],r9
	mov r8,qword [rbp-176]
	imul r8,8
	mov qword [rbp-176],r8
	mov r8,qword [rbp-88]
	mov r9,qword [rbp-176]
	add r9,r8
	mov qword [rbp-176],r9
	mov r8,qword [rbp-176]
	mov r8,qword [r8+8]
	mov qword [rbp-176],r8
	mov r8,qword [rbp-176]
	mov r9,r8
	mov qword [rbp-32],r9
	mov r8,qword [rbp-32]
	cmp r8,0
	mov r9,0
	setg r9b
	mov qword [rbp-112],r9
	mov r8,qword [rbp-112]
	cmp r8b,1
	jz ___check..lhs_true
	jnz ___check..lhs_false
___check..lhs_true:
	mov r8,qword [rbp-32]
	mov r9,r8
	mov qword [rbp-72],r9
	mov r8,qword [rbp-72]
	imul r8,8
	mov qword [rbp-72],r8
	mov r8,qword [rbp-144]
	mov r9,qword [rbp-72]
	add r9,r8
	mov qword [rbp-72],r9
	mov r8,qword [rbp-72]
	mov r8,qword [r8+8]
	mov qword [rbp-72],r8
	mov r8,qword [rbp-72]
	cmp r8,1
	mov r9,0
	sete r9b
	mov qword [rbp-152],r9
	mov r8,qword [rbp-152]
	mov r9,r8
	mov qword [rbp-80],r9
	jmp ___check..lhs_merge
___check..lhs_false:
	mov r8,0
	mov qword [rbp-80],r8
	jmp ___check..lhs_merge
___check..lhs_merge:
	mov r8,qword [rbp-80]
	cmp r8b,1
	jz ___check..if_true
	jnz ___check..if_after
___check..if_true:
	mov r8,1
	mov qword [rbp-128],r8
	jmp ___check..if_after
___check..if_after:
	mov r8,qword [rbp-32]
	cmp r8,0
	mov r9,0
	setl r9b
	mov qword [rbp-168],r9
	mov r8,qword [rbp-168]
	cmp r8b,1
	jz ___check..lhs_true_2
	jnz ___check..lhs_false_2
___check..lhs_true_2:
	mov r8,qword [rbp-32]
	mov r9,r8
	mov qword [rbp-96],r9
	mov r8,qword [rbp-96]
	neg r8
	mov qword [rbp-96],r8
	mov r8,qword [rbp-96]
	mov r9,r8
	mov qword [rbp-64],r9
	mov r8,qword [rbp-64]
	mov r9,r8
	mov qword [rbp-120],r9
	mov r8,qword [rbp-120]
	imul r8,8
	mov qword [rbp-120],r8
	mov r8,qword [rbp-144]
	mov r9,qword [rbp-120]
	add r9,r8
	mov qword [rbp-120],r9
	mov r8,qword [rbp-120]
	mov r8,qword [r8+8]
	mov qword [rbp-120],r8
	mov r8,qword [rbp-120]
	cmp r8,0
	mov r9,0
	sete r9b
	mov qword [rbp-24],r9
	mov r8,qword [rbp-24]
	mov r9,r8
	mov qword [rbp-160],r9
	jmp ___check..lhs_merge_2
___check..lhs_false_2:
	mov r8,0
	mov qword [rbp-160],r8
	jmp ___check..lhs_merge_2
___check..lhs_merge_2:
	mov r8,qword [rbp-160]
	cmp r8b,1
	jz ___check..if_true_2
	jnz ___check..if_after_2
___check..if_true_2:
	mov r8,1
	mov qword [rbp-128],r8
	jmp ___check..if_after_2
___check..if_after_2:
	jmp ___check..for_step
___check..for_step:
	mov r8,qword [rbp-136]
	add r8,1
	mov qword [rbp-136],r8
	jmp ___check..for_cond_2
___check..for_after_2:
	mov r8,qword [rbp-128]
	cmp r8,0
	mov r9,0
	sete r9b
	mov qword [rbp-184],r9
	mov r8,qword [rbp-184]
	cmp r8b,1
	jz ___check..if_true_3
	jnz ___check..if_after_3
___check..if_true_3:
	mov r8,0
	mov qword [rbp-16],r8
	jmp ___check..check.exit
___check..if_after_3:
	jmp ___check..for_step_2
___check..for_step_2:
	mov r8,qword [rbp-104]
	add r8,1
	mov qword [rbp-104],r8
	jmp ___check..for_cond
___check..for_after:
	mov r8,1
	mov qword [rbp-16],r8
	jmp ___check..check.exit
___check..check.exit:
	mov r8,qword [rbp-16]
	mov rax,r8
	leave
	ret

___myprint:
___myprint..myprint.entry:
	push rbp
	mov rbp,rsp
	sub rsp,128
	mov qword [rbp-24],rdi
	mov r8,qword [___myHash]
	mov qword [rbp-48],r8
	mov r8,0
	mov qword [rbp-8],r8
	mov r8,0
	mov qword [rbp-8],r8
	jmp ___myprint..for_cond
___myprint..for_cond:
	mov r8,qword [rbp-24]
	mov r9,qword [r8]
	mov qword [rbp-32],r9
	mov r8,qword [rbp-8]
	mov r9,qword [rbp-32]
	cmp r8,r9
	mov r10,0
	setl r10b
	mov qword [rbp-16],r10
	mov r8,qword [rbp-16]
	cmp r8b,1
	jz ___myprint..for_loop
	jnz ___myprint..for_after
___myprint..for_loop:
	mov qword [rbp-64],r8
	mov qword [rbp-72],r9
	mov qword [rbp-80],r10
	mov rsi,qword [rbp-8]
	mov rdi,qword [rbp-24]
	call _Z9stringOrdPci
	mov r10,qword [rbp-80]
	mov r9,qword [rbp-72]
	mov r8,qword [rbp-64]
	mov r8,rax
	mov qword [rbp-40],r8
	mov r8,qword [rbp-48]
	mov r9,r8
	mov qword [rbp-56],r9
	mov r8,qword [rbp-40]
	mov r9,qword [rbp-56]
	add r9,r8
	mov qword [rbp-56],r9
	mov r8,qword [rbp-56]
	mov r9,r8
	mov qword [rbp-48],r9
	jmp ___myprint..for_step
___myprint..for_step:
	mov r8,qword [rbp-8]
	add r8,1
	mov qword [rbp-8],r8
	jmp ___myprint..for_cond
___myprint..for_after:
	mov r8,qword [rbp-48]
	mov qword [___myHash],r8
	leave
	ret

___payoff:
___payoff..payoff.entry:
	push rbp
	mov rbp,rsp
	sub rsp,144
	mov qword [rbp-8],rdi
	mov qword [rbp-56],rsi
	mov r8,0
	mov qword [rbp-24],r8
	mov r8,0
	mov qword [rbp-40],r8
	mov r8,0
	mov qword [rbp-40],r8
	jmp ___payoff..for_cond
___payoff..for_cond:
	mov r8,qword [rbp-40]
	cmp r8,3
	mov r9,0
	setl r9b
	mov qword [rbp-48],r9
	mov r8,qword [rbp-48]
	cmp r8b,1
	jz ___payoff..for_loop
	jnz ___payoff..for_after
___payoff..for_after:
	mov r8,qword [rbp-24]
	mov rax,r8
	leave
	ret
___payoff..for_loop:
	mov r8,qword [rbp-40]
	mov r9,r8
	mov qword [rbp-32],r9
	mov r8,qword [rbp-32]
	imul r8,8
	mov qword [rbp-32],r8
	mov r8,qword [rbp-8]
	mov r9,qword [rbp-32]
	add r9,r8
	mov qword [rbp-32],r9
	mov r8,qword [rbp-32]
	mov r8,qword [r8+8]
	mov qword [rbp-32],r8
	mov r8,qword [rbp-40]
	mov r9,r8
	mov qword [rbp-72],r9
	mov r8,qword [rbp-72]
	imul r8,8
	mov qword [rbp-72],r8
	mov r8,qword [rbp-56]
	mov r9,qword [rbp-72]
	add r9,r8
	mov qword [rbp-72],r9
	mov r8,qword [rbp-72]
	mov r8,qword [r8+8]
	mov qword [rbp-72],r8
	mov r8,qword [rbp-32]
	mov r9,qword [rbp-72]
	cmp r8,r9
	mov r10,0
	setne r10b
	mov qword [rbp-16],r10
	mov r8,qword [rbp-16]
	cmp r8b,1
	jz ___payoff..if_true
	jnz ___payoff..if_after
___payoff..if_true:
	mov r8,qword [rbp-24]
	mov r9,r8
	mov qword [rbp-64],r9
	mov r8,qword [rbp-24]
	add r8,1
	mov qword [rbp-24],r8
	jmp ___payoff..if_after
___payoff..if_after:
	jmp ___payoff..for_step
___payoff..for_step:
	mov r8,qword [rbp-40]
	add r8,1
	mov qword [rbp-40],r8
	jmp ___payoff..for_cond

___print_cond:
___print_cond..print_cond.entry:
	push rbp
	mov rbp,rsp
	sub rsp,304
	mov qword [rbp-208],rdi
	mov r8,qword [___cond_ass]
	mov qword [rbp-8],r8
	mov r8,___string
	mov qword [rbp-128],r8
	mov r8,qword [___assignment]
	mov qword [rbp-48],r8
	mov r8,qword [___n]
	mov qword [rbp-64],r8
	mov r8,___string_2
	mov qword [rbp-96],r8
	mov r8,qword [rbp-208]
	mov r9,qword [rbp-64]
	cmp r8,r9
	mov r10,0
	sete r10b
	mov qword [rbp-224],r10
	mov r8,qword [rbp-224]
	cmp r8b,1
	jz ___print_cond..if_true
	jnz ___print_cond..if_after
___print_cond..if_after:
	mov r8,qword [rbp-208]
	mov r9,r8
	mov qword [rbp-72],r9
	mov r8,qword [rbp-72]
	add r8,1
	mov qword [rbp-72],r8
	mov r8,qword [rbp-72]
	mov r9,r8
	mov qword [rbp-16],r9
	mov r8,qword [rbp-16]
	imul r8,8
	mov qword [rbp-16],r8
	mov r8,qword [rbp-8]
	mov r9,qword [rbp-16]
	add r9,r8
	mov qword [rbp-16],r9
	mov r8,qword [rbp-16]
	mov qword [r8+8],1
	mov r8,qword [rbp-208]
	mov r9,r8
	mov qword [rbp-32],r9
	mov r8,qword [rbp-32]
	add r8,1
	mov qword [rbp-32],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-32]
	call ___print_cond
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-144],r8
	mov r8,___string_2
	mov qword [rbp-96],r8
	mov r8,qword [___n]
	mov qword [rbp-64],r8
	mov r8,qword [___assignment]
	mov qword [rbp-48],r8
	mov r8,___string
	mov qword [rbp-128],r8
	mov r8,qword [___cond_ass]
	mov qword [rbp-8],r8
	mov r8,qword [rbp-208]
	mov r9,r8
	mov qword [rbp-112],r9
	mov r8,qword [rbp-112]
	add r8,1
	mov qword [rbp-112],r8
	mov r8,qword [rbp-112]
	mov r9,r8
	mov qword [rbp-88],r9
	mov r8,qword [rbp-88]
	imul r8,8
	mov qword [rbp-88],r8
	mov r8,qword [rbp-8]
	mov r9,qword [rbp-88]
	add r9,r8
	mov qword [rbp-88],r9
	mov r8,qword [rbp-88]
	mov qword [r8+8],0
	mov r8,qword [rbp-208]
	mov r9,r8
	mov qword [rbp-136],r9
	mov r8,qword [rbp-136]
	add r8,1
	mov qword [rbp-136],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-136]
	call ___print_cond
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-80],r8
	mov r8,___string_2
	mov qword [rbp-96],r8
	mov r8,qword [___n]
	mov qword [rbp-64],r8
	mov r8,qword [___assignment]
	mov qword [rbp-48],r8
	mov r8,___string
	mov qword [rbp-128],r8
	mov r8,qword [___cond_ass]
	mov qword [rbp-8],r8
	jmp ___print_cond..print_cond.exit
___print_cond..if_true:
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov qword [rbp-272],rsi
	mov rsi,qword [rbp-48]
	mov rdi,qword [rbp-8]
	call ___payoff
	mov rsi,qword [rbp-272]
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-192],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov rdi,qword [rbp-192]
	call _Z8toStringi
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-160],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov rsi,qword [rbp-160]
	mov rdi,qword [rbp-96]
	call _Z12stringConcatPcS_
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-40],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov rsi,qword [rbp-128]
	mov rdi,qword [rbp-40]
	call _Z12stringConcatPcS_
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-176],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-176]
	call ___myprint
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-200],r8
	mov r8,0
	mov qword [rbp-120],r8
	mov r8,0
	mov qword [rbp-120],r8
	jmp ___print_cond..for_cond
___print_cond..for_cond:
	mov r8,qword [rbp-120]
	mov r9,qword [rbp-64]
	cmp r8,r9
	mov r10,0
	setl r10b
	mov qword [rbp-104],r10
	mov r8,qword [rbp-104]
	cmp r8b,1
	jz ___print_cond..for_loop
	jnz ___print_cond..for_after
___print_cond..for_after:
	jmp ___print_cond..print_cond.exit
___print_cond..print_cond.exit:
	leave
	ret
___print_cond..for_loop:
	mov r8,qword [rbp-120]
	mov rax,r8
	cqo
	mov r8,10
	mov qword [rbp-232],r8
	mov r8,qword [rbp-232]
	idiv r8
	mov r8,rdx
	mov qword [rbp-216],r8
	mov r8,qword [rbp-216]
	cmp r8,0
	mov r9,0
	sete r9b
	mov qword [rbp-168],r9
	mov r8,qword [rbp-168]
	cmp r8b,1
	jz ___print_cond..if_true_2
	jnz ___print_cond..if_after_2
___print_cond..if_true_2:
	mov r8,qword [rbp-120]
	mov r9,r8
	mov qword [rbp-152],r9
	mov r8,qword [rbp-152]
	add r8,1
	mov qword [rbp-152],r8
	mov r8,qword [rbp-152]
	mov r9,r8
	mov qword [rbp-184],r9
	mov r8,qword [rbp-184]
	imul r8,8
	mov qword [rbp-184],r8
	mov r8,qword [rbp-8]
	mov r9,qword [rbp-184]
	add r9,r8
	mov qword [rbp-184],r9
	mov r8,qword [rbp-184]
	mov r8,qword [r8+8]
	mov qword [rbp-184],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov rdi,qword [rbp-184]
	call _Z8toStringi
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-56],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-56]
	call ___myprint
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-24],r8
	jmp ___print_cond..if_after_2
___print_cond..if_after_2:
	jmp ___print_cond..for_step
___print_cond..for_step:
	mov r8,qword [rbp-120]
	add r8,1
	mov qword [rbp-120],r8
	jmp ___print_cond..for_cond

___dfs:
___dfs..dfs.entry:
	push rbp
	mov rbp,rsp
	sub rsp,224
	mov qword [rbp-104],rdi
	mov r8,qword [___assignment]
	mov qword [rbp-112],r8
	mov r8,___string_3
	mov qword [rbp-136],r8
	mov r8,qword [___n]
	mov qword [rbp-48],r8
	mov r8,___string_4
	mov qword [rbp-152],r8
	mov r8,qword [rbp-104]
	mov r9,qword [rbp-48]
	cmp r8,r9
	mov r10,0
	sete r10b
	mov qword [rbp-128],r10
	mov r8,qword [rbp-128]
	cmp r8b,1
	jz ___dfs..if_true
	jnz ___dfs..if_after
___dfs..if_after:
	mov r8,qword [rbp-104]
	mov r9,r8
	mov qword [rbp-88],r9
	mov r8,qword [rbp-88]
	add r8,1
	mov qword [rbp-88],r8
	mov r8,qword [rbp-88]
	mov r9,r8
	mov qword [rbp-144],r9
	mov r8,qword [rbp-144]
	imul r8,8
	mov qword [rbp-144],r8
	mov r8,qword [rbp-112]
	mov r9,qword [rbp-144]
	add r9,r8
	mov qword [rbp-144],r9
	mov r8,qword [rbp-144]
	mov qword [r8+8],1
	mov r8,qword [rbp-104]
	mov r9,r8
	mov qword [rbp-24],r9
	mov r8,qword [rbp-24]
	add r8,1
	mov qword [rbp-24],r8
	mov qword [rbp-160],r8
	mov qword [rbp-168],r9
	mov qword [rbp-176],r10
	mov qword [rbp-184],rdi
	mov rdi,qword [rbp-24]
	call ___dfs
	mov rdi,qword [rbp-184]
	mov r10,qword [rbp-176]
	mov r9,qword [rbp-168]
	mov r8,qword [rbp-160]
	mov r8,rax
	mov qword [rbp-96],r8
	mov r8,___string_4
	mov qword [rbp-152],r8
	mov r8,qword [___n]
	mov qword [rbp-48],r8
	mov r8,___string_3
	mov qword [rbp-136],r8
	mov r8,qword [___assignment]
	mov qword [rbp-112],r8
	mov r8,qword [rbp-104]
	mov r9,r8
	mov qword [rbp-16],r9
	mov r8,qword [rbp-16]
	add r8,1
	mov qword [rbp-16],r8
	mov r8,qword [rbp-16]
	mov r9,r8
	mov qword [rbp-72],r9
	mov r8,qword [rbp-72]
	imul r8,8
	mov qword [rbp-72],r8
	mov r8,qword [rbp-112]
	mov r9,qword [rbp-72]
	add r9,r8
	mov qword [rbp-72],r9
	mov r8,qword [rbp-72]
	mov qword [r8+8],0
	mov r8,qword [rbp-104]
	mov r9,r8
	mov qword [rbp-80],r9
	mov r8,qword [rbp-80]
	add r8,1
	mov qword [rbp-80],r8
	mov qword [rbp-160],r8
	mov qword [rbp-168],r9
	mov qword [rbp-176],r10
	mov qword [rbp-184],rdi
	mov rdi,qword [rbp-80]
	call ___dfs
	mov rdi,qword [rbp-184]
	mov r10,qword [rbp-176]
	mov r9,qword [rbp-168]
	mov r8,qword [rbp-160]
	mov r8,rax
	mov qword [rbp-56],r8
	mov r8,___string_4
	mov qword [rbp-152],r8
	mov r8,qword [___n]
	mov qword [rbp-48],r8
	mov r8,___string_3
	mov qword [rbp-136],r8
	mov r8,qword [___assignment]
	mov qword [rbp-112],r8
	jmp ___dfs..dfs.exit
___dfs..if_true:
	mov qword [rbp-160],r8
	mov qword [rbp-168],r9
	mov qword [rbp-176],r10
	call ___check
	mov r10,qword [rbp-176]
	mov r9,qword [rbp-168]
	mov r8,qword [rbp-160]
	mov r8,rax
	mov qword [rbp-64],r8
	mov r8,qword [___assignment]
	mov qword [rbp-112],r8
	mov r8,qword [rbp-64]
	cmp r8,1
	mov r9,0
	sete r9b
	mov qword [rbp-120],r9
	mov r8,qword [rbp-120]
	cmp r8b,1
	jz ___dfs..if_true_2
	jnz ___dfs..if_after_2
___dfs..if_true_2:
	mov qword [rbp-160],r8
	mov qword [rbp-168],r9
	mov qword [rbp-176],r10
	mov qword [rbp-184],rdi
	mov rdi,qword [rbp-136]
	call ___myprint
	mov rdi,qword [rbp-184]
	mov r10,qword [rbp-176]
	mov r9,qword [rbp-168]
	mov r8,qword [rbp-160]
	mov r8,rax
	mov qword [rbp-40],r8
	mov qword [rbp-160],r8
	mov qword [rbp-168],r9
	mov qword [rbp-176],r10
	mov qword [rbp-184],rdi
	mov rdi,0
	call ___print_cond
	mov rdi,qword [rbp-184]
	mov r10,qword [rbp-176]
	mov r9,qword [rbp-168]
	mov r8,qword [rbp-160]
	mov r8,rax
	mov qword [rbp-8],r8
	mov r8,qword [___n]
	mov qword [rbp-48],r8
	mov r8,qword [___assignment]
	mov qword [rbp-112],r8
	mov qword [rbp-160],r8
	mov qword [rbp-168],r9
	mov qword [rbp-176],r10
	mov qword [rbp-184],rdi
	mov rdi,qword [rbp-152]
	call ___myprint
	mov rdi,qword [rbp-184]
	mov r10,qword [rbp-176]
	mov r9,qword [rbp-168]
	mov r8,qword [rbp-160]
	mov r8,rax
	mov qword [rbp-32],r8
	jmp ___dfs..if_after_2
___dfs..if_after_2:
	jmp ___dfs..dfs.exit
___dfs..dfs.exit:
	leave
	ret

___print_last_cond:
___print_last_cond..print_last_cond.entry:
	push rbp
	mov rbp,rsp
	sub rsp,304
	mov qword [rbp-40],rdi
	mov r8,___string_5
	mov qword [rbp-120],r8
	mov r8,___string_6
	mov qword [rbp-24],r8
	mov r8,qword [___assignment]
	mov qword [rbp-160],r8
	mov r8,qword [___n]
	mov qword [rbp-104],r8
	mov r8,___string_7
	mov qword [rbp-128],r8
	mov r8,qword [rbp-40]
	mov r9,qword [rbp-104]
	cmp r8,r9
	mov r10,0
	sete r10b
	mov qword [rbp-48],r10
	mov r8,qword [rbp-48]
	cmp r8b,1
	jz ___print_last_cond..if_true
	jnz ___print_last_cond..if_after
___print_last_cond..if_true:
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-24]
	call ___myprint
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-80],r8
	mov r8,1
	mov qword [rbp-112],r8
	mov r8,0
	mov qword [rbp-72],r8
	mov r8,0
	mov qword [rbp-72],r8
	jmp ___print_last_cond..for_cond
___print_last_cond..for_cond:
	mov r8,qword [rbp-72]
	mov r9,qword [rbp-104]
	cmp r8,r9
	mov r10,0
	setl r10b
	mov qword [rbp-96],r10
	mov r8,qword [rbp-96]
	cmp r8b,1
	jz ___print_last_cond..for_loop
	jnz ___print_last_cond..for_after
___print_last_cond..for_after:
	mov r8,qword [rbp-112]
	cmp r8,0
	mov r9,0
	sete r9b
	mov qword [rbp-88],r9
	mov r8,qword [rbp-88]
	cmp r8b,1
	jz ___print_last_cond..if_true_2
	jnz ___print_last_cond..if_false
___print_last_cond..if_true_2:
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-120]
	call ___myprint
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-224],r8
	jmp ___print_last_cond..if_after_2
___print_last_cond..if_false:
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-128]
	call ___myprint
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-176],r8
	jmp ___print_last_cond..if_after_2
___print_last_cond..if_after_2:
	jmp ___print_last_cond..print_last_cond.exit
___print_last_cond..for_loop:
	mov r8,qword [rbp-72]
	mov r9,r8
	mov qword [rbp-152],r9
	mov r8,qword [rbp-152]
	add r8,1
	mov qword [rbp-152],r8
	mov r8,qword [rbp-152]
	mov r9,r8
	mov qword [rbp-216],r9
	mov r8,qword [rbp-216]
	imul r8,8
	mov qword [rbp-216],r8
	mov r8,qword [rbp-160]
	mov r9,qword [rbp-216]
	add r9,r8
	mov qword [rbp-216],r9
	mov r8,qword [rbp-216]
	mov r8,qword [r8+8]
	mov qword [rbp-216],r8
	mov r8,qword [rbp-216]
	cmp r8,1
	mov r9,0
	sete r9b
	mov qword [rbp-136],r9
	mov r8,qword [rbp-136]
	cmp r8b,1
	jz ___print_last_cond..if_true_3
	jnz ___print_last_cond..if_after_3
___print_last_cond..if_true_3:
	mov r8,0
	mov qword [rbp-112],r8
	jmp ___print_last_cond..if_after_3
___print_last_cond..if_after_3:
	mov r8,qword [rbp-72]
	mov r9,r8
	mov qword [rbp-200],r9
	mov r8,qword [rbp-200]
	add r8,1
	mov qword [rbp-200],r8
	mov r8,qword [rbp-200]
	mov r9,r8
	mov qword [rbp-184],r9
	mov r8,qword [rbp-184]
	imul r8,8
	mov qword [rbp-184],r8
	mov r8,qword [rbp-160]
	mov r9,qword [rbp-184]
	add r9,r8
	mov qword [rbp-184],r9
	mov r8,qword [rbp-184]
	mov r8,qword [r8+8]
	mov qword [rbp-184],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov rdi,qword [rbp-184]
	call _Z8toStringi
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-32],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-32]
	call ___myprint
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-64],r8
	jmp ___print_last_cond..for_step
___print_last_cond..for_step:
	mov r8,qword [rbp-72]
	add r8,1
	mov qword [rbp-72],r8
	jmp ___print_last_cond..for_cond
___print_last_cond..if_after:
	mov r8,qword [rbp-40]
	mov r9,r8
	mov qword [rbp-232],r9
	mov r8,qword [rbp-232]
	add r8,1
	mov qword [rbp-232],r8
	mov r8,qword [rbp-232]
	mov r9,r8
	mov qword [rbp-8],r9
	mov r8,qword [rbp-8]
	imul r8,8
	mov qword [rbp-8],r8
	mov r8,qword [rbp-160]
	mov r9,qword [rbp-8]
	add r9,r8
	mov qword [rbp-8],r9
	mov r8,qword [rbp-8]
	mov qword [r8+8],1
	mov r8,qword [rbp-40]
	mov r9,r8
	mov qword [rbp-168],r9
	mov r8,qword [rbp-168]
	add r8,1
	mov qword [rbp-168],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-168]
	call ___print_last_cond
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-144],r8
	mov r8,___string_7
	mov qword [rbp-128],r8
	mov r8,qword [___n]
	mov qword [rbp-104],r8
	mov r8,qword [___assignment]
	mov qword [rbp-160],r8
	mov r8,___string_6
	mov qword [rbp-24],r8
	mov r8,___string_5
	mov qword [rbp-120],r8
	mov r8,qword [rbp-40]
	mov r9,r8
	mov qword [rbp-16],r9
	mov r8,qword [rbp-16]
	add r8,1
	mov qword [rbp-16],r8
	mov r8,qword [rbp-16]
	mov r9,r8
	mov qword [rbp-208],r9
	mov r8,qword [rbp-208]
	imul r8,8
	mov qword [rbp-208],r8
	mov r8,qword [rbp-160]
	mov r9,qword [rbp-208]
	add r9,r8
	mov qword [rbp-208],r9
	mov r8,qword [rbp-208]
	mov qword [r8+8],0
	mov r8,qword [rbp-40]
	mov r9,r8
	mov qword [rbp-192],r9
	mov r8,qword [rbp-192]
	add r8,1
	mov qword [rbp-192],r8
	mov qword [rbp-240],r8
	mov qword [rbp-248],r9
	mov qword [rbp-256],r10
	mov qword [rbp-264],rdi
	mov rdi,qword [rbp-192]
	call ___print_last_cond
	mov rdi,qword [rbp-264]
	mov r10,qword [rbp-256]
	mov r9,qword [rbp-248]
	mov r8,qword [rbp-240]
	mov r8,rax
	mov qword [rbp-56],r8
	mov r8,___string_7
	mov qword [rbp-128],r8
	mov r8,qword [___n]
	mov qword [rbp-104],r8
	mov r8,qword [___assignment]
	mov qword [rbp-160],r8
	mov r8,___string_6
	mov qword [rbp-24],r8
	mov r8,___string_5
	mov qword [rbp-120],r8
	jmp ___print_last_cond..print_last_cond.exit
___print_last_cond..print_last_cond.exit:
	leave
	ret

main:
main..main.entry:
	push rbp
	mov rbp,rsp
	sub rsp,336
	mov r8,qword [___m]
	mov qword [rbp-240],r8
	mov r8,qword [___cond_ass]
	mov qword [rbp-144],r8
	mov r8,qword [___last]
	mov qword [rbp-160],r8
	mov r8,qword [___sat]
	mov qword [rbp-40],r8
	mov r8,qword [___assignment]
	mov qword [rbp-136],r8
	mov r8,___string_8
	mov qword [rbp-192],r8
	mov r8,qword [___k]
	mov qword [rbp-120],r8
	mov r8,qword [___n]
	mov qword [rbp-72],r8
	mov r8,qword [___myHash]
	mov qword [rbp-264],r8
	mov r8,qword [rbp-240]
	mov qword [___m],r8
	mov r8,qword [rbp-144]
	mov qword [___cond_ass],r8
	mov r8,qword [rbp-160]
	mov qword [___last],r8
	mov r8,qword [rbp-40]
	mov qword [___sat],r8
	mov r8,qword [rbp-136]
	mov qword [___assignment],r8
	mov r8,qword [rbp-120]
	mov qword [___k],r8
	mov r8,qword [rbp-72]
	mov qword [___n],r8
	mov qword [rbp-272],r8
	call ____init
	mov r8,qword [rbp-272]
	mov r8,qword [___myHash]
	mov qword [rbp-264],r8
	mov r8,qword [___n]
	mov qword [rbp-72],r8
	mov r8,qword [___k]
	mov qword [rbp-120],r8
	mov r8,qword [___assignment]
	mov qword [rbp-136],r8
	mov r8,qword [___sat]
	mov qword [rbp-40],r8
	mov r8,qword [___last]
	mov qword [rbp-160],r8
	mov r8,qword [___cond_ass]
	mov qword [rbp-144],r8
	mov r8,qword [___m]
	mov qword [rbp-240],r8
	mov qword [rbp-272],r8
	mov qword [rbp-280],r9
	mov qword [rbp-288],r10
	call _Z6getIntv
	mov r10,qword [rbp-288]
	mov r9,qword [rbp-280]
	mov r8,qword [rbp-272]
	mov r8,rax
	mov qword [rbp-8],r8
	mov r8,qword [rbp-8]
	mov r9,r8
	mov qword [rbp-120],r9
	mov r8,qword [rbp-120]
	mov r9,r8
	mov qword [rbp-56],r9
	mov r8,qword [rbp-56]
	imul r8,2
	mov qword [rbp-56],r8
	mov r8,qword [rbp-56]
	mov r9,r8
	mov qword [rbp-256],r9
	mov r8,qword [rbp-256]
	add r8,1
	mov qword [rbp-256],r8
	mov r8,qword [rbp-256]
	mov r9,r8
	mov qword [rbp-72],r9
	mov r8,qword [rbp-120]
	mov r9,r8
	mov qword [rbp-240],r9
	mov r8,1
	mov qword [rbp-160],r8
	mov qword [rbp-272],r8
	mov qword [rbp-280],r9
	mov qword [rbp-288],r10
	mov qword [rbp-296],rdi
	mov rdi,qword [rbp-192]
	call ___myprint
	mov rdi,qword [rbp-296]
	mov r10,qword [rbp-288]
	mov r9,qword [rbp-280]
	mov r8,qword [rbp-272]
	mov r8,rax
	mov qword [rbp-176],r8
	mov r8,qword [___myHash]
	mov qword [rbp-264],r8
	mov r8,qword [rbp-240]
	mov r9,r8
	mov qword [rbp-104],r9
	mov r8,qword [rbp-104]
	imul r8,8
	mov qword [rbp-104],r8
	mov r8,qword [rbp-104]
	add r8,8
	mov qword [rbp-104],r8
	mov r8,qword [rbp-104]
	mov rdi,r8
	call malloc
	mov r8,rax
	mov qword [rbp-104],r8
	mov r8,qword [rbp-104]
	mov r9,qword [rbp-240]
	mov qword [r8],r9
	mov r8,qword [rbp-104]
	mov r9,r8
	mov qword [rbp-40],r9
	mov r8,0
	mov qword [rbp-184],r8
	mov r8,0
	mov qword [rbp-184],r8
	jmp main..for_cond
main..for_cond:
	mov r8,qword [rbp-184]
	mov r9,qword [rbp-240]
	cmp r8,r9
	mov r10,0
	setl r10b
	mov qword [rbp-96],r10
	mov r8,qword [rbp-96]
	cmp r8b,1
	jz main..for_loop
	jnz main..for_after
main..for_after:
	mov r8,qword [rbp-72]
	mov r9,r8
	mov qword [rbp-128],r9
	mov r8,qword [rbp-128]
	add r8,1
	mov qword [rbp-128],r8
	mov r8,qword [rbp-128]
	mov r9,r8
	mov qword [rbp-224],r9
	mov r8,qword [rbp-224]
	imul r8,8
	mov qword [rbp-224],r8
	mov r8,qword [rbp-224]
	add r8,8
	mov qword [rbp-224],r8
	mov r8,qword [rbp-224]
	mov rdi,r8
	call malloc
	mov r8,rax
	mov qword [rbp-224],r8
	mov r8,qword [rbp-224]
	mov r9,qword [rbp-128]
	mov qword [r8],r9
	mov r8,qword [rbp-224]
	mov r9,r8
	mov qword [rbp-136],r9
	mov r8,qword [rbp-72]
	mov r9,r8
	mov qword [rbp-200],r9
	mov r8,qword [rbp-200]
	add r8,1
	mov qword [rbp-200],r8
	mov r8,qword [rbp-200]
	mov r9,r8
	mov qword [rbp-80],r9
	mov r8,qword [rbp-80]
	imul r8,8
	mov qword [rbp-80],r8
	mov r8,qword [rbp-80]
	add r8,8
	mov qword [rbp-80],r8
	mov r8,qword [rbp-80]
	mov rdi,r8
	call malloc
	mov r8,rax
	mov qword [rbp-80],r8
	mov r8,qword [rbp-80]
	mov r9,qword [rbp-200]
	mov qword [r8],r9
	mov r8,qword [rbp-80]
	mov r9,r8
	mov qword [rbp-144],r9
	mov r8,qword [rbp-240]
	mov qword [___m],r8
	mov r8,qword [rbp-144]
	mov qword [___cond_ass],r8
	mov r8,qword [rbp-40]
	mov qword [___sat],r8
	mov r8,qword [rbp-136]
	mov qword [___assignment],r8
	mov r8,qword [rbp-72]
	mov qword [___n],r8
	mov qword [rbp-272],r8
	mov qword [rbp-280],r9
	mov qword [rbp-288],r10
	mov qword [rbp-296],rdi
	mov rdi,0
	call ___dfs
	mov rdi,qword [rbp-296]
	mov r10,qword [rbp-288]
	mov r9,qword [rbp-280]
	mov r8,qword [rbp-272]
	mov r8,rax
	mov qword [rbp-152],r8
	mov r8,qword [___myHash]
	mov qword [rbp-264],r8
	mov r8,qword [___n]
	mov qword [rbp-72],r8
	mov r8,qword [___assignment]
	mov qword [rbp-136],r8
	mov r8,qword [___sat]
	mov qword [rbp-40],r8
	mov r8,qword [___cond_ass]
	mov qword [rbp-144],r8
	mov r8,qword [___m]
	mov qword [rbp-240],r8
	mov r8,qword [rbp-136]
	mov qword [___assignment],r8
	mov r8,qword [rbp-72]
	mov qword [___n],r8
	mov qword [rbp-272],r8
	mov qword [rbp-280],r9
	mov qword [rbp-288],r10
	mov qword [rbp-296],rdi
	mov rdi,0
	call ___print_last_cond
	mov rdi,qword [rbp-296]
	mov r10,qword [rbp-288]
	mov r9,qword [rbp-280]
	mov r8,qword [rbp-272]
	mov r8,rax
	mov qword [rbp-216],r8
	mov r8,qword [___myHash]
	mov qword [rbp-264],r8
	mov r8,qword [___n]
	mov qword [rbp-72],r8
	mov r8,qword [___assignment]
	mov qword [rbp-136],r8
	mov qword [rbp-272],r8
	mov qword [rbp-280],r9
	mov qword [rbp-288],r10
	mov rdi,qword [rbp-264]
	call _Z10printlnInti
	mov r10,qword [rbp-288]
	mov r9,qword [rbp-280]
	mov r8,qword [rbp-272]
	mov r8,qword [rbp-240]
	mov qword [___m],r8
	mov r8,qword [rbp-144]
	mov qword [___cond_ass],r8
	mov r8,qword [rbp-160]
	mov qword [___last],r8
	mov r8,qword [rbp-40]
	mov qword [___sat],r8
	mov r8,qword [rbp-136]
	mov qword [___assignment],r8
	mov r8,qword [rbp-120]
	mov qword [___k],r8
	mov r8,qword [rbp-72]
	mov qword [___n],r8
	mov rax,0
	leave
	ret
main..for_loop:
	mov r8,32
	mov qword [rbp-64],r8
	mov r8,qword [rbp-64]
	mov rdi,r8
	call malloc
	mov r8,rax
	mov qword [rbp-64],r8
	mov r8,qword [rbp-64]
	mov qword [r8],3
	mov r8,qword [rbp-64]
	mov r9,r8
	mov qword [rbp-32],r9
	mov r8,qword [rbp-32]
	mov r9,r8
	mov qword [rbp-208],r9
	mov r8,qword [rbp-208]
	add r8,0
	mov qword [rbp-208],r8
	mov r8,qword [rbp-208]
	mov r9,qword [rbp-160]
	mov qword [r8+8],r9
	mov r8,qword [rbp-160]
	mov r9,r8
	mov qword [rbp-16],r9
	mov r8,qword [rbp-16]
	add r8,1
	mov qword [rbp-16],r8
	mov r8,qword [rbp-32]
	mov r9,r8
	mov qword [rbp-112],r9
	mov r8,qword [rbp-112]
	add r8,8
	mov qword [rbp-112],r8
	mov r8,qword [rbp-112]
	mov r9,qword [rbp-16]
	mov qword [r8+8],r9
	mov r8,qword [rbp-160]
	mov r9,r8
	mov qword [rbp-248],r9
	mov r8,qword [rbp-248]
	add r8,2
	mov qword [rbp-248],r8
	mov r8,qword [rbp-248]
	mov r9,r8
	mov qword [rbp-168],r9
	mov r8,qword [rbp-168]
	neg r8
	mov qword [rbp-168],r8
	mov r8,qword [rbp-168]
	mov r9,r8
	mov qword [rbp-24],r9
	mov r8,qword [rbp-32]
	mov r9,r8
	mov qword [rbp-88],r9
	mov r8,qword [rbp-88]
	add r8,16
	mov qword [rbp-88],r8
	mov r8,qword [rbp-88]
	mov r9,qword [rbp-24]
	mov qword [r8+8],r9
	mov r8,qword [rbp-160]
	mov r9,r8
	mov qword [rbp-232],r9
	mov r8,qword [rbp-232]
	add r8,2
	mov qword [rbp-232],r8
	mov r8,qword [rbp-232]
	mov r9,r8
	mov qword [rbp-160],r9
	mov r8,qword [rbp-184]
	mov r9,r8
	mov qword [rbp-48],r9
	mov r8,qword [rbp-48]
	imul r8,8
	mov qword [rbp-48],r8
	mov r8,qword [rbp-40]
	mov r9,qword [rbp-48]
	add r9,r8
	mov qword [rbp-48],r9
	mov r8,qword [rbp-48]
	mov r9,qword [rbp-32]
	mov qword [r8+8],r9
	jmp main..for_step
main..for_step:
	mov r8,qword [rbp-184]
	add r8,1
	mov qword [rbp-184],r8
	jmp main..for_cond

____init:
____init.._init.entry:
	push rbp
	mov rbp,rsp
	sub rsp,128
	mov r8,qword [___cond_ass]
	mov qword [rbp-40],r8
	mov r8,qword [___m]
	mov qword [rbp-32],r8
	mov r8,qword [___sat]
	mov qword [rbp-48],r8
	mov r8,qword [___last]
	mov qword [rbp-16],r8
	mov r8,qword [___assignment]
	mov qword [rbp-8],r8
	mov r8,qword [___k]
	mov qword [rbp-24],r8
	mov r8,qword [___n]
	mov qword [rbp-56],r8
	mov r8,qword [___myHash]
	mov qword [rbp-64],r8
	mov r8,0
	mov qword [rbp-48],r8
	mov r8,0
	mov qword [rbp-8],r8
	mov r8,0
	mov qword [rbp-40],r8
	mov r8,0
	mov qword [rbp-24],r8
	mov r8,0
	mov qword [rbp-56],r8
	mov r8,0
	mov qword [rbp-32],r8
	mov r8,0
	mov qword [rbp-16],r8
	mov r8,0
	mov qword [rbp-64],r8
	mov r8,qword [rbp-40]
	mov qword [___cond_ass],r8
	mov r8,qword [rbp-32]
	mov qword [___m],r8
	mov r8,qword [rbp-48]
	mov qword [___sat],r8
	mov r8,qword [rbp-16]
	mov qword [___last],r8
	mov r8,qword [rbp-8]
	mov qword [___assignment],r8
	mov r8,qword [rbp-24]
	mov qword [___k],r8
	mov r8,qword [rbp-56]
	mov qword [___n],r8
	mov r8,qword [rbp-64]
	mov qword [___myHash],r8
	leave
	ret

	section .data
___string_2:
	db 2,0,0,0,0,0,0,0,45,32,0
___string:
	db 2,0,0,0,0,0,0,0,42,120,0
___string_3:
	db 3,0,0,0,0,0,0,0,120,122,32,0
___string_4:
	db 7,0,0,0,0,0,0,0,32,60,61,32,48,59,10,0
___string_6:
	db 1,0,0,0,0,0,0,0,120,0
___string_5:
	db 3,0,0,0,0,0,0,0,32,43,32,0
___string_7:
	db 6,0,0,0,0,0,0,0,32,61,32,49,59,10,0
___string_8:
	db 9,0,0,0,0,0,0,0,109,97,120,58,32,120,122,59,10,0

section .bss
___sat:
	resb 64
___assignment:
	resb 64
___cond_ass:
	resb 64
___k:
	resb 64
___n:
	resb 64
___m:
	resb 64
___last:
	resb 64
___myHash:
	resb 64






default rel

global _Z15stringSubStringPcii
global _Z14stringParseIntPc
global _Z12stringConcatPcS_
global _Z9stringEquPcS_
global _Z10stringLessPcS_
global _Z9stringLeqPcS_
global _Z9stringOrdPci
global _Z5printPc
global _Z7printlnPc
global _Z8printInti
global _Z10printlnInti
global _Z9getStringv
global _Z6getIntv
global _Z8toStringi

extern _IO_getc
extern stdin
extern scanf
extern __stack_chk_fail
extern _IO_putc
extern stdout
extern puts
extern __printf_chk
extern strcmp
extern memcpy
extern malloc


SECTION .text

_Z15stringSubStringPcii:
        push    r15
        push    r14
        push    r13
        movsxd  r13, esi
        push    r12
        push    rbp
        push    rbx
        mov     ebx, edx
        sub     ebx, r13d
        mov     r12, rdi
        lea     edi, [rbx+0AH]
        lea     r15d, [rbx+1H]
        sub     rsp, 8
        movsxd  rdi, edi
        movsxd  r14, r15d
        call    malloc
        test    r15d, r15d
        mov     rbp, rax
        mov     qword [rax], r14
        jle     L_001
        mov     edx, ebx
        lea     rdi, [rax+8H]
        lea     rsi, [r12+r13+8H]
        add     rdx, 1
        call    memcpy
L_001:  mov     byte [rbp+r14+8H], 0
        add     rsp, 8
        mov     rax, rbp
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret







ALIGN   16

_Z14stringParseIntPc:
        xor     edx, edx
        cmp     byte [rdi+8H], 45
        sete    dl
        setne   r8b
        sete    al
        movsx   edx, byte [rdi+rdx+8H]
        movzx   r8d, r8b
        movzx   eax, al
        lea     r8d, [r8+r8-1H]
        lea     ecx, [rdx-30H]
        cmp     cl, 9
        ja      L_003
        lea     rcx, [rdi+rax+9H]
        xor     eax, eax
L_002:  lea     esi, [rax+rax*4]
        add     rcx, 1
        lea     eax, [rdx+rsi*2-30H]
        movsx   edx, byte [rcx-1H]
        lea     esi, [rdx-30H]
        cmp     sil, 9
        jbe     L_002
        imul    eax, r8d
        ret

L_003:  xor     eax, eax
        ret


_Z12stringConcatPcS_:
        push    r15
        push    r14
        push    r13
        push    r12
        mov     r13, rsi
        push    rbp
        push    rbx
        sub     rsp, 24
        mov     rbx, qword [rdi]
        mov     rbp, qword [rsi]
        mov     qword [rsp+8H], rdi
        lea     r15d, [rbp+rbx]
        lea     edi, [r15+9H]
        movsxd  r15, r15d
        movsxd  rdi, edi
        call    malloc
        test    ebx, ebx
        mov     r12, rax
        mov     qword [rax], r15
        mov     rcx, qword [rsp+8H]
        jle     L_006
        lea     edx, [rbx-1H]
        lea     rdi, [rax+8H]
        lea     rsi, [rcx+8H]
        mov     r14d, ebx
        movsxd  rbx, ebx
        add     rdx, 1
        call    memcpy
L_004:  test    ebp, ebp
        jle     L_005
        movsxd  rax, r14d
        lea     edx, [rbp-1H]
        lea     ebx, [r14+rbp]
        lea     rdi, [r12+rax+8H]
        lea     rsi, [r13+8H]
        add     rdx, 1
        movsxd  rbx, ebx
        call    memcpy
L_005:  mov     byte [r12+rbx+8H], 0
        add     rsp, 24
        mov     rax, r12
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret





ALIGN   8
L_006:  xor     ebx, ebx
        xor     r14d, r14d
        jmp     L_004


        nop

ALIGN   16
_Z9stringEquPcS_:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        test    eax, eax
        sete    al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

_Z10stringLessPcS_:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        add     rsp, 8
        shr     eax, 31
        ret






ALIGN   8

_Z9stringLeqPcS_:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        test    eax, eax
        setle   al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

_Z9stringOrdPci:
        movsxd  rsi, esi
        movsx   eax, byte [rdi+rsi+8H]
        ret






ALIGN   8

_Z5printPc:
        lea     rdx, [rdi+8H]
        mov     esi, L_061
        mov     edi, 1
        xor     eax, eax
        jmp     __printf_chk


        nop





ALIGN   16

_Z7printlnPc:
        add     rdi, 8
        jmp     puts






ALIGN   8

_Z8printInti:
        push    rbx
        sub     rsp, 48


        mov     rax, qword [fs:abs 28H]
        mov     qword [rsp+28H], rax
        xor     eax, eax
        test    edi, edi
        je      L_010
        mov     ebx, edi
        js      L_011
L_007:  mov     eax, ebx
        mov     esi, 1717986919
        mov     ecx, ebx
        imul    esi
        sar     ecx, 31
        sar     edx, 2
        sub     edx, ecx
        lea     eax, [rdx+rdx*4]
        mov     edi, edx
        mov     edx, ebx
        add     eax, eax
        sub     edx, eax
        test    edi, edi
        mov     dword [rsp], edx
        je      L_018
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+4H], edi
        mov     edi, 1374389535
        imul    edi
        sar     edx, 5
        mov     edi, edx
        sub     edi, ecx
        je      L_016
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+8H], edi
        mov     edi, 274877907
        imul    edi
        sar     edx, 6
        mov     edi, edx
        sub     edi, ecx
        je      L_017
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+0CH], edi
        mov     edi, 1759218605
        imul    edi
        sar     edx, 12
        mov     edi, edx
        sub     edi, ecx
        je      L_012
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+10H], edi
        mov     edi, 351843721
        imul    edi
        sar     edx, 13
        mov     edi, edx
        sub     edi, ecx
        je      L_013
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+14H], edi
        mov     edi, 1125899907
        imul    edi
        sar     edx, 18
        mov     edi, edx
        sub     edi, ecx
        je      L_014
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+18H], edi
        mov     edi, 1801439851
        imul    edi
        sar     edx, 22
        mov     edi, edx
        sub     edi, ecx
        je      L_015
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+1CH], edi
        mov     edi, 1441151881
        imul    edi
        sar     edx, 25
        mov     edi, edx
        sub     edi, ecx
        je      L_019
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        mov     esi, edx
        mov     edx, 1152921505
        sar     esi, 2
        sub     esi, eax
        lea     eax, [rsi+rsi*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        imul    edx
        mov     dword [rsp+20H], edi
        sar     edx, 28
        sub     edx, ecx
        je      L_020
        mov     dword [rsp+24H], edx
        mov     ebx, 10
L_008:  sub     ebx, 1




ALIGN   8
L_009:  movsxd  rax, ebx
        mov     rsi, qword [rel stdout]
        sub     ebx, 1
        mov     edi, dword [rsp+rax*4]
        add     edi, 48
        call    _IO_putc
        cmp     ebx, -1
        jnz     L_009
        mov     rax, qword [rsp+28H]


        xor     rax, qword [fs:abs 28H]
        jne     L_021
        add     rsp, 48
        pop     rbx
        ret





ALIGN   8
L_010:  mov     rax, qword [rsp+28H]


        xor     rax, qword [fs:abs 28H]
        jne     L_021
        mov     rsi, qword [rel stdout]
        add     rsp, 48
        mov     edi, 48
        pop     rbx
        jmp     _IO_putc





ALIGN   8
L_011:  mov     rsi, qword [rel stdout]
        mov     edi, 45
        neg     ebx
        call    _IO_putc
        jmp     L_007

L_012:  mov     ebx, 4
        jmp     L_008

L_013:  mov     ebx, 5
        jmp     L_008

L_014:  mov     ebx, 6
        jmp     L_008

L_015:  mov     ebx, 7
        jmp     L_008

L_016:  mov     ebx, 2
        jmp     L_008

L_017:  mov     ebx, 3
        jmp     L_008

L_018:  mov     ebx, 1
        jmp     L_008

L_019:  mov     ebx, 8
        jmp     L_008

L_020:  mov     ebx, 9
        jmp     L_008

L_021:  call    __stack_chk_fail





ALIGN   16

_Z10printlnInti:
        push    rbx
        sub     rsp, 48


        mov     rax, qword [fs:abs 28H]
        mov     qword [rsp+28H], rax
        xor     eax, eax
        test    edi, edi
        je      L_026
        mov     ebx, edi
        js      L_027
L_022:  mov     eax, ebx
        mov     esi, 1717986919
        mov     ecx, ebx
        imul    esi
        sar     ecx, 31
        sar     edx, 2
        sub     edx, ecx
        lea     eax, [rdx+rdx*4]
        mov     edi, edx
        mov     edx, ebx
        add     eax, eax
        sub     edx, eax
        test    edi, edi
        mov     dword [rsp], edx
        je      L_034
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+4H], edi
        mov     edi, 1374389535
        imul    edi
        sar     edx, 5
        mov     edi, edx
        sub     edi, ecx
        je      L_032
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+8H], edi
        mov     edi, 274877907
        imul    edi
        sar     edx, 6
        mov     edi, edx
        sub     edi, ecx
        je      L_033
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+0CH], edi
        mov     edi, 1759218605
        imul    edi
        sar     edx, 12
        mov     edi, edx
        sub     edi, ecx
        je      L_028
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+10H], edi
        mov     edi, 351843721
        imul    edi
        sar     edx, 13
        mov     edi, edx
        sub     edi, ecx
        je      L_029
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+14H], edi
        mov     edi, 1125899907
        imul    edi
        sar     edx, 18
        mov     edi, edx
        sub     edi, ecx
        je      L_030
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+18H], edi
        mov     edi, 1801439851
        imul    edi
        sar     edx, 22
        mov     edi, edx
        sub     edi, ecx
        je      L_031
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        mov     dword [rsp+1CH], edi
        mov     edi, 1441151881
        imul    edi
        sar     edx, 25
        mov     edi, edx
        sub     edi, ecx
        je      L_035
        mov     eax, edi
        imul    esi
        mov     eax, edi
        sar     eax, 31
        mov     esi, edx
        mov     edx, 1152921505
        sar     esi, 2
        sub     esi, eax
        lea     eax, [rsi+rsi*4]
        add     eax, eax
        sub     edi, eax
        mov     eax, ebx
        imul    edx
        mov     dword [rsp+20H], edi
        sar     edx, 28
        sub     edx, ecx
        je      L_036
        mov     dword [rsp+24H], edx
        mov     ebx, 10
L_023:  sub     ebx, 1




ALIGN   8
L_024:  movsxd  rax, ebx
        mov     rsi, qword [rel stdout]
        sub     ebx, 1
        mov     edi, dword [rsp+rax*4]
        add     edi, 48
        call    _IO_putc
        cmp     ebx, -1
        jnz     L_024
L_025:  mov     rax, qword [rsp+28H]


        xor     rax, qword [fs:abs 28H]
        jne     L_037
        mov     rsi, qword [rel stdout]
        add     rsp, 48
        mov     edi, 10
        pop     rbx
        jmp     _IO_putc





ALIGN   8
L_026:  mov     rsi, qword [rel stdout]
        mov     edi, 48
        call    _IO_putc
        jmp     L_025





ALIGN   8
L_027:  mov     rsi, qword [rel stdout]
        mov     edi, 45
        neg     ebx
        call    _IO_putc
        jmp     L_022

L_028:  mov     ebx, 4
        jmp     L_023

L_029:  mov     ebx, 5
        jmp     L_023

L_030:  mov     ebx, 6
        jmp     L_023

L_031:  mov     ebx, 7
        jmp     L_023

L_032:  mov     ebx, 2
        jmp     L_023

L_033:  mov     ebx, 3
        jmp     L_023

L_034:  mov     ebx, 1
        jmp     L_023

L_035:  mov     ebx, 8
        jmp     L_023

L_036:  mov     ebx, 9
        jmp     L_023

L_037:  call    __stack_chk_fail
        nop
ALIGN   16

_Z9getStringv:
        push    rbp
        push    rbx
        mov     edi, 300
        sub     rsp, 8
        call    malloc
        lea     rbx, [rax+8H]
        mov     rbp, rax
        mov     edi, L_061
        xor     eax, eax
        mov     rsi, rbx
        call    scanf
        mov     rdx, rbx
L_038:  mov     ecx, dword [rdx]
        add     rdx, 4
        lea     eax, [rcx-1010101H]
        not     ecx
        and     eax, ecx
        and     eax, 80808080H
        jz      L_038
        mov     ecx, eax
        shr     ecx, 16
        test    eax, 8080H
        cmove   eax, ecx
        lea     rcx, [rdx+2H]
        mov     esi, eax
        cmove   rdx, rcx
        add     sil, al
        mov     rax, rbp
        sbb     rdx, 3
        sub     rdx, rbx
        mov     qword [rbp], rdx
        add     rsp, 8
        pop     rbx
        pop     rbp
        ret


        nop

ALIGN   16
_Z6getIntv:
        push    rbp
        push    rbx
        sub     rsp, 8
        jmp     L_040





ALIGN   16
L_039:  cmp     al, 45
        jz      L_041
L_040:  mov     rdi, qword [rel stdin]
        call    _IO_getc
        lea     ecx, [rax-30H]
        movsx   edx, al
        cmp     cl, 9
        ja      L_039
L_041:  cmp     dl, 45
        mov     ebp, 1
        jz      L_044
L_042:  xor     ebx, ebx





ALIGN   16
L_043:  mov     rdi, qword [rel stdin]
        lea     eax, [rbx+rbx*4]
        lea     ebx, [rdx+rax*2-30H]
        call    _IO_getc
        movsx   edx, al
        sub     eax, 48
        cmp     al, 9
        jbe     L_043
        mov     eax, ebx
        add     rsp, 8
        imul    eax, ebp
        pop     rbx
        pop     rbp
        ret





ALIGN   8
L_044:  mov     rdi, qword [rel stdin]
        mov     ebp, 4294967295
        call    _IO_getc
        movsx   edx, al
        jmp     L_042







ALIGN   16

_Z8toStringi:
        push    r12
        push    rbp
        push    rbx
        sub     rsp, 64


        mov     rax, qword [fs:abs 28H]
        mov     qword [rsp+38H], rax
        xor     eax, eax
        test    edi, edi
        js      L_047
        jne     L_050
        mov     edi, 10
        mov     dword [rsp+4H], 0
        xor     ebp, ebp
        call    malloc
        lea     rdx, [rax+8H]
        mov     qword [rax], 1
        mov     byte [rax+9H], 0
        mov     ebx, 1
L_045:  movsxd  rcx, ebx
        movsxd  rsi, ebp
        mov     ecx, dword [rsp+rcx*4]
        add     ecx, 48
        cmp     ebx, 1
        mov     byte [rdx+rsi], cl
        je      L_046
        lea     esi, [rbx-1H]
        lea     ecx, [rbp+1H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 2
        mov     byte [rdx+rcx], sil
        je      L_046
        lea     esi, [rbx-2H]
        lea     ecx, [rbp+2H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 3
        mov     byte [rdx+rcx], sil
        je      L_046
        lea     esi, [rbx-3H]
        lea     ecx, [rbp+3H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 4
        mov     byte [rdx+rcx], sil
        je      L_046
        lea     esi, [rbx-4H]
        lea     ecx, [rbp+4H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 5
        mov     byte [rdx+rcx], sil
        je      L_046
        lea     esi, [rbx-5H]
        lea     ecx, [rbp+5H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 6
        mov     byte [rdx+rcx], sil
        jz      L_046
        lea     esi, [rbx-6H]
        lea     ecx, [rbp+6H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 7
        mov     byte [rdx+rcx], sil
        jz      L_046
        lea     esi, [rbx-7H]
        lea     ecx, [rbp+7H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 8
        mov     byte [rdx+rcx], sil
        jz      L_046
        lea     esi, [rbx-8H]
        lea     ecx, [rbp+8H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 9
        mov     byte [rdx+rcx], sil
        jz      L_046
        lea     esi, [rbx-9H]
        lea     ecx, [rbp+9H]
        movsxd  rsi, esi
        movsxd  rcx, ecx
        mov     esi, dword [rsp+rsi*4]
        add     esi, 48
        cmp     ebx, 10
        mov     byte [rdx+rcx], sil
        jz      L_046
        movzx   edi, byte [rsp+4H]
        add     ebp, 10
        movsxd  rbp, ebp
        lea     ecx, [rdi+30H]
        mov     byte [rdx+rbp], cl
L_046:  mov     rdi, qword [rsp+38H]


        xor     rdi, qword [fs:abs 28H]
        jne     L_060
        add     rsp, 64
        pop     rbx
        pop     rbp
        pop     r12
        ret






ALIGN   16
L_047:  neg     edi
        mov     ebp, 1
L_048:  mov     eax, edi
        mov     esi, 1717986919
        mov     ecx, edi
        imul    esi
        sar     ecx, 31
        mov     ebx, edi
        sar     edx, 2
        sub     edx, ecx
        lea     eax, [rdx+rdx*4]
        mov     r8d, edx
        add     eax, eax
        sub     ebx, eax
        test    edx, edx
        mov     dword [rsp+4H], ebx
        je      L_051
        mov     eax, edx
        imul    esi
        mov     eax, r8d
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     r8d, eax
        mov     eax, edi
        mov     dword [rsp+8H], r8d
        mov     r8d, 1374389535
        imul    r8d
        sar     edx, 5
        mov     r8d, edx
        sub     r8d, ecx
        je      L_052
        mov     eax, r8d
        imul    esi
        mov     eax, r8d
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     r8d, eax
        mov     eax, edi
        mov     dword [rsp+0CH], r8d
        mov     r8d, 274877907
        imul    r8d
        sar     edx, 6
        mov     r8d, edx
        sub     r8d, ecx
        je      L_053
        mov     eax, r8d
        imul    esi
        mov     eax, r8d
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     r8d, eax
        mov     eax, edi
        mov     dword [rsp+10H], r8d
        mov     r8d, 1759218605
        imul    r8d
        sar     edx, 12
        mov     r8d, edx
        sub     r8d, ecx
        je      L_054
        mov     eax, r8d
        imul    esi
        mov     eax, r8d
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     r8d, eax
        mov     eax, edi
        mov     dword [rsp+14H], r8d
        mov     r8d, 351843721
        imul    r8d
        sar     edx, 13
        mov     r8d, edx
        sub     r8d, ecx
        je      L_055
        mov     eax, r8d
        imul    esi
        mov     eax, r8d
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     r8d, eax
        mov     eax, edi
        mov     dword [rsp+18H], r8d
        mov     r8d, 1125899907
        imul    r8d
        sar     edx, 18
        mov     r8d, edx
        sub     r8d, ecx
        je      L_056
        mov     eax, r8d
        imul    esi
        mov     eax, r8d
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     r8d, eax
        mov     eax, edi
        mov     dword [rsp+1CH], r8d
        mov     r8d, 1801439851
        imul    r8d
        sar     edx, 22
        mov     r8d, edx
        sub     r8d, ecx
        je      L_057
        mov     eax, r8d
        imul    esi
        mov     eax, r8d
        sar     eax, 31
        sar     edx, 2
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     r8d, eax
        mov     eax, edi
        mov     dword [rsp+20H], r8d
        mov     r8d, 1441151881
        imul    r8d
        sar     edx, 25
        mov     r8d, edx
        sub     r8d, ecx
        je      L_058
        mov     eax, r8d
        imul    esi
        mov     eax, r8d
        sar     eax, 31
        sar     edx, 2
        mov     esi, edx
        mov     edx, 1152921505
        sub     esi, eax
        lea     eax, [rsi+rsi*4]
        add     eax, eax
        sub     r8d, eax
        mov     eax, edi
        imul    edx
        mov     dword [rsp+24H], r8d
        sar     edx, 28
        sub     edx, ecx
        je      L_059
        mov     dword [rsp+28H], edx
        mov     ebx, 10
L_049:  lea     r12d, [rbp+rbx]
        lea     edi, [r12+9H]
        movsxd  r12, r12d
        movsxd  rdi, edi
        call    malloc
        test    ebp, ebp
        mov     qword [rax], r12
        lea     rdx, [rax+8H]
        mov     byte [rax+r12+8H], 0
        je      L_045
        mov     byte [rax+8H], 45
        mov     ebp, 1
        jmp     L_045






ALIGN   16
L_050:  xor     ebp, ebp
        jmp     L_048






ALIGN   16
L_051:  mov     ebx, 1
        jmp     L_049






ALIGN   16
L_052:  mov     ebx, 2
        jmp     L_049






ALIGN   16
L_053:  mov     ebx, 3
        jmp     L_049






ALIGN   16
L_054:  mov     ebx, 4
        jmp     L_049





ALIGN   8
L_055:  mov     ebx, 5
        jmp     L_049





ALIGN   8
L_056:  mov     ebx, 6
        jmp     L_049





ALIGN   8
L_057:  mov     ebx, 7
        jmp     L_049





ALIGN   8
L_058:  mov     ebx, 8
        jmp     L_049





ALIGN   8
L_059:  mov     ebx, 9
        jmp     L_049

L_060:

        call    __stack_chk_fail



SECTION .data   


SECTION .bss    


SECTION .text.unlikely 


SECTION .rodata.str1.1 

L_061:
        db 25H, 73H, 00H



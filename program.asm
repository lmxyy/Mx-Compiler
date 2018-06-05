global main

extern malloc
section .text

___random:
___random..random.entry:
	push rbp
	mov rbp,rsp
	sub rsp,64
	mov r9,qword [___M]
	mov r15,qword [___Q]
	mov r14,qword [___A]
	mov rcx,qword [___seed]
	mov r13,qword [___R]
	mov rax,rcx
	mov r11,rdx
	cqo
	idiv r15
	mov rdi,rdx
	mov rdx,r11
	mov rdx,r14
	imul rdx,rdi
	mov rax,rcx
	mov r11,rdx
	cqo
	idiv r15
	mov rdx,r11
	mov rbx,rax
	mov r14,r13
	imul r14,rbx
	mov r13,rdx
	sub r13,r14
	cmp r13,0
	mov rbx,0
	setge bl
	cmp bl,1
	jz ___random..if_true
	jnz ___random..if_false
___random..if_false:
	mov rcx,r13
	add rcx,r9
	jmp ___random..if_after
___random..if_true:
	mov rcx,r13
	jmp ___random..if_after
___random..if_after:
	mov qword [___seed],rcx
	mov rax,rcx
	leave
	ret

___initialize:
___initialize..initialize.entry:
	push rbp
	mov rbp,rsp
	sub rsp,16
	mov r13,qword [___seed]
	mov r13,rdi
	mov qword [___seed],r13
	leave
	ret

___swap:
___swap..swap.entry:
	push rbp
	mov rbp,rsp
	sub rsp,48
	mov r9,qword [___a]
	mov r13,rdi
	imul r13,8
	add r13,r9
	mov r13,qword [r13+8]
	mov r14,rsi
	imul r14,8
	add r14,r9
	mov r14,qword [r14+8]
	mov rbx,rdi
	imul rbx,8
	add rbx,r9
	mov qword [rbx+8],r14
	mov rbx,rsi
	imul rbx,8
	add rbx,r9
	mov qword [rbx+8],r13
	leave
	ret

___pd:
___pd..pd.entry:
	push rbp
	mov rbp,rsp
	sub rsp,48
	mov r13,qword [___h]
	jmp ___pd..for_cond
___pd..for_cond:
	cmp r13,rdi
	mov rbx,0
	setle bl
	cmp bl,1
	jz ___pd..for_loop
	jnz ___pd..for_after
___pd..for_loop:
	mov rbx,r13
	add rbx,1
	mov r14,r13
	imul r14,rbx
	mov rax,r14
	cqo
	mov r10,2
	idiv r10
	mov r9,rax
	cmp rdi,r9
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___pd..if_true
	jnz ___pd..if_after
___pd..if_true:
	mov rbx,1
	jmp ___pd..pd.exit
___pd..if_after:
	jmp ___pd..for_step
___pd..for_step:
	add r13,1
	jmp ___pd..for_cond
___pd..for_after:
	mov rbx,0
	jmp ___pd..pd.exit
___pd..pd.exit:
	mov qword [___h],r13
	mov rax,rbx
	leave
	ret

___show:
___show..show.entry:
	push rbp
	mov rbp,rsp
	sub rsp,64
	mov r15,qword [___a]
	mov rdx,qword [___now]
	mov rbx,___string
	mov r14,___string_2
	mov r9,0
	mov r9,0
	jmp ___show..for_cond
___show..for_cond:
	cmp r9,rdx
	mov r13,0
	setl r13b
	cmp r13b,1
	jz ___show..for_loop
	jnz ___show..for_after
___show..for_loop:
	mov r13,r9
	imul r13,8
	add r13,r15
	mov r13,qword [r13+8]
	mov qword [rsp+16],r9
	mov qword [rsp+32],rdx
	mov qword [rsp+48],rdi
	mov qword [rsp+56],rsi
	mov rdi,r13
	call _Z8printInti
	mov rsi,qword [rsp+56]
	mov rdi,qword [rsp+48]
	mov rdx,qword [rsp+32]
	mov r9,qword [rsp+16]
	mov qword [rsp+16],r9
	mov qword [rsp+32],rdx
	mov qword [rsp+48],rdi
	mov qword [rsp+56],rsi
	mov rdi,rbx
	call _Z5printPc
	mov rsi,qword [rsp+56]
	mov rdi,qword [rsp+48]
	mov rdx,qword [rsp+32]
	mov r9,qword [rsp+16]
	jmp ___show..for_step
___show..for_step:
	add r9,1
	jmp ___show..for_cond
___show..for_after:
	mov qword [rsp+16],r9
	mov qword [rsp+32],rdx
	mov qword [rsp+48],rdi
	mov qword [rsp+56],rsi
	mov rdi,r14
	call _Z7printlnPc
	mov rsi,qword [rsp+56]
	mov rdi,qword [rsp+48]
	mov rdx,qword [rsp+32]
	mov r9,qword [rsp+16]
	leave
	ret

___win:
___win..win.entry:
	push rbp
	mov rbp,rsp
	sub rsp,80
	mov r13,qword [___a]
	mov r14,qword [___now]
	mov rcx,qword [___h]
	mov rdx,0
	mov r15,0
	mov r9,816
	mov qword [rsp+16],r9
	mov qword [rsp+32],rdx
	mov qword [rsp+48],rdi
	mov qword [rsp+56],rcx
	mov qword [rsp+64],rsi
	mov rdi,r9
	call malloc
	mov rsi,qword [rsp+64]
	mov rcx,qword [rsp+56]
	mov rdi,qword [rsp+48]
	mov rdx,qword [rsp+32]
	mov r9,qword [rsp+16]
	mov r9,rax
	mov qword [r9],101
	mov rbx,0
	cmp r14,rcx
	mov rbx,0
	setne bl
	cmp bl,1
	jz ___win..if_true
	jnz ___win..if_after
___win..if_true:
	mov r13,0
	jmp ___win..win.exit
___win..if_after:
	mov r15,0
	jmp ___win..for_cond
___win..for_cond:
	cmp r15,r14
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___win..for_loop
	jnz ___win..for_after
___win..for_loop:
	mov rdx,r15
	imul rdx,8
	add rdx,r13
	mov rdx,qword [rdx+8]
	mov rbx,r15
	imul rbx,8
	add rbx,r9
	mov qword [rbx+8],rdx
	jmp ___win..for_step
___win..for_step:
	add r15,1
	jmp ___win..for_cond
___win..for_after:
	mov rdx,0
	jmp ___win..for_cond_2
___win..for_cond_2:
	mov r13,r14
	sub r13,1
	cmp rdx,r13
	mov r13,0
	setl r13b
	cmp r13b,1
	jz ___win..for_loop_2
	jnz ___win..for_after_2
___win..for_after_2:
	mov rdx,0
	jmp ___win..for_cond_3
___win..for_cond_3:
	cmp rdx,r14
	mov r13,0
	setl r13b
	cmp r13b,1
	jz ___win..for_loop_3
	jnz ___win..for_after_3
___win..for_after_3:
	mov r13,1
	jmp ___win..win.exit
___win..for_loop_3:
	mov r13,rdx
	imul r13,8
	add r13,r9
	mov r13,qword [r13+8]
	mov rbx,rdx
	add rbx,1
	cmp r13,rbx
	mov r13,0
	setne r13b
	cmp r13b,1
	jz ___win..if_true_2
	jnz ___win..if_after_2
___win..if_after_2:
	jmp ___win..for_step_2
___win..for_step_2:
	add rdx,1
	jmp ___win..for_cond_3
___win..if_true_2:
	mov r13,0
	jmp ___win..win.exit
___win..win.exit:
	mov rax,r13
	leave
	ret
___win..for_loop_2:
	mov r13,rdx
	add r13,1
	mov r15,r13
	jmp ___win..for_cond_4
___win..for_cond_4:
	cmp r15,r14
	mov r13,0
	setl r13b
	cmp r13b,1
	jz ___win..for_loop_4
	jnz ___win..for_after_4
___win..for_loop_4:
	mov rbx,rdx
	imul rbx,8
	add rbx,r9
	mov rbx,qword [rbx+8]
	mov r13,r15
	imul r13,8
	add r13,r9
	mov r13,qword [r13+8]
	cmp rbx,r13
	mov r13,0
	setg r13b
	cmp r13b,1
	jz ___win..if_true_3
	jnz ___win..if_after_3
___win..if_true_3:
	mov rbx,rdx
	imul rbx,8
	add rbx,r9
	mov rbx,qword [rbx+8]
	mov rcx,r15
	imul rcx,8
	add rcx,r9
	mov rcx,qword [rcx+8]
	mov r13,rdx
	imul r13,8
	add r13,r9
	mov qword [r13+8],rcx
	mov r13,r15
	imul r13,8
	add r13,r9
	mov qword [r13+8],rbx
	jmp ___win..if_after_3
___win..if_after_3:
	jmp ___win..for_step_3
___win..for_step_3:
	add r15,1
	jmp ___win..for_cond_4
___win..for_after_4:
	jmp ___win..for_step_4
___win..for_step_4:
	add rdx,1
	jmp ___win..for_cond_2

___merge:
___merge..merge.entry:
	push rbp
	mov rbp,rsp
	sub rsp,64
	mov r13,qword [___a]
	mov r14,qword [___now]
	mov r9,0
	mov r9,0
	jmp ___merge..for_cond
___merge..for_cond:
	cmp r9,r14
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___merge..for_loop
	jnz ___merge..for_after
___merge..for_loop:
	mov rbx,r9
	imul rbx,8
	add rbx,r13
	mov rbx,qword [rbx+8]
	cmp rbx,0
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___merge..if_true
	jnz ___merge..if_after
___merge..if_true:
	mov rbx,0
	mov rbx,r9
	add rbx,1
	jmp ___merge..for_cond_2
___merge..for_cond_2:
	cmp rbx,r14
	mov rdx,0
	setl dl
	cmp dl,1
	jz ___merge..for_loop_2
	jnz ___merge..for_after_2
___merge..for_loop_2:
	mov rdx,rbx
	imul rdx,8
	add rdx,r13
	mov rdx,qword [rdx+8]
	cmp rdx,0
	mov rdx,0
	setne dl
	cmp dl,1
	jz ___merge..if_true_2
	jnz ___merge..if_after_2
___merge..if_true_2:
	mov qword [rsp],r13
	mov qword [rsp+8],rbx
	mov qword [rsp+16],r9
	mov qword [rsp+24],r14
	mov qword [rsp+32],rdx
	mov qword [rsp+40],rdi
	mov qword [rsp+48],rsi
	mov rsi,rbx
	mov rdi,qword [rsp+16]
	call ___swap
	mov rsi,qword [rsp+48]
	mov rdi,qword [rsp+40]
	mov rdx,qword [rsp+32]
	mov r14,qword [rsp+24]
	mov r9,qword [rsp+16]
	mov rbx,qword [rsp+8]
	mov r13,qword [rsp]
	mov rbx,rax
	jmp ___merge..for_after_2
___merge..if_after_2:
	jmp ___merge..for_step
___merge..for_step:
	add rbx,1
	jmp ___merge..for_cond_2
___merge..for_after_2:
	jmp ___merge..if_after
___merge..if_after:
	jmp ___merge..for_step_2
___merge..for_step_2:
	add r9,1
	jmp ___merge..for_cond
___merge..for_after:
	mov r9,0
	jmp ___merge..for_cond_3
___merge..for_cond_3:
	cmp r9,r14
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___merge..for_loop_3
	jnz ___merge..for_after_3
___merge..for_loop_3:
	mov rbx,r9
	imul rbx,8
	add rbx,r13
	mov rbx,qword [rbx+8]
	cmp rbx,0
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___merge..if_true_3
	jnz ___merge..if_after_3
___merge..if_after_3:
	jmp ___merge..for_step_3
___merge..for_step_3:
	add r9,1
	jmp ___merge..for_cond_3
___merge..if_true_3:
	mov r14,r9
	jmp ___merge..for_after_3
___merge..for_after_3:
	mov qword [___now],r14
	leave
	ret

___move:
___move..move.entry:
	push rbp
	mov rbp,rsp
	sub rsp,64
	mov rbx,qword [___a]
	mov r9,qword [___now]
	mov r14,0
	jmp ___move..for_cond
___move..for_cond:
	cmp r14,r9
	mov r13,0
	setl r13b
	cmp r13b,1
	jz ___move..for_loop
	jnz ___move..for_after
___move..for_loop:
	mov rdx,r14
	imul rdx,8
	add rdx,rbx
	mov r13,r14
	imul r13,8
	add r13,rbx
	mov r13,qword [r13+8]
	sub r13,1
	mov qword [rdx+8],r13
	mov r13,r14
	add r13,1
	mov r14,r13
	jmp ___move..for_cond
___move..for_after:
	mov r13,r9
	imul r13,8
	add r13,rbx
	mov qword [r13+8],r9
	mov r13,r9
	add r9,1
	mov qword [___now],r9
	leave
	ret

main:
main..main.entry:
	push rbp
	mov rbp,rsp
	sub rsp,192
	mov r10,___string_3
	mov qword [rsp+16],r10
	mov r8,qword [___M]
	mov rsi,qword [___n]
	mov r10,qword [___a]
	mov qword [rsp+32],r10
	mov r10,qword [___Q]
	mov qword [rsp+80],r10
	mov r10,___string_4
	mov qword [rsp+88],r10
	mov r10,qword [___A]
	mov qword [rsp+56],r10
	mov r12,qword [___now]
	mov r10,qword [___h]
	mov qword [rsp+64],r10
	mov r10,___string_5
	mov qword [rsp+48],r10
	mov r10,qword [___R]
	mov qword [rsp+24],r10
	mov r9,___string_6
	mov qword [___n],rsi
	mov r10,qword [rsp+32]
	mov qword [___a],r10
	mov r10,qword [rsp+80]
	mov qword [___Q],r10
	mov qword [___now],r12
	mov r10,qword [rsp+64]
	mov qword [___h],r10
	mov r10,qword [rsp+24]
	mov qword [___R],r10
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+144],r15
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ____init
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov r15,qword [rsp+144]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r10,qword [___R]
	mov qword [rsp+24],r10
	mov r10,qword [___h]
	mov qword [rsp+64],r10
	mov r12,qword [___now]
	mov r10,qword [___A]
	mov qword [rsp+56],r10
	mov r10,qword [___Q]
	mov qword [rsp+80],r10
	mov r10,qword [___a]
	mov qword [rsp+32],r10
	mov rsi,qword [___n]
	mov r8,qword [___M]
	mov rdi,0
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call _Z6getIntv
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	mov rcx,rax
	jmp main..for_cond
main..for_cond:
	cmp rdi,rcx
	mov r13,0
	setl r13b
	cmp r13b,1
	jz main..for_loop
	jnz main..for_after
main..for_after:
	mov r13,0
	jmp main..main.exit
main..for_loop:
	mov r13,0
	mov rbx,0
	mov r10,0
	mov qword [rsp+8],r10
	mov rsi,5050
	mov r10,0
	mov qword [rsp+64],r10
	mov r14,816
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,r14
	call malloc
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	mov r14,rax
	mov qword [r14],101
	mov r10,r14
	mov qword [rsp+32],r10
	mov rax,r8
	mov r11,rdx
	cqo
	mov r10,qword [rsp+56]
	idiv r10
	mov rdx,r11
	mov rdx,rax
	mov r10,rdx
	mov qword [rsp+80],r10
	mov rax,r8
	mov r11,rdx
	cqo
	mov r10,qword [rsp+56]
	idiv r10
	mov r10,rdx
	mov qword [rsp],r10
	mov rdx,r11
	mov r10,qword [rsp]
	mov qword [rsp+24],r10
	mov r10,qword [rsp+64]
	mov qword [___h],r10
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,qword [rsp+168]
	call ___pd
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r14,rax
	mov r10,qword [___h]
	mov qword [rsp+64],r10
	xor r14,1
	cmp r14b,1
	jz main..if_true
	jnz main..if_after
main..if_after:
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,qword [rsp+120]
	call _Z7printlnPc
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	mov r10,qword [rsp+80]
	mov qword [___Q],r10
	mov r10,qword [rsp+24]
	mov qword [___R],r10
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+144],r15
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___random
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov r15,qword [rsp+144]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r14,rax
	mov qword [rsp+104],r13
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,r14
	call ___initialize
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	mov r13,qword [rsp+104]
	mov r14,rax
	mov r10,qword [rsp+80]
	mov qword [___Q],r10
	mov r10,qword [rsp+24]
	mov qword [___R],r10
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+144],r15
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___random
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov r15,qword [rsp+144]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r14,rax
	mov rax,r14
	mov r11,rdx
	cqo
	mov r10,10
	idiv r10
	mov r10,rdx
	mov qword [rsp+72],r10
	mov rdx,r11
	mov r10,qword [rsp+72]
	mov r12,r10
	add r12,1
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,r12
	call _Z10printlnInti
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	jmp main..for_cond_2
main..for_cond_2:
	mov r14,r12
	sub r14,1
	cmp r13,r14
	mov r14,0
	setl r14b
	cmp r14b,1
	jz main..for_loop_2
	jnz main..for_after_2
main..for_after_2:
	mov r13,rsi
	sub r13,rbx
	mov rbx,r13
	mov r13,r12
	sub r13,1
	imul r13,8
	mov r10,qword [rsp+32]
	add r13,r10
	mov qword [r13+8],rbx
	mov r10,qword [rsp+32]
	mov qword [___a],r10
	mov qword [___now],r12
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+144],r15
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___show
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov r15,qword [rsp+144]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r13,rax
	mov r10,qword [rsp+32]
	mov qword [___a],r10
	mov qword [___now],r12
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___merge
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r13,rax
	mov r12,qword [___now]
	jmp main..while_cond
main..while_cond:
	mov r10,qword [rsp+32]
	mov qword [___a],r10
	mov qword [___now],r12
	mov r10,qword [rsp+64]
	mov qword [___h],r10
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+144],r15
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___win
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov r15,qword [rsp+144]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r13,rax
	xor r13,1
	cmp r13b,1
	jz main..while_loop
	jnz main..while_after
main..while_after:
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,qword [rsp+48]
	call _Z5printPc
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,qword [rsp+8]
	call _Z8printInti
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,qword [rsp+88]
	call _Z7printlnPc
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	jmp main..for_step
main..for_step:
	add rdi,1
	jmp main..for_cond
main..while_loop:
	mov r10,qword [rsp+8]
	add r10,1
	mov qword [rsp+8],r10
	mov r10,qword [rsp+32]
	mov qword [___a],r10
	mov qword [___now],r12
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___move
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r13,rax
	mov r12,qword [___now]
	mov r10,qword [rsp+32]
	mov qword [___a],r10
	mov qword [___now],r12
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___merge
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r13,rax
	mov r12,qword [___now]
	jmp main..while_cond
main..for_loop_2:
	mov r10,qword [rsp+80]
	mov qword [___Q],r10
	mov r10,qword [rsp+24]
	mov qword [___R],r10
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+144],r15
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___random
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov r15,qword [rsp+144]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r14,rax
	mov rax,r14
	mov r11,rdx
	cqo
	mov r10,10
	idiv r10
	mov r10,rdx
	mov qword [rsp+96],r10
	mov rdx,r11
	mov r10,qword [rsp+96]
	mov r14,r10
	add r14,1
	mov r15,r13
	imul r15,8
	mov r10,qword [rsp+32]
	add r15,r10
	mov qword [r15+8],r14
	jmp main..while_cond_2
main..while_cond_2:
	mov r14,r13
	imul r14,8
	mov r10,qword [rsp+32]
	add r14,r10
	mov r14,qword [r14+8]
	add r14,rbx
	cmp r14,rsi
	mov r14,0
	setg r14b
	cmp r14b,1
	jz main..while_loop_2
	jnz main..while_after_2
main..while_after_2:
	mov r14,r13
	imul r14,8
	mov r10,qword [rsp+32]
	add r14,r10
	mov r14,qword [r14+8]
	add rbx,r14
	jmp main..for_step_2
main..for_step_2:
	add r13,1
	jmp main..for_cond_2
main..while_loop_2:
	mov r10,qword [rsp+80]
	mov qword [___Q],r10
	mov r10,qword [rsp+24]
	mov qword [___R],r10
	mov qword [rsp+104],r13
	mov qword [rsp+112],rbx
	mov qword [rsp+120],r9
	mov qword [rsp+128],r14
	mov qword [rsp+136],rdx
	mov qword [rsp+144],r15
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	call ___random
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov r15,qword [rsp+144]
	mov rdx,qword [rsp+136]
	mov r14,qword [rsp+128]
	mov r9,qword [rsp+120]
	mov rbx,qword [rsp+112]
	mov r13,qword [rsp+104]
	mov r14,rax
	mov rax,r14
	mov r11,rdx
	cqo
	mov r10,10
	idiv r10
	mov r10,rdx
	mov qword [rsp+40],r10
	mov rdx,r11
	mov r10,qword [rsp+40]
	mov r14,r10
	add r14,1
	mov r15,r13
	imul r15,8
	mov r10,qword [rsp+32]
	add r15,r10
	mov qword [r15+8],r14
	jmp main..while_cond_2
main..if_true:
	mov qword [rsp+120],r9
	mov qword [rsp+136],rdx
	mov qword [rsp+152],rdi
	mov qword [rsp+160],rcx
	mov qword [rsp+168],rsi
	mov qword [rsp+184],r8
	mov rdi,qword [rsp+16]
	call _Z7printlnPc
	mov r8,qword [rsp+184]
	mov rsi,qword [rsp+168]
	mov rcx,qword [rsp+160]
	mov rdi,qword [rsp+152]
	mov rdx,qword [rsp+136]
	mov r9,qword [rsp+120]
	mov r13,1
	jmp main..main.exit
main..main.exit:
	mov qword [___n],rsi
	mov r10,qword [rsp+32]
	mov qword [___a],r10
	mov r10,qword [rsp+80]
	mov qword [___Q],r10
	mov qword [___now],r12
	mov r10,qword [rsp+64]
	mov qword [___h],r10
	mov r10,qword [rsp+24]
	mov qword [___R],r10
	mov rax,r13
	leave
	ret

____init:
____init.._init.entry:
	push rbp
	mov rbp,rsp
	sub rsp,80
	mov rdi,qword [___M]
	mov r14,qword [___n]
	mov r15,qword [___a]
	mov rsi,qword [___Q]
	mov r9,qword [___now]
	mov rcx,qword [___A]
	mov rbx,qword [___h]
	mov r13,qword [___R]
	mov rdx,qword [___seed]
	mov r14,0
	mov rbx,0
	mov r9,0
	mov r15,0
	mov rcx,48271
	mov rdi,2147483647
	mov rsi,0
	mov r13,0
	mov rdx,1
	mov qword [___M],rdi
	mov qword [___n],r14
	mov qword [___a],r15
	mov qword [___Q],rsi
	mov qword [___now],r9
	mov qword [___A],rcx
	mov qword [___h],rbx
	mov qword [___R],r13
	mov qword [___seed],rdx
	leave
	ret

	section .data
___string:
	db 1,0,0,0,0,0,0,0,32,0
___string_2:
	db 0,0,0,0,0,0,0,0,0
___string_3:
	db 79,0,0,0,0,0,0,0,83,111,114,114,121,44,32,116,104,101,32,110,117,109,98,101,114,32,110,32,109,117,115,116,32,98,101,32,97,32,110,117,109,98,101,114,32,115,46,116,46,32,116,104,101,114,101,32,101,120,105,115,116,115,32,105,32,115,97,116,105,115,102,121,105,110,103,32,110,61,49,43,50,43,46,46,46,43,105,0
___string_6:
	db 12,0,0,0,0,0,0,0,76,101,116,39,115,32,115,116,97,114,116,33,0
___string_5:
	db 7,0,0,0,0,0,0,0,84,111,116,97,108,58,32,0
___string_4:
	db 8,0,0,0,0,0,0,0,32,115,116,101,112,40,115,41,0

section .bss
___n:
	resb 64
___h:
	resb 64
___now:
	resb 64
___a:
	resb 64
___A:
	resb 64
___M:
	resb 64
___Q:
	resb 64
___R:
	resb 64
___seed:
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



global main

extern malloc
section .text

___hex2int:
___hex2int..hex2int.entry:
	push rbp
	mov rbp,rsp
	sub rsp,48
	mov r14,0
	mov r13,0
	mov r14,0
	jmp ___hex2int..for_cond
___hex2int..for_cond:
	mov rbx,qword [rdi]
	cmp r14,rbx
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___hex2int..for_loop
	jnz ___hex2int..for_after
___hex2int..for_loop:
	mov qword [rsp+8],rcx
	mov qword [rsp+32],rdi
	mov rsi,r14
	mov rdi,qword [rsp+32]
	call _Z9stringOrdPci
	mov rdi,qword [rsp+32]
	mov rcx,qword [rsp+8]
	mov rcx,rax
	cmp rcx,48
	mov rbx,0
	setge bl
	cmp bl,1
	jz ___hex2int..lhs_true
	jnz ___hex2int..lhs_false
___hex2int..lhs_true:
	cmp rcx,57
	mov rbx,0
	setle bl
	jmp ___hex2int..lhs_merge
___hex2int..lhs_false:
	mov rbx,0
	jmp ___hex2int..lhs_merge
___hex2int..lhs_merge:
	cmp bl,1
	jz ___hex2int..if_true
	jnz ___hex2int..if_false
___hex2int..if_false:
	cmp rcx,65
	mov rbx,0
	setge bl
	cmp bl,1
	jz ___hex2int..lhs_true_2
	jnz ___hex2int..lhs_false_2
___hex2int..lhs_false_2:
	mov rbx,0
	jmp ___hex2int..lhs_merge_2
___hex2int..lhs_true_2:
	cmp rcx,70
	mov rbx,0
	setle bl
	jmp ___hex2int..lhs_merge_2
___hex2int..lhs_merge_2:
	cmp bl,1
	jz ___hex2int..if_true_2
	jnz ___hex2int..if_false_2
___hex2int..if_true_2:
	imul r13,16
	mov rbx,r13
	add rbx,rcx
	sub rbx,65
	add rbx,10
	mov r13,rbx
	jmp ___hex2int..if_after
___hex2int..if_false_2:
	cmp rcx,97
	mov rbx,0
	setge bl
	cmp bl,1
	jz ___hex2int..lhs_true_3
	jnz ___hex2int..lhs_false_3
___hex2int..lhs_false_3:
	mov rbx,0
	jmp ___hex2int..lhs_merge_3
___hex2int..lhs_true_3:
	cmp rcx,102
	mov rbx,0
	setle bl
	jmp ___hex2int..lhs_merge_3
___hex2int..lhs_merge_3:
	cmp bl,1
	jz ___hex2int..if_true_3
	jnz ___hex2int..if_false_3
___hex2int..if_false_3:
	mov r13,0
	jmp ___hex2int..hex2int.exit
___hex2int..if_true_3:
	mov rbx,r13
	imul rbx,16
	add rbx,rcx
	mov r13,rbx
	sub r13,97
	add r13,10
	jmp ___hex2int..if_after_2
___hex2int..if_after_2:
	jmp ___hex2int..if_after
___hex2int..if_after:
	jmp ___hex2int..if_after_3
___hex2int..if_true:
	imul r13,16
	add r13,rcx
	mov rbx,r13
	sub rbx,48
	mov r13,rbx
	jmp ___hex2int..if_after_3
___hex2int..if_after_3:
	jmp ___hex2int..for_step
___hex2int..for_step:
	mov rbx,r14
	add r14,1
	jmp ___hex2int..for_cond
___hex2int..for_after:
	jmp ___hex2int..hex2int.exit
___hex2int..hex2int.exit:
	mov rax,r13
	leave
	ret

___int2chr:
___int2chr..int2chr.entry:
	push rbp
	mov rbp,rsp
	sub rsp,32
	mov rcx,___string
	mov r14,qword [___asciiTable]
	cmp rdi,32
	mov rbx,0
	setge bl
	cmp bl,1
	jz ___int2chr..lhs_true
	jnz ___int2chr..lhs_false
___int2chr..lhs_false:
	mov rbx,0
	jmp ___int2chr..lhs_merge
___int2chr..lhs_true:
	cmp rdi,126
	mov rbx,0
	setle bl
	jmp ___int2chr..lhs_merge
___int2chr..lhs_merge:
	cmp bl,1
	jz ___int2chr..if_true
	jnz ___int2chr..if_after
___int2chr..if_true:
	mov rbx,rdi
	sub rbx,32
	sub rdi,32
	mov qword [rsp+8],rcx
	mov qword [rsp+24],rdi
	mov rdx,qword [rsp+24]
	mov rsi,rbx
	mov rdi,r14
	call _Z15stringSubStringPcii
	mov rdi,qword [rsp+24]
	mov rcx,qword [rsp+8]
	mov rbx,rax
	jmp ___int2chr..int2chr.exit
___int2chr..if_after:
	mov rbx,rcx
	jmp ___int2chr..int2chr.exit
___int2chr..int2chr.exit:
	mov rax,rbx
	leave
	ret

___toStringHex:
___toStringHex..toStringHex.entry:
	push rbp
	mov rbp,rsp
	sub rsp,48
	mov r13,___string
	mov r14,0
	mov r14,28
	jmp ___toStringHex..for_cond
___toStringHex..for_cond:
	cmp r14,0
	mov rbx,0
	setge bl
	cmp bl,1
	jz ___toStringHex..for_loop
	jnz ___toStringHex..for_after
___toStringHex..for_loop:
	mov r11,rcx
	mov rcx,r14
	mov rax,rdi
	sar rax,cl
	mov rbx,rax
	mov rcx,r11
	and rbx,15
	mov rcx,rbx
	cmp rcx,10
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___toStringHex..if_true
	jnz ___toStringHex..if_false
___toStringHex..if_true:
	add rcx,48
	mov qword [rsp],rbx
	mov qword [rsp+8],rcx
	mov qword [rsp+16],r14
	mov qword [rsp+32],rdi
	mov rdi,qword [rsp+8]
	call ___int2chr
	mov rdi,qword [rsp+32]
	mov r14,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,qword [rsp]
	mov rbx,rax
	mov qword [rsp+8],rcx
	mov qword [rsp+32],rdi
	mov rsi,rbx
	mov rdi,r13
	call _Z12stringConcatPcS_
	mov rdi,qword [rsp+32]
	mov rcx,qword [rsp+8]
	mov r13,rax
	jmp ___toStringHex..if_after
___toStringHex..if_false:
	mov rbx,rcx
	add rbx,65
	sub rbx,10
	mov qword [rsp],rbx
	mov qword [rsp+8],rcx
	mov qword [rsp+16],r14
	mov qword [rsp+32],rdi
	mov rdi,rbx
	call ___int2chr
	mov rdi,qword [rsp+32]
	mov r14,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,qword [rsp]
	mov rbx,rax
	mov qword [rsp+8],rcx
	mov qword [rsp+32],rdi
	mov rsi,rbx
	mov rdi,r13
	call _Z12stringConcatPcS_
	mov rdi,qword [rsp+32]
	mov rcx,qword [rsp+8]
	mov rbx,rax
	mov r13,rbx
	jmp ___toStringHex..if_after
___toStringHex..if_after:
	jmp ___toStringHex..for_step
___toStringHex..for_step:
	sub r14,4
	jmp ___toStringHex..for_cond
___toStringHex..for_after:
	mov rax,r13
	leave
	ret

___rotate_left:
___rotate_left..rotate_left.entry:
	push rbp
	mov rbp,rsp
	sub rsp,48
	cmp rsi,1
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___rotate_left..if_true
	jnz ___rotate_left..if_after
___rotate_left..if_after:
	cmp rsi,31
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___rotate_left..if_true_2
	jnz ___rotate_left..if_after_2
___rotate_left..if_after_2:
	mov rbx,32
	sub rbx,rsi   		;32-x = 27
	mov r11,rcx		
	mov rcx,rbx
	mov rax,1
	sal rax,cl		;1<<(32-shift)
	mov rbx,rax		;rbx = 1<<27
	mov rcx,r11
	
	sub rbx,1		;((1 << (32-shift)) - 1)
	mov rcx,rdi
	and rcx,rbx		;rcx = 121971457
	mov r11,rcx
	mov rcx,rsi
	mov rax,rcx
	sal rax,cl
	mov rcx,rax
	mov rbx,32
	sub rbx,rsi
	mov r11,rcx
	mov rcx,rbx
	mov rax,rdi
	sar rax,cl
	mov r14,rax
	mov rcx,r11
	mov r11,rcx
	mov rcx,rsi
	mov rax,1
	sal rax,cl
	mov rbx,rax
	mov rcx,r11
	sub rbx,1
	and r14,rbx
	or rcx,r14
	mov rbx,rcx
	jmp ___rotate_left..rotate_left.exit
___rotate_left..if_true_2:
	mov rbx,rdi
	and rbx,1
	mov rcx,rbx
	sal rcx,31
	sar rdi,1
	mov rbx,rdi
	and rbx,2147483647
	or rcx,rbx
	mov rbx,rcx
	jmp ___rotate_left..rotate_left.exit
___rotate_left..if_true:
	mov rbx,rdi
	and rbx,2147483647
	sal rbx,1
	sar rdi,31
	and rdi,1
	or rbx,rdi
	jmp ___rotate_left..rotate_left.exit
___rotate_left..rotate_left.exit:
	mov rax,rbx
	leave
	ret

___add:
___add..add.entry:
	push rbp
	mov rbp,rsp
	sub rsp,48
	mov rbx,rdi
	and rbx,65535
	mov rcx,rsi
	and rcx,65535
	add rbx,rcx
	mov rcx,rbx
	mov rbx,rdi
	sar rbx,16
	mov r13,rbx
	and r13,65535
	mov rbx,rsi
	sar rbx,16
	mov r14,rbx
	and r14,65535
	mov rbx,r13
	add rbx,r14
	mov r14,rcx
	sar r14,16
	add rbx,r14
	and rbx,65535
	mov r14,rbx
	sal r14,16
	mov rbx,rcx
	and rbx,65535
	mov rcx,r14
	or rcx,rbx
	mov rax,rcx
	leave
	ret

___lohi:
___lohi..lohi.entry:
	push rbp
	mov rbp,rsp
	sub rsp,16
	sal rsi,16
	or rdi,rsi
	mov rax,rdi
	leave
	ret

___sha1:
___sha1..sha1.entry:
	push rbp
	mov rbp,rsp
	sub rsp,256
	mov r10,qword [___MAXCHUNK]
	mov qword [rsp+112],r10
	mov r10,qword [___outputBuffer]
	mov qword [rsp+40],r10
	mov rbx,___string_2
	mov r8,qword [___chunks]
	mov r12,rsi
	add r12,64
	sub r12,56
	mov rax,r12
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov rdx,r11
	mov r10,rax
	mov qword [rsp+48],r10
	mov r10,qword [rsp+48]
	mov r12,r10
	add r12,1
	mov r10,r12
	mov qword [rsp+32],r10
	mov r10,qword [rsp+32]
	mov r11,qword [rsp+112]
	cmp r10,r11
	mov r12,0
	setg r12b
	cmp r12b,1
	jz ___sha1..if_true
	jnz ___sha1..if_after
___sha1..if_true:
	mov qword [rsp+168],rcx
	mov qword [rsp+192],r9
	mov qword [rsp+200],rdi
	mov qword [rsp+224],r8
	mov qword [rsp+232],rsi
	mov qword [rsp+240],rdx
	mov rdi,rbx
	call _Z7printlnPc
	mov rdx,qword [rsp+240]
	mov rsi,qword [rsp+232]
	mov r8,qword [rsp+224]
	mov rdi,qword [rsp+200]
	mov r9,qword [rsp+192]
	mov rcx,qword [rsp+168]
	mov rbx,0
	jmp ___sha1..sha1.exit
___sha1..if_after:
	mov r10,0
	mov qword [rsp+152],r10
	mov r12,0
	mov r10,0
	mov qword [rsp+152],r10
	jmp ___sha1..for_cond
___sha1..for_cond:
	mov r10,qword [rsp+152]
	mov r11,qword [rsp+32]
	cmp r10,r11
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..for_loop
	jnz ___sha1..for_after
___sha1..for_after:
	mov r10,0
	mov qword [rsp+152],r10
	jmp ___sha1..for_cond_2
___sha1..for_cond_2:
	mov r10,qword [rsp+152]
	cmp r10,rsi
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..for_loop_2
	jnz ___sha1..for_after_2
___sha1..for_after_2:
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov rdx,r11
	mov r10,rax
	mov qword [rsp+80],r10
	mov r10,qword [rsp+80]
	mov rbx,r10
	imul rbx,8
	add rbx,r8
	mov rbx,qword [rbx+8]
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov rdi,rdx
	mov rdx,r11
	mov rax,rdi
	mov r11,rdx
	cqo
	mov r10,4
	idiv r10
	mov rdx,r11
	mov rcx,rax
	imul rcx,8
	add rcx,rbx
	mov rcx,qword [rcx+8]
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,4
	idiv r10
	mov r10,rdx
	mov qword [rsp+144],r10
	mov rdx,r11
	mov rbx,3
	mov r10,qword [rsp+144]
	sub rbx,r10
	imul rbx,8
	mov r11,rcx
	mov rcx,rbx
	mov rax,128
	sal rax,cl
	mov rdi,rax
	mov rcx,r11
	mov rbx,rcx
	or rbx,rdi
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov rdx,r11
	mov r14,rax
	imul r14,8
	add r14,r8
	mov r14,qword [r14+8]
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov r9,rdx
	mov rdx,r11
	mov rax,r9
	mov r11,rdx
	cqo
	mov r10,4
	idiv r10
	mov rdx,r11
	mov r13,rax
	imul r13,8
	add r13,r14
	mov qword [r13+8],rbx
	mov rcx,rsi
	sal rcx,3
	mov r10,qword [rsp+32]
	mov rbx,r10
	sub rbx,1
	imul rbx,8
	add rbx,r8
	mov rbx,qword [rbx+8]
	add rbx,120
	mov qword [rbx+8],rcx
	sar rsi,29
	and rsi,7
	mov r10,qword [rsp+32]
	mov rbx,r10
	sub rbx,1
	imul rbx,8
	add rbx,r8
	mov rbx,qword [rbx+8]
	add rbx,112
	mov qword [rbx+8],rsi
	mov r9,1732584193
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,61389
	mov rdi,43913
	call ___lohi
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov rdx,rax
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,39098
	mov rdi,56574
	call ___lohi
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r15,rax
	mov r10,271733878
	mov qword [rsp+64],r10
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,50130
	mov rdi,57840
	call ___lohi
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov rcx,rax
	mov r10,0
	mov qword [rsp+152],r10
	jmp ___sha1..for_cond_3
___sha1..for_cond_3:
	mov r10,qword [rsp+152]
	mov r11,qword [rsp+32]
	cmp r10,r11
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..for_loop_3
	jnz ___sha1..for_after_3
___sha1..for_after_3:
	mov r10,qword [rsp+40]
	mov rbx,r10
	add rbx,0
	mov qword [rbx+8],r9
	mov r10,qword [rsp+40]
	mov rbx,r10
	add rbx,8
	mov qword [rbx+8],rdx
	mov r10,qword [rsp+40]
	mov rbx,r10
	add rbx,16
	mov qword [rbx+8],r15
	mov r10,qword [rsp+40]
	mov rbx,r10
	add rbx,24
	mov r10,qword [rsp+64]
	mov qword [rbx+8],r10
	mov r10,qword [rsp+40]
	mov rbx,r10
	add rbx,32
	mov qword [rbx+8],rcx
	mov r10,qword [rsp+40]
	mov rbx,r10
	jmp ___sha1..sha1.exit
___sha1..sha1.exit:
	mov rax,rbx
	leave
	ret
___sha1..for_loop_3:
	mov r12,16
	jmp ___sha1..for_cond_4
___sha1..for_cond_4:
	cmp r12,80
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..for_loop_4
	jnz ___sha1..for_after_4
___sha1..for_after_4:
	mov r10,r9 ;; int a = h0
	mov qword [rsp+72],r10
	mov rdi,rdx
	mov r14,r15
	mov r10,qword [rsp+64]
	mov qword [rsp+88],r10
	mov rsi,rcx
	mov r12,0
	jmp ___sha1..for_cond_5
___sha1..for_cond_5:
	cmp r12,80
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..for_loop_5
	jnz ___sha1..for_after_5
___sha1..for_loop_5:
	mov r10,0
	mov qword [rsp+136],r10
	mov r13,0
	cmp r12,20
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..if_true_2
	jnz ___sha1..if_false
___sha1..if_false:
	cmp r12,40
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..if_true_3
	jnz ___sha1..if_false_2
___sha1..if_true_3:
	mov rbx,rdi
	xor rbx,r14
	mov r10,qword [rsp+88]
	xor rbx,r10
	mov r10,rbx
	mov qword [rsp+136],r10
	mov r13,1859775393
	jmp ___sha1..if_after_2
___sha1..if_false_2:
	cmp r12,60
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..if_true_4
	jnz ___sha1..if_false_3
___sha1..if_true_4:
	mov r13,rdi
	and r13,r14
	mov rbx,rdi
	mov r10,qword [rsp+88]
	and rbx,r10
	mov r10,r13
	mov qword [rsp+24],r10
	mov r10,qword [rsp+24]
	or r10,rbx
	mov qword [rsp+24],r10
	mov r13,r14
	mov r10,qword [rsp+88]
	and r13,r10
	mov r10,qword [rsp+24]
	mov rbx,r10
	or rbx,r13
	mov r10,rbx
	mov qword [rsp+136],r10
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,36635
	mov rdi,48348
	call ___lohi
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,rax
	jmp ___sha1..if_after_3
___sha1..if_false_3:
	mov rbx,rdi
	xor rbx,r14
	mov r10,qword [rsp+88]
	xor rbx,r10
	mov r10,rbx
	mov qword [rsp+136],r10
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,51810
	mov rdi,49622
	call ___lohi
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,rax
	jmp ___sha1..if_after_3
___sha1..if_after_3:
	jmp ___sha1..if_after_2
___sha1..if_after_2:
	jmp ___sha1..if_after_4
___sha1..if_true_2:
	mov r13,rdi
	and r13,r14
	mov rbx,rdi
	not rbx
	mov r10,qword [rsp+88]
	and rbx,r10
	or r13,rbx
	mov r10,r13
	mov qword [rsp+136],r10
	mov r13,1518500249
	jmp ___sha1..if_after_4
___sha1..if_after_4:
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,5
	mov rdi,qword [rsp+72]
	call ___rotate_left
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov rbx,rax
	;; debug info
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov qword [rsp+192],r9
	mov qword [rsp+224],r8
	mov qword [rsp+240],rdx
	mov rdi,rbx
	call _Z10printlnInti
	mov rdx,qword [rsp+240]
	mov r8,qword [rsp+224]
	mov r9,qword [rsp+192]
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
;; debug info
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,qword [rsp+232]
	mov rdi,rbx
	call ___add
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov rsi,rax
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,r13
	mov rdi,qword [rsp+136]
	call ___add
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov rbx,rax
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,rbx
	mov rdi,qword [rsp+232]
	call ___add
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov rbx,rax
	mov r10,qword [rsp+152]
	mov rsi,r10
	imul rsi,8
	add rsi,r8
	mov rsi,qword [rsi+8]
	mov r13,r12
	imul r13,8
	add r13,rsi
	mov r13,qword [r13+8]
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,r13
	mov rdi,rbx
	call ___add
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov rbx,rax
	
	mov r10,qword [rsp+88]
	mov rsi,r10
	mov r10,r14
	mov qword [rsp+88],r10
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,30
	mov rdi,qword [rsp+200]
	call ___rotate_left
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov r14,rax
	mov r10,qword [rsp+72]
	mov rdi,r10
	mov r10,rbx
	mov qword [rsp+72],r10
	jmp ___sha1..for_step
___sha1..for_step:
	mov rbx,r12
	add r12,1
	jmp ___sha1..for_cond_5
___sha1..for_after_5:
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,qword [rsp+72]
	mov qword [rsp+192],r9
	mov rdi,qword [rsp+192]
	call ___add
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r9,qword [rsp+192]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov r9,rax
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,qword [rsp+200]
	mov qword [rsp+240],rdx
	mov rdi,qword [rsp+240]
	call ___add
	mov rdx,qword [rsp+240]
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov rdx,rax
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,r14
	mov rdi,r15
	call ___add
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov r15,rax
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,qword [rsp+88]
	mov rdi,qword [rsp+64]
	call ___add
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov rbx,rax
	mov r10,rbx
	mov qword [rsp+64],r10
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+184],r13
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+168]
	call ___add
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r13,qword [rsp+184]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov rcx,rax
	jmp ___sha1..for_step_2
___sha1..for_step_2:
	mov r10,qword [rsp+152]
	mov rbx,r10
	mov r10,qword [rsp+152]
	add r10,1
	mov qword [rsp+152],r10
	jmp ___sha1..for_cond_3
___sha1..for_loop_4:
	mov r10,qword [rsp+152]
	mov rbx,r10
	imul rbx,8
	add rbx,r8
	mov rbx,qword [rbx+8]
	mov r13,r12
	sub r13,3
	imul r13,8
	add r13,rbx
	mov r13,qword [r13+8]
	mov r10,qword [rsp+152]
	mov r14,r10
	imul r14,8
	add r14,r8
	mov r14,qword [r14+8]
	mov rbx,r12
	sub rbx,8
	imul rbx,8
	add rbx,r14
	mov rbx,qword [rbx+8]
	xor r13,rbx
	mov r10,qword [rsp+152]
	mov r14,r10
	imul r14,8
	add r14,r8
	mov r14,qword [r14+8]
	mov rbx,r12
	sub rbx,14
	imul rbx,8
	add rbx,r14
	mov rbx,qword [rbx+8]
	mov r14,r13
	xor r14,rbx
	mov r10,qword [rsp+152]
	mov rbx,r10
	imul rbx,8
	add rbx,r8
	mov rbx,qword [rbx+8]
	mov r13,r12
	sub r13,16
	imul r13,8
	add r13,rbx
	mov r13,qword [r13+8]
	xor r14,r13
	mov qword [rsp+160],rbx
	mov qword [rsp+168],rcx
	mov qword [rsp+176],r14
	mov qword [rsp+200],rdi
	mov qword [rsp+232],rsi
	mov rsi,1
	mov rdi,r14
	call ___rotate_left
	mov rsi,qword [rsp+232]
	mov rdi,qword [rsp+200]
	mov r14,qword [rsp+176]
	mov rcx,qword [rsp+168]
	mov rbx,qword [rsp+160]
	mov r14,rax
	mov r10,qword [rsp+152]
	mov r13,r10
	imul r13,8
	add r13,r8
	mov r13,qword [r13+8]
	mov rbx,r12
	imul rbx,8
	add rbx,r13
	mov qword [rbx+8],r14
	jmp ___sha1..for_step_3
___sha1..for_step_3:
	mov rbx,r12
	add r12,1
	jmp ___sha1..for_cond_4
___sha1..for_loop_2:
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov rdx,r11
	mov r10,rax
	mov qword [rsp+8],r10
	mov r10,qword [rsp+8]
	mov rbx,r10
	imul rbx,8
	add rbx,r8
	mov rbx,qword [rbx+8]
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov r10,rdx
	mov qword [rsp+128],r10
	mov rdx,r11
	mov r10,qword [rsp+128]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,4
	idiv r10
	mov rdx,r11
	mov r15,rax
	mov r12,r15
	imul r12,8
	add r12,rbx
	mov r12,qword [r12+8]
	mov r10,qword [rsp+152]
	mov qword [rsp+56],r10
	mov r10,qword [rsp+56]
	imul r10,8
	mov qword [rsp+56],r10
	mov r10,qword [rsp+56]
	add r10,rdi
	mov qword [rsp+56],r10
	mov r10,qword [rsp+56]
	mov r10,qword [r10+8]
	mov qword [rsp+56],r10
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,4
	idiv r10
	mov r10,rdx
	mov qword [rsp+96],r10
	mov rdx,r11
	mov rbx,3
	mov r10,qword [rsp+96]
	sub rbx,r10
	imul rbx,8
	mov r11,rcx
	mov rcx,rbx
	mov r10,qword [rsp+56]
	mov rax,r10
	sal rax,cl
	mov rbx,rax
	mov rcx,r11
	or r12,rbx
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov rdx,r11
	mov rdx,rax
	mov rbx,rdx
	imul rbx,8
	add rbx,r8
	mov rbx,qword [rbx+8]
	mov r10,qword [rsp+152]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,64
	idiv r10
	mov r10,rdx
	mov qword [rsp+16],r10
	mov rdx,r11
	mov r10,qword [rsp+16]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,4
	idiv r10
	mov rdx,r11
	mov r10,rax
	mov qword [rsp+104],r10
	mov r10,qword [rsp+104]
	mov qword [rsp],r10
	mov r10,qword [rsp]
	imul r10,8
	mov qword [rsp],r10
	mov r10,qword [rsp]
	add r10,rbx
	mov qword [rsp],r10
	mov r10,qword [rsp]
	mov qword [r10+8],r12
	jmp ___sha1..for_step_4
___sha1..for_step_4:
	mov r10,qword [rsp+152]
	mov rbx,r10
	mov r10,qword [rsp+152]
	add r10,1
	mov qword [rsp+152],r10
	jmp ___sha1..for_cond_2
___sha1..for_loop:
	mov r12,0
	jmp ___sha1..for_cond_6
___sha1..for_cond_6:
	cmp r12,80
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___sha1..for_loop_6
	jnz ___sha1..for_after_6
___sha1..for_after_6:
	jmp ___sha1..for_step_5
___sha1..for_step_5:
	mov r10,qword [rsp+152]
	mov rbx,r10
	mov r10,qword [rsp+152]
	add r10,1
	mov qword [rsp+152],r10
	jmp ___sha1..for_cond
___sha1..for_loop_6:
	mov r10,qword [rsp+152]
	mov rbx,r10
	imul rbx,8
	add rbx,r8
	mov rbx,qword [rbx+8]
	mov r10,r12
	mov qword [rsp+120],r10
	mov r10,qword [rsp+120]
	imul r10,8
	mov qword [rsp+120],r10
	mov r10,qword [rsp+120]
	add r10,rbx
	mov qword [rsp+120],r10
	mov r10,qword [rsp+120]
	mov qword [r10+8],0
	jmp ___sha1..for_step_6
___sha1..for_step_6:
	mov rbx,r12
	add r12,1
	jmp ___sha1..for_cond_6

___computeSHA1:
___computeSHA1..computeSHA1.entry:
	push rbp
	mov rbp,rsp
	sub rsp,64
	mov r13,___string
	mov rcx,qword [___inputBuffer]
	mov rbx,0
	mov rbx,0
	jmp ___computeSHA1..for_cond
___computeSHA1..for_cond:
	mov r14,qword [rdi]
	cmp rbx,r14
	mov r14,0
	setl r14b
	cmp r14b,1
	jz ___computeSHA1..for_loop
	jnz ___computeSHA1..for_after
___computeSHA1..for_loop:
	mov qword [rsp+8],rcx
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+48],rsi
	mov rsi,rbx
	mov rdi,qword [rsp+40]
	call _Z9stringOrdPci
	mov rsi,qword [rsp+48]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov rcx,qword [rsp+8]
	mov r14,rax
	mov r9,rbx
	imul r9,8
	add r9,rcx
	mov qword [r9+8],r14
	jmp ___computeSHA1..for_step
___computeSHA1..for_step:
	mov r14,rbx
	add rbx,1
	jmp ___computeSHA1..for_cond
___computeSHA1..for_after:
	mov rbx,qword [rdi]
	mov qword [rsp],rbx
	mov qword [rsp+8],rcx
	mov qword [rsp+16],r14
	mov qword [rsp+24],r13
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+48],rsi
	mov rsi,rbx
	mov rdi,qword [rsp+8]
	call ___sha1
	mov rsi,qword [rsp+48]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov r13,qword [rsp+24]
	mov r14,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,qword [rsp]
	mov rbx,rax
	mov r14,rbx
	mov rbx,0
	jmp ___computeSHA1..for_cond_2
___computeSHA1..for_cond_2:
	mov rcx,qword [r14]
	cmp rbx,rcx
	mov rcx,0
	setl cl
	cmp cl,1
	jz ___computeSHA1..for_loop_2
	jnz ___computeSHA1..for_after_2
___computeSHA1..for_after_2:
	mov qword [rsp+8],rcx
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+48],rsi
	mov rdi,r13
	call _Z7printlnPc
	mov rsi,qword [rsp+48]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov rcx,qword [rsp+8]
	leave
	ret
___computeSHA1..for_loop_2:
	mov rcx,rbx
	imul rcx,8
	add rcx,r14
	mov rcx,qword [rcx+8]
	mov qword [rsp],rbx
	mov qword [rsp+8],rcx
	mov qword [rsp+16],r14
	mov qword [rsp+24],r13
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+48],rsi
	mov rdi,qword [rsp+8]
	call ___toStringHex
	mov rsi,qword [rsp+48]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov r13,qword [rsp+24]
	mov r14,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,qword [rsp]
	mov rcx,rax
	mov qword [rsp+8],rcx
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+48],rsi
	mov rdi,qword [rsp+8]
	call _Z5printPc
	mov rsi,qword [rsp+48]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov rcx,qword [rsp+8]
	jmp ___computeSHA1..for_step_2
___computeSHA1..for_step_2:
	mov rcx,rbx
	add rbx,1
	jmp ___computeSHA1..for_cond_2

___nextLetter:
___nextLetter..nextLetter.entry:
	push rbp
	mov rbp,rsp
	sub rsp,32
	cmp rdi,122
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___nextLetter..if_true
	jnz ___nextLetter..if_after
___nextLetter..if_after:
	cmp rdi,90
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___nextLetter..if_true_2
	jnz ___nextLetter..if_after_2
___nextLetter..if_true_2:
	mov rbx,97
	jmp ___nextLetter..nextLetter.exit
___nextLetter..if_after_2:
	cmp rdi,57
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___nextLetter..if_true_3
	jnz ___nextLetter..if_after_3
___nextLetter..if_after_3:
	mov rbx,rdi
	add rbx,1
	jmp ___nextLetter..nextLetter.exit
___nextLetter..if_true_3:
	mov rbx,65
	jmp ___nextLetter..nextLetter.exit
___nextLetter..if_true:
	mov rbx,-1
	jmp ___nextLetter..nextLetter.exit
___nextLetter..nextLetter.exit:
	mov rax,rbx
	leave
	ret

___nextText:
___nextText..nextText.entry:
	push rbp
	mov rbp,rsp
	sub rsp,48
	mov r14,0
	mov rbx,rsi
	sub rbx,1
	mov r14,rbx
	jmp ___nextText..for_cond
___nextText..for_cond:
	cmp r14,0
	mov rbx,0
	setge bl
	cmp bl,1
	jz ___nextText..for_loop
	jnz ___nextText..for_after
___nextText..for_after:
	mov rbx,0
	jmp ___nextText..nextText.exit
___nextText..for_loop:
	mov rbx,r14
	imul rbx,8
	add rbx,rdi
	mov rbx,qword [rbx+8]
	mov qword [rsp],rbx
	mov qword [rsp+24],rdi
	mov qword [rsp+32],rsi
	mov rdi,rbx
	call ___nextLetter
	mov rsi,qword [rsp+32]
	mov rdi,qword [rsp+24]
	mov rbx,qword [rsp]
	mov rbx,rax
	mov rcx,r14
	imul rcx,8
	add rcx,rdi
	mov qword [rcx+8],rbx
	mov rcx,r14
	imul rcx,8
	add rcx,rdi
	mov rcx,qword [rcx+8]
	mov rbx,-1
	cmp rcx,rbx
	mov rbx,0
	sete bl
	cmp bl,1
	jz ___nextText..if_true
	jnz ___nextText..if_false
___nextText..if_true:
	mov rbx,r14
	imul rbx,8
	add rbx,rdi
	mov qword [rbx+8],48
	jmp ___nextText..if_after
___nextText..if_after:
	jmp ___nextText..for_step
___nextText..for_step:
	mov rbx,r14
	mov rbx,r14
	sub rbx,1
	mov r14,rbx
	jmp ___nextText..for_cond
___nextText..if_false:
	mov rbx,1
	jmp ___nextText..nextText.exit
___nextText..nextText.exit:
	mov rax,rbx
	leave
	ret

___array_equal:
___array_equal..array_equal.entry:
	push rbp
	mov rbp,rsp
	sub rsp,48
	mov rcx,qword [rdi]
	mov rbx,qword [rsi]
	cmp rcx,rbx
	mov rbx,0
	setne bl
	cmp bl,1
	jz ___array_equal..if_true
	jnz ___array_equal..if_after
___array_equal..if_true:
	mov rbx,0
	jmp ___array_equal..array_equal.exit
___array_equal..if_after:
	mov rcx,0
	mov rcx,0
	jmp ___array_equal..for_cond
___array_equal..for_cond:
	mov rbx,qword [rdi]
	cmp rcx,rbx
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___array_equal..for_loop
	jnz ___array_equal..for_after
___array_equal..for_loop:
	mov r14,rcx
	imul r14,8
	add r14,rdi
	mov r14,qword [r14+8]
	mov rbx,rcx
	imul rbx,8
	add rbx,rsi
	mov rbx,qword [rbx+8]
	cmp r14,rbx
	mov rbx,0
	setne bl
	cmp bl,1
	jz ___array_equal..if_true_2
	jnz ___array_equal..if_after_2
___array_equal..if_after_2:
	jmp ___array_equal..for_step
___array_equal..for_step:
	mov rbx,rcx
	add rcx,1
	jmp ___array_equal..for_cond
___array_equal..if_true_2:
	mov rbx,0
	jmp ___array_equal..array_equal.exit
___array_equal..for_after:
	mov rbx,1
	jmp ___array_equal..array_equal.exit
___array_equal..array_equal.exit:
	mov rax,rbx
	leave
	ret

___crackSHA1:
___crackSHA1..crackSHA1.entry:
	push rbp
	mov rbp,rsp
	sub rsp,112
	mov rdx,___string
	mov rcx,___string_3
	mov r9,qword [___inputBuffer]
	mov r13,___string_4
	mov r12,48
	mov qword [rsp+24],rcx
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rdi,r12
	call malloc
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov rcx,qword [rsp+24]
	mov r12,rax
	mov qword [r12],5
	mov rbx,qword [rdi]
	cmp rbx,40
	mov rbx,0
	setne bl
	cmp bl,1
	jz ___crackSHA1..if_true
	jnz ___crackSHA1..if_after
___crackSHA1..if_after:
	mov rsi,0
	mov rsi,0
	jmp ___crackSHA1..for_cond
___crackSHA1..for_cond:
	cmp rsi,5
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___crackSHA1..for_loop
	jnz ___crackSHA1..for_after
___crackSHA1..for_loop:
	mov rbx,rsi
	imul rbx,8
	add rbx,r12
	mov qword [rbx+8],0
	jmp ___crackSHA1..for_step
___crackSHA1..for_step:
	mov rbx,rsi
	add rsi,1
	jmp ___crackSHA1..for_cond
___crackSHA1..for_after:
	mov rsi,0
	jmp ___crackSHA1..for_cond_2
___crackSHA1..for_cond_2:
	cmp rsi,40
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___crackSHA1..for_loop_2
	jnz ___crackSHA1..for_after_2
___crackSHA1..for_loop_2:
	mov rax,rsi
	mov r11,rdx
	cqo
	mov r10,8
	idiv r10
	mov rdx,r11
	mov r14,rax
	mov r8,r14
	imul r8,8
	add r8,r12
	mov r8,qword [r8+8]
	mov rbx,rsi
	add rbx,3
	mov qword [rsp+24],rcx
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rdx,rbx
	mov rsi,qword [rsp+88]
	mov rdi,qword [rsp+56]
	call _Z15stringSubStringPcii
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov rcx,qword [rsp+24]
	mov rbx,rax
	mov qword [rsp+16],rbx
	mov qword [rsp+24],rcx
	mov qword [rsp+32],r14
	mov qword [rsp+40],r13
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rdi,rbx
	call ___hex2int
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov r13,qword [rsp+40]
	mov r14,qword [rsp+32]
	mov rcx,qword [rsp+24]
	mov rbx,qword [rsp+16]
	mov rbx,rax
	mov rax,rsi
	mov r11,rdx
	cqo
	mov r10,4
	idiv r10
	mov rdx,r11
	mov r10,rax
	mov qword [rsp+8],r10
	mov r10,qword [rsp+8]
	mov rax,r10
	mov r11,rdx
	cqo
	mov r10,2
	idiv r10
	mov r10,rdx
	mov qword [rsp],r10
	mov rdx,r11
	mov rcx,1
	mov r10,qword [rsp]
	sub rcx,r10
	imul rcx,16
	mov r11,rcx
	mov rax,rbx
	sal rax,cl
	mov rbx,rax
	mov rcx,r11
	or r8,rbx
	mov rax,rsi
	mov r11,rdx
	cqo
	mov r10,8
	idiv r10
	mov rdx,r11
	mov r15,rax
	mov rbx,r15
	imul rbx,8
	add rbx,r12
	mov qword [rbx+8],r8
	jmp ___crackSHA1..for_step_2
___crackSHA1..for_step_2:
	add rsi,4
	jmp ___crackSHA1..for_cond_2
___crackSHA1..for_after_2:
	mov r14,4
	mov rcx,0
	mov rcx,1
	jmp ___crackSHA1..for_cond_3
___crackSHA1..for_cond_3:
	cmp rcx,r14
	mov rbx,0
	setle bl
	cmp bl,1
	jz ___crackSHA1..for_loop_3
	jnz ___crackSHA1..for_after_3
___crackSHA1..for_after_3:
	mov qword [rsp+24],rcx
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rdi,r13
	call _Z7printlnPc
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov rcx,qword [rsp+24]
	jmp ___crackSHA1..crackSHA1.exit
___crackSHA1..for_loop_3:
	mov rsi,0
	jmp ___crackSHA1..for_cond_4
___crackSHA1..for_cond_4:
	cmp rsi,rcx
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___crackSHA1..for_loop_4
	jnz ___crackSHA1..for_after_4
___crackSHA1..for_loop_4:
	mov rbx,rsi
	imul rbx,8
	add rbx,r9
	mov qword [rbx+8],48
	jmp ___crackSHA1..for_step_3
___crackSHA1..for_step_3:
	mov rbx,rsi
	add rsi,1
	jmp ___crackSHA1..for_cond_4
___crackSHA1..for_after_4:
	jmp ___crackSHA1..while_cond
___crackSHA1..while_cond:
	jmp ___crackSHA1..while_loop
___crackSHA1..while_loop:
	mov qword [rsp+16],rbx
	mov qword [rsp+24],rcx
	mov qword [rsp+32],r14
	mov qword [rsp+40],r13
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+64],r15
	mov qword [rsp+72],r12
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rsi,qword [rsp+24]
	mov rdi,qword [rsp+48]
	call ___sha1
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov r12,qword [rsp+72]
	mov r15,qword [rsp+64]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov r13,qword [rsp+40]
	mov r14,qword [rsp+32]
	mov rcx,qword [rsp+24]
	mov rbx,qword [rsp+16]
	mov rbx,rax
	mov qword [rsp+16],rbx
	mov qword [rsp+24],rcx
	mov qword [rsp+32],r14
	mov qword [rsp+56],rdi
	mov qword [rsp+88],rsi
	mov rsi,r12
	mov rdi,rbx
	call ___array_equal
	mov rsi,qword [rsp+88]
	mov rdi,qword [rsp+56]
	mov r14,qword [rsp+32]
	mov rcx,qword [rsp+24]
	mov rbx,qword [rsp+16]
	mov rbx,rax
	cmp bl,1
	jz ___crackSHA1..if_true_2
	jnz ___crackSHA1..if_after_2
___crackSHA1..if_after_2:
	mov qword [rsp+16],rbx
	mov qword [rsp+24],rcx
	mov qword [rsp+32],r14
	mov qword [rsp+56],rdi
	mov qword [rsp+88],rsi
	mov rsi,qword [rsp+24]
	mov qword [rsp+48],r9
	mov rdi,qword [rsp+48]
	call ___nextText
	mov rsi,qword [rsp+88]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov r14,qword [rsp+32]
	mov rcx,qword [rsp+24]
	mov rbx,qword [rsp+16]
	mov rbx,rax
	xor rbx,1
	cmp bl,1
	jz ___crackSHA1..if_true_3
	jnz ___crackSHA1..if_after_3
___crackSHA1..if_after_3:
	jmp ___crackSHA1..while_cond
___crackSHA1..if_true_3:
	jmp ___crackSHA1..while_after
___crackSHA1..while_after:
	jmp ___crackSHA1..for_step_4
___crackSHA1..for_step_4:
	mov rbx,rcx
	add rcx,1
	jmp ___crackSHA1..for_cond_3
___crackSHA1..if_true_2:
	mov rsi,0
	jmp ___crackSHA1..for_cond_5
___crackSHA1..for_cond_5:
	cmp rsi,rcx
	mov rbx,0
	setl bl
	cmp bl,1
	jz ___crackSHA1..for_loop_5
	jnz ___crackSHA1..for_after_5
___crackSHA1..for_after_5:
	mov qword [rsp+24],rcx
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rdi,qword [rsp+96]
	call _Z7printlnPc
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov rcx,qword [rsp+24]
	jmp ___crackSHA1..crackSHA1.exit
___crackSHA1..for_loop_5:
	mov rbx,rsi
	imul rbx,8
	add rbx,r9
	mov rbx,qword [rbx+8]
	mov qword [rsp+16],rbx
	mov qword [rsp+24],rcx
	mov qword [rsp+32],r14
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rdi,rbx
	call ___int2chr
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov r14,qword [rsp+32]
	mov rcx,qword [rsp+24]
	mov rbx,qword [rsp+16]
	mov rbx,rax
	mov qword [rsp+24],rcx
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rdi,rbx
	call _Z5printPc
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov rcx,qword [rsp+24]
	jmp ___crackSHA1..for_step_5
___crackSHA1..for_step_5:
	mov rbx,rsi
	add rsi,1
	jmp ___crackSHA1..for_cond_5
___crackSHA1..if_true:
	mov qword [rsp+24],rcx
	mov qword [rsp+48],r9
	mov qword [rsp+56],rdi
	mov qword [rsp+80],r8
	mov qword [rsp+88],rsi
	mov qword [rsp+96],rdx
	mov rdi,qword [rsp+24]
	call _Z7printlnPc
	mov rdx,qword [rsp+96]
	mov rsi,qword [rsp+88]
	mov r8,qword [rsp+80]
	mov rdi,qword [rsp+56]
	mov r9,qword [rsp+48]
	mov rcx,qword [rsp+24]
	jmp ___crackSHA1..crackSHA1.exit
___crackSHA1..crackSHA1.exit:
	leave
	ret

main:
main..main.entry:
	push rbp
	mov rbp,rsp
	sub rsp,32
	mov qword [rsp],rbx
	mov qword [rsp+8],rcx
	mov qword [rsp+16],rdi
	mov qword [rsp+24],rsi
	call ____init
	mov rsi,qword [rsp+24]
	mov rdi,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,qword [rsp]
	mov rcx,0
	mov rbx,0
	jmp main..while_cond
main..while_cond:
	jmp main..while_loop
main..while_loop:
	mov qword [rsp+8],rcx
	mov qword [rsp+16],rdi
	mov qword [rsp+24],rsi
	call _Z6getIntv
	mov rsi,qword [rsp+24]
	mov rdi,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rcx,rax
	cmp rcx,0
	mov rbx,0
	sete bl
	cmp bl,1
	jz main..if_true
	jnz main..if_after
main..if_after:
	cmp rcx,1
	mov rbx,0
	sete bl
	cmp bl,1
	jz main..if_true_2
	jnz main..if_false
main..if_false:
	cmp rcx,2
	mov rbx,0
	sete bl
	cmp bl,1
	jz main..if_true_3
	jnz main..if_after_2
main..if_true_3:
	mov qword [rsp+8],rcx
	mov qword [rsp+16],rdi
	mov qword [rsp+24],rsi
	call _Z9getStringv
	mov rsi,qword [rsp+24]
	mov rdi,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,rax
	mov qword [rsp],rbx
	mov qword [rsp+8],rcx
	mov qword [rsp+16],rdi
	mov qword [rsp+24],rsi
	mov rdi,rbx
	call ___crackSHA1
	mov rsi,qword [rsp+24]
	mov rdi,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,qword [rsp]
	mov rbx,rax
	jmp main..if_after_2
main..if_after_2:
	jmp main..if_after_3
main..if_true_2:
	mov qword [rsp+8],rcx
	mov qword [rsp+16],rdi
	mov qword [rsp+24],rsi
	call _Z9getStringv
	mov rsi,qword [rsp+24]
	mov rdi,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,rax
	mov qword [rsp],rbx
	mov qword [rsp+8],rcx
	mov qword [rsp+16],rdi
	mov qword [rsp+24],rsi
	mov rdi,rbx
	call ___computeSHA1
	mov rsi,qword [rsp+24]
	mov rdi,qword [rsp+16]
	mov rcx,qword [rsp+8]
	mov rbx,qword [rsp]
	mov rbx,rax
	jmp main..if_after_3
main..if_after_3:
	jmp main..while_cond
main..if_true:
	jmp main..while_after
main..while_after:
	mov rax,0
	leave
	ret

____init:
____init.._init.entry:
	push rbp
	mov rbp,rsp
	sub rsp,64
	mov rcx,qword [___MAXCHUNK]
	mov rbx,qword [___outputBuffer]
	mov r13,qword [___asciiTable]
	mov r14,qword [___chunks]
	mov rdi,qword [___inputBuffer]
	mov r9,qword [___MAXLENGTH]
	mov r13,___string_5
	mov rcx,100
	mov rbx,rcx
	sub rbx,1
	imul rbx,64
	sub rbx,16
	mov r9,rbx
	mov r15,rcx
	imul r15,8
	add r15,8
	mov qword [rsp+8],rcx
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+56],rsi
	mov rdi,r15
	call malloc
	mov rsi,qword [rsp+56]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov rcx,qword [rsp+8]
	mov r15,rax
	mov qword [r15],rcx
	mov r14,0
	jmp ____init..for_cond
____init..for_cond:
	cmp r14,rcx
	mov rbx,0
	setl bl
	cmp bl,1
	jz ____init..for_loop
	jnz ____init..for_after
____init..for_after:
	mov r14,r15
	mov rbx,r9
	imul rbx,8
	add rbx,8
	mov qword [rsp+8],rcx
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+56],rsi
	mov rdi,rbx
	call malloc
	mov rsi,qword [rsp+56]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov rcx,qword [rsp+8]
	mov rbx,rax
	mov qword [rbx],r9
	mov rdi,rbx
	mov rbx,48
	mov qword [rsp+8],rcx
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+56],rsi
	mov rdi,rbx
	call malloc
	mov rsi,qword [rsp+56]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov rcx,qword [rsp+8]
	mov rbx,rax
	mov qword [rbx],5
	mov qword [___MAXCHUNK],rcx
	mov qword [___outputBuffer],rbx
	mov qword [___asciiTable],r13
	mov qword [___chunks],r14
	mov qword [___inputBuffer],rdi
	mov qword [___MAXLENGTH],r9
	leave
	ret
____init..for_loop:
	mov rdi,648
	mov qword [rsp+8],rcx
	mov qword [rsp+32],r9
	mov qword [rsp+40],rdi
	mov qword [rsp+56],rsi
	mov rdi,rdi
	call malloc
	mov rsi,qword [rsp+56]
	mov rdi,qword [rsp+40]
	mov r9,qword [rsp+32]
	mov rcx,qword [rsp+8]
	mov rdi,rax
	mov qword [rdi],80
	mov rbx,r14
	imul rbx,8
	add rbx,r15
	mov qword [rbx+8],rdi
	jmp ____init..for_step
____init..for_step:
	add r14,1
	jmp ____init..for_cond

section .data
___string_5:
	db 95,0,0,0,0,0,0,0,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,0
___string:
	db 0,0,0,0,0,0,0,0,0
___string_2:
	db 18,0,0,0,0,0,0,0,110,67,104,117,110,107,32,62,32,77,65,88,67,72,85,78,75,33,0
___string_3:
	db 13,0,0,0,0,0,0,0,73,110,118,97,108,105,100,32,105,110,112,117,116,0
___string_4:
	db 10,0,0,0,0,0,0,0,78,111,116,32,70,111,117,110,100,33,0

section .bss
___asciiTable:
	resb 64
___MAXCHUNK:
	resb 64
___MAXLENGTH:
	resb 64
___chunks:
	resb 64
___inputBuffer:
	resb 64
___outputBuffer:
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


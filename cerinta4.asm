.data
	matrix: .space 10000
	n: .space 4
	m: .space 4
	instruct: .space 500
	i: .long 0
	j: .long 0
	contor: .long 0
	len: .long 0
	p: .long 0
	fscan: .asciz "%[^\n]s"
	fprintd: .asciz "%d "
	fprints: .asciz "%s"
	delim: .asciz " "
	newLine: .asciz "\n"

.text

.global main

main:
	pushl $instruct
	pushl $fscan
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $instruct
	call strtok
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, p
	
	pushl %eax
	call atoi
	popl %ebx
	
	movl %eax, n
	movl p, %eax

	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, p
	
	pushl %eax
	call atoi
	popl %ebx
	
	movl %eax, m
	
	movl m, %eax
	movl n, %ebx
	mull %ebx
	movl %eax, len
	movl p, %eax
	movl len, %ebx
	
	
citire:
	cmp %ebx, contor
	je cont
	
	pushl $delim
	pushl $0
	call strtok
	popl %edx
	popl %edx
	movl %eax, p
	
	pushl %eax
	call atoi
	popl %edx
	
	movl contor, %ecx
	lea matrix, %edi
	movl %eax, (%edi, %ecx, 4)
	movl p, %eax
	incl contor
	
	jmp citire
	
cont:
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %edx
	popl %edx
	movl %eax, p

	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %edx
	popl %edx
	movl %eax, p
	
	movl p, %edi
	xorl %eax, %eax
	movl $1, %ecx
	movb (%edi, %ecx, 1), %al
	
	cmp $0, %al
	je operatie

	movl n, %ebx
	subl $1, %ebx
	movl %ebx, i
	movl $0, j	
	jne afisareROT



operatie:
	pushl n
	pushl $fprintd
	call printf
	popl %ebx
	popl %ebx
	
	pushl m
	pushl $fprintd
	call printf
	popl %ebx
	popl %ebx

	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %edx
	popl %edx
	movl %eax, p

	pushl p
	call atoi
	popl %ebx
	pushl %eax
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %edx
	popl %edx
	movl %eax, p

	movl p, %edi
	xorl %eax, %eax
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	movl len, %ebx
	movl %ebx, contor
	subl $1, contor
	
	cmp $97, %al
	je add_
	cmp $115, %al
	je sub_
	cmp $109, %al
	je mul_
	jmp div_
	
sub_:
	popl %ebx
	not %ebx
	incl %ebx
	pushl %ebx
add_:
	cmp $-1, contor
	je i_afisare
	
	lea matrix, %edi
	movl contor, %ecx
	xorl %ebx, %ebx
	movl (%edi, %ecx, 4), %ebx
	popl %eax
	addl %eax, %ebx
	movl %ebx, (%edi, %ecx, 4)
	pushl %eax
	
	subl $1, contor
	jmp add_
mul_:
	cmp $-1, contor
	je i_afisare
	
	lea matrix, %edi
	movl contor, %ecx
	xorl %ebx, %ebx
	movl (%edi, %ecx, 4), %ebx
	popl %eax
	pushl %eax
	mull %ebx
	movl %eax, (%edi, %ecx, 4)
	
	subl $1, contor
	jmp mul_
div_:
	cmp $-1, contor
	je i_afisare
	
	lea matrix, %edi
	movl contor, %ecx
	xorl %ebx, %ebx
	movl (%edi, %ecx, 4), %ebx
	movl %ebx, %eax
	
	cmp $0, %eax
	jge div_1
	jmp div_2
cont_div:
	subl $1, contor
	jmp div_
div_1:
	popl %ebx
	pushl %ebx
	
	cmp $0, %ebx
	jge div_1a
	jmp div_1b
div_1a:
	xorl %edx, %edx
	divl %ebx
	movl %eax, (%edi, %ecx, 4)
	jmp cont_div
div_1b:
	not %ebx
	incl %ebx
	xorl %edx, %edx
	divl %ebx
	not %eax
	incl %eax
	movl %eax, (%edi, %ecx, 4)
	jmp cont_div	
div_2:
	not %eax
	incl %eax
	popl %ebx
	pushl %ebx

	cmp $0, %ebx
	jge div_2a
	jmp div_2b
div_2a:
	xorl %edx, %edx
	divl %ebx
	not %eax
	incl %eax
	movl %eax, (%edi, %ecx, 4)
	jmp cont_div
div_2b:
	not %ebx
	incl %ebx
	xorl %edx, %edx
	divl %ebx
	movl %eax, (%edi, %ecx, 4)
	jmp cont_div
	
	
	

i_afisare:
	movl n, %edx
	cmp %edx, i
	je exit
j_afisare:
	movl m, %edx
	cmp %edx, j
	je i_cont
	
	xorl %eax, %eax
	movl m, %eax
	movl i, %edx
	mull %edx
	addl j, %eax
	
	lea matrix, %edi
	movl (%edi, %eax, 4), %ebx
	pushl %ebx
	pushl $fprintd
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	incl j
	jmp j_afisare
i_cont:
	incl i
	movl $0, j
	jmp i_afisare	
	
afisareROT:
	pushl m
	pushl $fprintd
	call printf
	popl %ebx
	popl %ebx	
	pushl n
	pushl $fprintd
	call printf
	popl %ebx
	popl %ebx
j_afisareROT:
	movl m, %edx
	cmp %edx, j
	je exit
i_afisareROT:
	cmp $-1, i
	je j_contROT
	
	movl m, %eax
	movl i, %edx
	mull %edx
	addl j, %eax
	
	lea matrix, %edi
	movl (%edi, %eax, 4), %ebx
	pushl %ebx
	pushl $fprintd
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	subl $1, i
	jmp i_afisareROT
j_contROT:
	incl j
	movl n, %ebx
	subl $1, %ebx
	movl %ebx, i
	jmp j_afisareROT	



exit:
	pushl $newLine
	pushl $fprints
	call printf
	popl %ebx
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

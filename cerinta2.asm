.data
	fprint: .asciz "%d\n"
	fscan: .asciz "%[^\n]s"
	cod: .space 250
	delim: .asciz " "
	p: .space 4
	num: .long 0
	
.text

.global main

main:
	pushl $cod
	pushl $fscan
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $cod
	call strtok
	popl %ebx
	popl %ebx
	
	xorl %ecx, %ecx
	movl %eax, p
	pushl %eax
	call atoi
	popl %ebx
	pushl %eax
	movl p, %eax

for:
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je exit
	
	movl %eax, p
	pushl p
	call atoi
	popl %ebx
	movl %eax, num
	movl p, %eax		
	
	cmp $0, num
	je op
	jne nr
nr:
	pushl num
	jmp for
op:
	popl %ebx
	popl %edx
	movl p, %edi
	movb (%edi, %ecx, 1), %al
	cmp $97, %al
	je add_
	cmp $115, %al
	je sub_
	cmp $109, %al
	je mul_
	jmp div_
	


add_:
	addl %ebx, %edx
	pushl %edx
	jmp for
sub_:
	subl %ebx, %edx
	pushl %edx
	jmp for
mul_:
	movl %edx, %eax
	mull %ebx
	pushl %eax
	movl p, %eax
	jmp for
div_:
	movl %edx, %eax
	xorl %edx, %edx
	divl %ebx
	pushl %eax
	movl p, %eax
	jmp for


exit:
	popl num
	pushl num
	pushl $fprint
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80

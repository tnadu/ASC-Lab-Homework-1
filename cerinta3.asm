.data
	fprint: .asciz "%d\n"
	fscan: .asciz "%[^\n]s"
	cod: .space 250
	delim: .asciz " "
	p: .space 4
	num: .long 0
	second: .byte 0
	a: .long -1
	b: .long -1
	c: .long -1
	d: .long -1
	e: .long -1
	f: .long -1
	g: .long -1
	h: .long -1
	i: .long -1
	j: .long -1
	k: .long -1
	l: .long -1
	m: .long -1
	n: .long -1
	o: .long -1
	p1: .long -1
	q: .long -1
	r: .long -1
	s: .long -1
	t: .long -1
	u: .long -1
	v: .long -1
	w: .long -1
	x: .long -1
	y: .long -1
	z: .long -1
	
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
	
	cmp $0, %eax
	jne nr
	movl p, %eax
	jmp opVar


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
	
	cmp $0, %eax
	jne nr
	jmp opVar

nr:
	pushl %eax
	movl p, %eax
	jmp for
opVar:
	movl p, %eax
	movl %eax, %edi
	xorl %eax, %eax
	xorl %ecx, %ecx
	incl %ecx
	movb (%edi, %ecx, 1), %al
	xorl %ecx, %ecx
	cmp $0, %al
	je var
	jmp op



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




var:
	movb (%edi, %ecx, 1), %al
	cmp $97, %al
	je a1
	cmp $98, %al
	je b1
	cmp $99, %al
	je c1
	cmp $100, %al
	je d1
	cmp $101, %al
	je e1
	cmp $102, %al
	je f1
	cmp $103, %al
	je g1
	cmp $104, %al
	je h1
	cmp $105, %al
	je i1
	cmp $106, %al
	je j1
	cmp $107, %al
	je k1
	cmp $108, %al
	je l1
	cmp $109, %al
	je m1
	cmp $110, %al
	je n1
	cmp $111, %al
	je o1
	cmp $112, %al
	je p11
	cmp $113, %al
	je q1
	cmp $114, %al
	je r1
	cmp $115, %al
	je s1
	cmp $116, %al
	je t1
	cmp $117, %al
	je u1
	cmp $118, %al
	je v1
	cmp $119, %al
	je w1
	cmp $120, %al
	je x1
	cmp $121, %al
	je y1
	cmp $122, %al
	je z1
a1:
	cmp $-1, a
	je aAssign
	jne a_

aAssign:
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
	movl %eax, a
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
a_:
	pushl a	
	jmp for
b1:
	cmp $-1, b
	je bAssign
	jne b_

bAssign:
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
	movl %eax, b
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
b_:
	pushl b	
	jmp for
c1:
	cmp $-1, c
	je cAssign
	jne c_

cAssign:
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
	movl %eax, c
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
c_:
	pushl c
	jmp for
d1:
	cmp $-1, d
	je dAssign
	jne d_

dAssign:
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
	movl %eax, d
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
d_:
	pushl d
	jmp for
e1:
	cmp $-1, e
	je eAssign
	jne e_

eAssign:
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
	movl %eax, e
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
e_:
	pushl e
	jmp for
f1:
	cmp $-1, f
	je fAssign
	jne f_

fAssign:
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
	movl %eax, f
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
f_:
	pushl f
	jmp for
g1:
	cmp $-1, g
	je gAssign
	jne g_

gAssign:
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
	movl %eax, g
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
g_:
	pushl g
	jmp for
h1:
	cmp $-1, h
	je hAssign
	jne h_

hAssign:
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
	movl %eax, h
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
h_:
	pushl h
	jmp for
i1:
	cmp $-1, i
	je iAssign
	jne i_

iAssign:
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
	movl %eax, i
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
i_:
	pushl i
	jmp for
j1:
	cmp $-1, j
	je jAssign
	jne j_

jAssign:
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
	movl %eax, j
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
j_:
	pushl j
	jmp for
k1:
	cmp $-1, k
	je kAssign
	jne k_

kAssign:
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
	movl %eax, k
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
k_:
	pushl k
	jmp for
l1:
	cmp $-1, l
	je lAssign
	jne l_

lAssign:
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
	movl %eax, l
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
l_:
	pushl l	
	jmp for
m1:
	cmp $-1, m
	je mAssign
	jne m_

mAssign:
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
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
m_:
	pushl m
	jmp for
n1:
	cmp $-1, n
	je nAssign
	jne n_

nAssign:
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
	movl %eax, n
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
n_:
	pushl n
	jmp for
o1:
	cmp $-1, o
	je oAssign
	jne o_

oAssign:
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
	movl %eax, o
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
o_:
	pushl o
	jmp for
p11:
	cmp $-1, p1
	je p1Assign
	jne p1_

p1Assign:
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
	movl %eax, p1
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
p1_:
	pushl p1
	jmp for
q1:
	cmp $-1, q
	je qAssign
	jne q_

qAssign:
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
	movl %eax, q
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
q_:
	pushl q
	jmp for
r1:
	cmp $-1, r
	je rAssign
	jne r_

rAssign:
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
	movl %eax, r
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
r_:
	pushl r
	jmp for
s1:
	cmp $-1, s
	je sAssign
	jne s_

sAssign:
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
	movl %eax, s
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
s_:
	pushl s
	jmp for
t1:
	cmp $-1, t
	je tAssign
	jne t_

tAssign:
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
	movl %eax, t
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
t_:
	pushl t
	jmp for
u1:
	cmp $-1, u
	je uAssign
	jne u_

uAssign:
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
	movl %eax, u
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
u_:
	pushl u
	jmp for
v1:
	cmp $-1, v
	je vAssign
	jne v_

vAssign:
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
	movl %eax, v
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
v_:
	pushl v
	jmp for
w1:
	cmp $-1, w
	je wAssign
	jne w_

wAssign:
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
	movl %eax, w
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
w_:
	pushl w
	jmp for
x1:
	cmp $-1, x
	je xAssign
	jne x_

xAssign:
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
	movl %eax, x
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
x_:
	pushl x	
	jmp for
y1:
	cmp $-1, y
	je yAssign
	jne y_

yAssign:
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
	movl %eax, y
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
y_:
	pushl y
	jmp for
z1:
	cmp $-1, z
	je zAssign
	jne z_

zAssign:
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
	movl %eax, z
	
	movl p, %eax
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	movl %eax, p
	jmp for
z_:
	pushl z
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

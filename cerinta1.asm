.data
	input: .space 401
	output: .space 401
	formatIN: .asciz "%s"
	formatOUT: .asciz "%s\n"
	boool: .long 1
	i: .long 0
	tip: .long 0
	lng: .long 0
	numarCurent: .long 0
	numarASCII: .long 0
	neg: .asciz "-"
	spatiu: .asciz " "
 	Let: .asciz "let"
 	Add: .asciz "add"
 	Sub: .asciz "sub"
 	Mul: .asciz "mul"
 	Div: .asciz "div"
	
.text

.global main

main:
	push $input  				
	push $formatIN
	call scanf
	popl %ebx
	popl %ebx
	
	movl $input, %edi			
	movl $output, %esi
	movl $0, %ecx				

for:
	movb (%edi, %ecx, 1), %al		
	cmp $0, %al
	je exit
	
	cmp $0, boool
	movb $0, boool			
	je spatiu_			
cont_spatiu:	
	cmp $56, %al			
	je convDec
	cmp $57, %al			
	je convDec
	cmp $65, %al			
	je convDec
	jmp op
cont:
	popl %ecx
	incl %ecx
	jmp for
spatiu_:
	pushl %eax
	pushl %ecx
	pushl $spatiu
	pushl %esi

	call strcat	
	
	popl %ebx
	popl %ebx
	popl %ecx
	popl %eax
	jmp cont_spatiu




convDec:                                 	
	incl %ecx
	movl %eax, tip 
	movl $0, %eax				
	movb (%edi, %ecx, 1), %al
	jmp comp
contConvDec1:
	movb $1, boool	
	movl $16, %ebx
	mul %ebx
	movl %eax, numarCurent
	incl %ecx
	movl $0, %eax
	movb (%edi, %ecx, 1), %al
	jmp comp
contConvDec2:
	movb $0, boool	
	addl %eax, numarCurent
	movl numarCurent, %eax
	pushl %ecx
	movl tip, %ebx
	cmp $57, %ebx
	je Neg				
	cmp $56, %ebx
	je zero_		        
	jmp catVar
comp:						
	cmp $48, %eax
	je cif0
	cmp $49, %eax
	je cif1
	cmp $50, %eax
	je cif2
	cmp $51, %eax
	je cif3
	cmp $52, %eax
	je cif4
	cmp $53, %eax
	je cif5
	cmp $54, %eax
	je cif6
	cmp $55, %eax
	je cif7
	cmp $56, %eax
	je cif8
	cmp $57, %eax
	je cif9
	cmp $65, %eax
	je cif10
	cmp $66, %eax
	je cif11
	cmp $67, %eax
	je cif12
	cmp $68, %eax
	je cif13
	cmp $69, %eax
	je cif14
	cmp $70, %eax
	je cif15	
cif0:						
	movl $0, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif1:
	movl $1, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif2:
	movl $2, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif3:
	movl $3, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif4:
	movl $4, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif5:
	movl $5, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif6:
	movl $6, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif7:
	movl $7, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif8:
	movl $8, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif9:
	movl $9, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif10:
	movl $10, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif11:
	movl $11, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif12:
	movl $12, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif13:
	movl $13, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif14:
	movl $14, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2
cif15:
	movl $15, %eax
	cmp $0, boool
	je contConvDec1
	jne contConvDec2




zero_:
	cmp $0, %eax
	je zero0
	movl $10, %ebx
	xorl %edx, %edx
	jmp lungime
zero0:
	movl $48, numarCurent
	pushl $numarCurent
	pushl %esi
	call strcat
	popl %ebx
	popl %ebx
	jmp cont
Neg:
	pushl %eax
	pushl $neg
	pushl %esi
	
	call strcat
	
	popl %ebx
	popl %ebx
	popl %eax
	jmp zero_
lungime: 
	cmp $0, %eax
	jle putere1
	
	divl %ebx
	xorl %edx, %edx
	incl lng
	
	jmp lungime
putere1:
	pushl lng
	movl $1, %eax
putere2:
	cmp $0, lng
	je putere3
	
	mull %ebx
	subl $1, lng
	
	jmp putere2
putere3:
	popl lng
	divl %ebx
	movl %eax, tip
	movl numarCurent, %eax
catNR:
	cmp $0, lng
	je cont
		
	xorl %edx, %edx
	movl tip, %ebx
	divl %ebx
	addl $48, %eax
	movl %eax, numarCurent

	pushl %edx
	movl tip, %eax
	movl $10, %ebx
	xorl %edx, %edx
	divl %ebx
	movl %eax, tip
	popl %eax
	subl $1, lng

	pushl %eax
	pushl $numarCurent
	pushl %esi
	call strcat
	popl %ebx
	popl %ebx
	popl %eax
	
	jmp catNR




catVar:
	pushl $numarCurent
	pushl %esi
	call strcat
	popl %ebx
	popl %ebx
	movl $0, %eax
	jmp cont


op:
	add $2, %ecx
	xorl %eax, %eax
	movb (%edi, %ecx, 1), %al
	pushl %ecx
	
	cmp $48, %al
	je let_
	cmp $49, %al
	je add_
	cmp $50, %al
	je sub_
	cmp $51, %al
	je mul_
	cmp $52, %al
	je div_	
let_:
	pushl $Let
	pushl %esi
	call strcat
	popl %ebx
	popl %ebx
	movl $0, %eax
	jmp cont
add_:
	pushl $Add
	pushl %esi
	call strcat
	popl %ebx
	popl %ebx
	movl $0, %eax
	jmp cont
sub_:
	pushl $Sub
	pushl %esi
	call strcat
	popl %ebx
	popl %ebx
	movl $0, %eax
	jmp cont
mul_:
	pushl $Mul
	pushl %esi
	call strcat
	popl %ebx
	popl %ebx
	movl $0, %eax
	jmp cont
div_:
	pushl $Div
	pushl %esi
	call strcat
	popl %ebx
	popl %ebx
	movl $0, %eax
	jmp cont




exit:
	
	push $output
	push $formatOUT
	call printf
	popl %ebx
	popl %ebx

	pushl $0
	call fflush
	popl %ebx	
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80

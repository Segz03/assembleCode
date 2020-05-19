# ----------------------------------------------------------------------------------------
# Adds numbers 1 to 10 backwards and prints the sum to the console.
# To assemble and run:
#
#     gcc -no-pie power.s && ./a.out
#
# ----------------------------------------------------------------------------------------
	.global main

format:
	.asciz  "%5ld\n"

	.text
main:

	mov     $3, %ecx		# ecx will countdown from 10 to 0
	mov		$5, %rbx		# rbx will hold the value of 5
	mov     $1, %rax		# set rax to 1 (our sum)
dragon:

	imul	%rbx, %rax		# multiply base to sum
	dec		%ecx
	jnz		dragon

	lea format(%rip), %rdi	# set 1st parameter (format)
	mov %rax, %rsi			# set 2nd parameter (current_number)
	xor %eax, %eax			# clear AL

	call	printf			# printf(format, current_number)

	ret

# ----------------------------------------------------------------------------------------
# a C/assembly program that prints out the nth Fibonacci number that a user asks for.
# To assemble and run:
#
#     gcc callfib.c  fib.s && ./a.out
#		
# ----------------------------------------------------------------------------------------
	.global fib

	.text
fib:
	mov		%rdi, %rcx		# Nth digit in Fib
	mov		$1, %r9			# 1st number
	mov     $1, %rax		# set rax to 1 (our sum)

edge:
	
	cmp		$2, %rcx		# if the rcx is less than or equal to 2 jump to cliff(edge case)
	jle		cliff			
	
	sub		$2, %rcx		# if greater than 2 jump to main loop(dragon: where the magic happens)
	jg		dragon


cliff:
	
	mov		$1, %rax		# return value of 1 for both edge cases
	ret	

dragon:
	
	push	%rax			# pushing rax in the stack to be used later
	add		%r9, %rax		# adding both registers to the sum rax held in rax
	pop		%r9		 		# placing the sum in r9 to be added again	
	
	dec		%rcx			# decrement the user input value
	
	jnz		dragon			# if loop is not zero jump to the magical dragon
	ret

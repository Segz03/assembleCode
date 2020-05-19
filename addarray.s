# ----------------------------------------------------------------------------------------
# This program takes an array of numbers then sorts them using bubble sort.
# To assemble and run:
#
#     gcc -no-pie addarray.c addarray.s && ./a.out
#
# ----------------------------------------------------------------------------------------

	.global myarray

	.text
myarray:
	lea	 (%rdi),%r8			# load array from C to register r8
	mov	 %rsi,%r12			# load array size of 5 to register r12
	mov  %r12, %r13			# moves value (5) in register r13
	mov	 $0, %r10			# initialize index  moving 0 to r10			
	sub  $1, %r12			# subtracting 1 to get the appropriate amounts of loops
	mov  %r12, %rcx			# move new value in looping register for amount of passes


bubsort:
	mov  (%r8,%r10,8), %r15	# moves the first element of array in register
	inc  %r10				# increment the index
	mov  (%r8,%r10,8), %r14	# moves the next element of array in reguster

	cmp  %r13, %r10			# comparing index to the size of the array
	je 	 passes				# if the index reaches the end of the array jump to passes
	
	cmp  %r15, %r14			# compares the registers
	jg	 bubsort			# if r15 > r14 jump to the top
	jle	 swap				# if r15 <= r14 jump to swap function

swap:
	push %r15				# push value in stack to save value
	dec  %r10				# decrement the index of the array
	mov  %r14, (%r8,%r10,8)	# moves r14 into r15
	inc  %r10				# increment the index
	pop  (%r8,%r10,8)		# popping the value in the next element of array
	cmp  %r12, %r10			# checking to see if we are at the end of the array
	
	jne	 bubsort			# if not at the end of the array jump back to bubsort
	je 	 passes				# else jump to passes for another loop of the array


passes:
	mov  $0, %r10			# re-initializes the index back to zero
	dec  %r12				# decrement the size of the array so we dont have to compare the last element
	dec  %rcx				# decrementing the looping register representing 1 complete pass
	jnz  bubsort			# if loop not at zero jump to bubsort for another pass
	
	ret 					# else return array


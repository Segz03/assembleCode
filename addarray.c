// ----------------------------------------------------------------------------------------
// Passed an array to the assembly code and prints out the sorted array
// To assemble and run:
//
//     gcc -no-pie addarray.c addarray.s && ./a.out
//
// ----------------------------------------------------------------------------------------

#include <stdio.h>
#include <stdint.h>

//          %rdi    %rsi
int64_t myarray(int64_t [], int);

int main()
{
	int64_t intarray [] = {4,5,1,3,2};
	int arraysize = 5;
	
	// printing out the array before sorted
	printf("Array items before being sorted\n");
	for (int i = 0; i < arraysize; i++) 
	{
		printf("%ld ",intarray[i]);
	}
	printf("\n");

	// calling the method
	myarray(intarray,arraysize);

	// printing out the array after its sorted
	printf("Array items after being sorted\n");
	for (int i = 0; i < arraysize; i++) 
	{
		printf("%ld ",intarray[i]);
	}
	printf("\n");
	return 0;
} // end main



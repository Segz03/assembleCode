// ----------------------------------------------------------------------------------------
// Writes "Hello World" to the console.
// To assemble and run:
//
//     gcc callfib.c  fib.s && ./a.out
//
// ----------------------------------------------------------------------------------------

#include <stdio.h>

int fib(int);

int main() 
{
	int position;
	
	printf("Enter a position in Fibinacci you want to know the power of: ");
	scanf("%d", &position);

	printf("The %d number in Fibinacci is %d\n",position,fib(position));
	return 0;
}


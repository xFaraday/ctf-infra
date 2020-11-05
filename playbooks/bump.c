#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>


int main() {

	char str[50];


	printf("Thank God we could trust you with this new system anon\nits very fragile...");

	printf("\nReport how much cereal you've had today: ");

	gets(str);

	printf("\nYou've had: %s \n", str);

	return(0);
}


#include <stdio.h>

char *msg0 = "Enter a number: ";
char *msg1 = "Looping %d of %d\n";
char *format = "%d";
int num = 0;

int main(void)
{
	int i;

	printf(msg0);
	scanf(format, &num);
	i = 0;
	do
	{
		printf(msg1, i, num);
		i++;
	} while (i < num);
	return (0);
}
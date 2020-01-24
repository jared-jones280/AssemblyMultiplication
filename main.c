/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int lab04b(long long int a);

int main(void)
{
    long long int a = lab04b(6);
    printf("Result of x! = %ld\n", a);
    return 0;
}
//reeeeee

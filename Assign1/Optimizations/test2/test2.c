#include<stdio.h>
int isprime(int n)
{
    for(int i=2;i*i<=n;i++)
    {
        if(n%i == 0)
        {
            return 0;
        }
    }
    return 1;
}
int main()
{
    int a = 25, b = 17;
    if(isprime(a))
    {
        printf("a is prime");
    }
    else
    {
        printf("a is not a prime");
    }
    return 0;
}

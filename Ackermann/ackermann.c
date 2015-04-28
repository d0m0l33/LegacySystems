#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>


int recursion(int m, int n);
int loops(int m, int n);


int main(void)
{

    int numA;
    int numB;
    int option;
    int soln; /* ackermann value */
    int quit;
    clock_t time;

    quit = 1;

    printf("\n\n Welcome to the Ackermans function\n\n");

    while(quit == 1)
    {

		printf("\n enter first integer : \n");
		scanf("%d",&numA);
		printf("\n enter second integer : \n");
		scanf("%d",&numB);

		printf("\n Enter 1 for recursion, 2 for iteration with loops \n");
		scanf("%d",&option);

		if(option == 1)
		{
			printf("\n - recursion -\n");
			time = clock();
			soln = recursion(numA,numB);
			time = clock() - time;
			printf("\n\n Ackermanns value via Recursion = %d\n\n", soln);
			double time_taken = (((double)time)/CLOCKS_PER_SEC) * 1000; /* in milli seconds */
			printf("time elapsed :  %.5f milli seconds. \n", time_taken);
		}
		else
		{
			printf("\n - iteration -\n");
			time = clock();
			soln = loops(numA,numB);
			time = clock() - time;
			printf("\n\n Ackermanns value via Iteration = %d\n\n", soln);
			double time_taken = (((double)time)/CLOCKS_PER_SEC) * 1000; /* in milli seconds */
			printf("time elapsed :  %.5f milli seconds. \n", time_taken);
		}
		printf("\n Choose 1 to continue, 0 to quit \n");
		scanf("%d",&quit);

    }
    printf("\n Exiting .. \n");
}

int recursion(int m, int n)
{
    int result;
    int sub;

    sub = 0;

	if(n >= 0 && m == 0)
	{
		n++;
		result = n;
	}

	if(m > 0 && n == 0)
		result = recursion(m - 1,1);

	if(m > 0 && n > 0)
	{
    	sub = recursion(m,n-1);
    	result = recursion(m-1,sub);
	}
    return result;
}


int loops(int m, int n)
{

    int t,d; /* stack indexes */
	int tsize;

	tsize = 70764; /* stack size/limit */

	int stack[tsize + 1];

	d = 1;

	stack[0] = m;
	stack[1] = n;
	t = 1;

	while(t != 0) /* while stack not empty */
	{
	  if( stack[t - 1] == 0 )
	  {
		 m = 0;
		 t = t - 1;
		 stack[t] = stack[t + 1] + 1;
	  }
	  else
	  if (stack[t] == 0)
	  {
		 n = 0;
		 stack[t] = 1;
		 stack[t - 1] = stack[t - 1] - 1;
	  }
	  else
	  {
		 stack[t + 1] = stack[t] - 1;
		 stack[t] = stack[t - 1];
		 stack[t - 1] = stack[t - 1] - 1;
		 t = t + 1;
	  }
	  if(t > d)  /* stack size is exceeded */
	  {
		 d = t;
		 if(d > tsize)
			printf( "failure, not enough memory");
	  }
	}
	return stack[0];
}

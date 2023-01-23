#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#define N 100000
int main()
{
        int i,j;
        int count,flag;
        double exe_time;
        struct timeval stop_time,start_time;

        count = 1;
        gettimeofday(&start_time,NULL);
        for(i=3;i<N;i++)
        {
          flag = 0;
          for(j=2;j<i;j++)
          {
                if((i%j) == 0)
               {
                flag=1;
                break;
               }
          }
        if(flag == 0)
        {
        count++;
        }
      }
gettimeofday(&stop_time,NULL);
exe_time = (stop_time.tv_sec+(stop_time.tv_usec/1000000.0)) - (start_time.tv_sec+(start_time.tv_usec/1000000.0));
printf("\n Number of prime numbers = %d \n Execution time is = %lf seconds\n",count,exe_time);
}


#include<stdio.h>
#include<math.h>
#include<sys/time.h>
#define N 999999999
int main()
{
    int i,j;
    double area,pi;
    double dx,y,x;
    double exe_time;
    struct timeval stop_time,start_time;

    dx=1.0/N;
    x=0.0;
    area=0.0;
    gettimeofday(&start_time,NULL);
    for(i=0;i<N;i++)
    {
        y = sqrt(1-x*x);
        area +=y*dx;
        x +=dx;

    }
    gettimeofday(&stop_time,NULL);
    exe_time = (stop_time.tv_sec+(stop_time.tv_usec/1000000.0)) - (start_time.tv_sec+(start_time.tv_usec/1000000.0));
    pi = 4.0*area;
    printf("\n Value of pi is = %.16lf\n Execution time is = %lf seconds\n",pi,exe_time);
}
//At RunTime use gcc pi.c -lm 
//Then ./a.out
//Output is :
//Value of pi is = 3.1415926687297406
//Execution time is = 3.972439 seconds

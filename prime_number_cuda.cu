#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<sys/time.h>
#define N 100000
__global__ void prime_count(int *countd)
{
        int i = blockIdx.x*blockDim.x+threadIdx.x;
        int flag = 0;
        int j;
        if((i>2)&&(i<N))
        {
                for(j=2;j<i;j++)
                {
                if(i%j == 0)
                {
                flag =1;
                break;
                }
                }
        if(flag == 0)
        {
                countd[i]=1;
        }
        else
        {
        countd[i]=0;
        }
        }
}


int main()
{
        int i,j;
        int count,flag,*cnt,*cntd;
        double exe_time;
        struct timeval stop_time,start_time;

        count = 1;
        gettimeofday(&start_time,NULL);
        cnt=(int *)malloc(N*sizeof(int));
        cudaMalloc(&cntd,N*sizeof(int));

        int num_threads_per_block = 256;
        int total_threads = N;
        int num_blocks = total_threads / num_threads_per_block + 1;
        prime_count<<<num_blocks,num_threads_per_block>>>(cntd);
        cudaMemcpy(cnt,cntd,N*sizeof(int),cudaMemcpyDeviceToHost);
for(i=3;i<N;i++)
{
        if(cnt[i]==1)
        {
                count++;
        }
}

gettimeofday(&stop_time,NULL);
exe_time = (stop_time.tv_sec+(stop_time.tv_usec/1000000.0)) - (start_time.tv_sec+(start_time.tv_usec/1000000.0));

printf("\n Number of prime numbers = %d \n Execution time is = %lf seconds\n",count,exe_time);
free(cnt);
cudaFree(cntd);

}

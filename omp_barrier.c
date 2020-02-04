/* Check what happens when a pragma omp barrier is reached inside a function
 * called by multiple threads inside an omp parallel construct.
 */


#include <omp.h>

#include <stdio.h>

void f() {
    printf("Thread %d: reached barrier\n", omp_get_thread_num());
#pragma omp barrier 
    printf("Thread %d: crossed barrier\n", omp_get_thread_num());
}

int main() {
#pragma omp parallel
{
    f();
}
    return 0;
}

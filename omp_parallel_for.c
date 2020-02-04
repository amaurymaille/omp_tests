/* Check what happens when running an omp for inside a function called by 
 * multiple threads inside omp parallel.
 */


#include <omp.h>

#include <stdio.h>

void f(int callee_id) {
#pragma omp for
    for (int i = 0; i < 5; i++) {
        printf("Thread %d, i = %d, callee_id = %d\n", omp_get_thread_num(), i, 
               callee_id);
    }
}

int main() {
#pragma omp parallel
{
    f(omp_get_thread_num());
}
    return 0;
}

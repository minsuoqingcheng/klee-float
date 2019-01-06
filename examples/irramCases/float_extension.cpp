#include <cmath>
#include <klee/klee.h>
#include <klee_expression.h>


double evaluate(int n)
{
    double r = 0;
    klee_make_symbolic(&r, sizeof(r), "r");
    for (int i = 1; i < n; i++) {
        r = r + 1 / sqrt(i);
        klee_output("r", r);
    }
    return r;
}


int main()
{
    evaluate(5);
    return 0;
}
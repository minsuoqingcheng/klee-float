#include <klee/klee.h>
#include <klee_expression.h>


double evaluate(int n)
{
    int i = 1;
    double initval = 0;
    klee_make_symbolic(&initval, sizeof(initval), "initval");
    while (i < n)
    {
        initval += (1.0 / (i * i));     //we need to use 1.0 here so that it can compute as double
        i++;
        klee_output("initval", initval);
    }
    return initval;
}


int main()
{
    evaluate(10);
    return 0;
}
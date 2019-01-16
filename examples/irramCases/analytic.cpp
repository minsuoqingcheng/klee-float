#include "klee/klee.h"
#include "klee_expression.h"


double evaluate(double x, int degree = 15)
{
    double res = 0;
    double powx = 1;
    klee_make_symbolic(&res, sizeof(res), "res");
    for (int i = 0; i < degree; ++i)
    {
        powx = powx * x;
        res = res + powx;   
    }
    klee_output("res", res);
    return res;
}


int main()
{
    double x;
    evaluate(x, 15);
    return 0;
}
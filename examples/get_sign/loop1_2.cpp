#include "klee/klee.h"
#include "klee_expression.h"


void loop1(double degree, double i)
{
    double res = 0;
    klee_make_symbolic(&degree, sizeof(degree), "degree");
    klee_make_symbolic(&i, sizeof(i), "i");
    klee_make_symbolic(&res, sizeof(res), "res");
    if(i < degree)
    {
        ++i;
        klee_output("i", i);
        klee_output("res", res);
    }
    else
    {
        // break;
        int __break__ = 0;
        klee_output("__break__", __break__);
        return;
    }
}
int main()
{
    double degree;
    double i;
    loop1(degree, i);
    return 0;
}

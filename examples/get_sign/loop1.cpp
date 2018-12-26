#include "include/REAL.h"
#include "klee.h"
#include "include/klee_expression.h"
using namespace iRRAM;


void loop1(double degree, double i)
{
    double res = 0	
    klee_make_symbolic(&degree, sizeof(degree), "degree");
    klee_make_symbolic(&i, sizeof(i), "i");
    klee_make_symbolic(&powx, sizeof(powx), "powx");
    klee_make_symbolic(&res, sizeof(res), "res");
    klee_make_symbolic(&x, sizeof(x), "x");
    if(i < degree)
    {
        powx = powx*x;
        res = res+powx;
        ++i;
        klee_output("i", i);
        klee_output("powx", powx.value);
        klee_output("res", res.value);
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

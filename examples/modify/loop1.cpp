#include "klee/klee.h"
#include "klee_expression.h"


void loop1(double degree, double i)
{
    double res = 0;
    double powx = 1;
    double x = 10;

    klee_make_symbolic(&powx, sizeof(powx), "powx");
    klee_make_symbolic(&res, sizeof(res), "res");
    klee_make_symbolic(&x, sizeof(x), "x");
    if(i < degree)
    {
        powx = powx*x;
        res = res+powx;
        ++i;
        klee_output("i", i);
        klee_output("powx", powx);
        if(powx < res - x) { 
          res = res * 2; 
          klee_output("res", res);
        }else{
          res = res / 2; 
          klee_output("res", res);
        }
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
    klee_make_symbolic(&degree, sizeof(degree), "degree");
    klee_make_symbolic(&i, sizeof(i), "i");
    loop1(degree, i);

    return 0;
}

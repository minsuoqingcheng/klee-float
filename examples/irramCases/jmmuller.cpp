#include <klee/klee.h>
#include <klee_expression.h>

/* Compute iteration by J.M.Muller */

double evaluate(int count)
{

    double a = 5;
    double b = 6;
    double c;
    klee_make_symbolic(&c, sizeof(c), "c");
    for (int i = 0; i < count; i++)
    {
        c = 111 - (1130 - 3000 / a) / b;
        a = b;
        b = c;

    }
    for (int i = 0; i < count; i++)
    {
        c = 3000 / (1130 - (111 - b) * a);
        b = a;
        a = c;
        klee_output("c", c);
    }
    return c;
}


int main()
{
    evaluate(6);
    return 0;
}

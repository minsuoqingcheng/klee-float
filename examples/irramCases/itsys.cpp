#include <cmath>
#include <vector>
#include <klee/klee.h>
#include <klee_expression.h>


double itsyst(int n)
{
    double x = 0.5;
    double c = 3.75;
    std::vector<bool> record;
    klee_make_symbolic(&x, sizeof(x), "x");
    for (int i = 0; i < n; ++i)
    {
        record.push_back(x >= 0.5); // 根据x与0.5大小来判断取正取负，这里加as_doubel是因为REAL无法判断REAL(0.5)>=0.5
        x = c * x * (1.0 - x);
    }
    for (int i = n - 1; i >= 0; --i)
    {
        if (record[i])
        {
            x = 0.5 + sqrt(0.25 - 4.0 / 15.0 * x);
        }
        else
        {
            x = 0.5 - sqrt(0.25 - 4.0 / 15.0 * x);
        }
        klee_output("x", x);
    }
    return x;
}

int main()
{
    itsyst(6);
    return 0;
}
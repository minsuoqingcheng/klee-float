/*
 * First KLEE tutorial: testing a small function
 */

#include "klee/klee.h"

float klee_output(const char *name, float v)
{
    return v;
}


float get_sign(float x) {
  klee_make_symbolic(&x, sizeof(x), "x");
  float res = 0;
  if (x < 0)
     res = -x;
  else
     res = x;
  klee_output("res", res);
  return res;
}

int main() {
  float a;
  get_sign(a);
  return 0;
} 

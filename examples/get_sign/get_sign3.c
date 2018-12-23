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
  if (x < 12.5)
     res = x + 10.6;
  else if (x < 20.5)
     res = x + 20.8;
  else
     res = x + 50.25;
  klee_output("res", res);
  return res;
}

int main() {
  float a;
  get_sign(a);
  return 0;
} 

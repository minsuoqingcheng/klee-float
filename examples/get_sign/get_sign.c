/*
 * First KLEE tutorial: testing a small function
 */

#include "klee/klee.h"

float get_sign(float x) {
  if (x < 0)
     return -x;
  else 
     return x;
}

float klee_output(const char *name, float v)
{
    return v;
}

int main() {
  float a;
  klee_make_symbolic(&a, sizeof(a), "a");
  float res = get_sign(a);
  klee_output("res", res);
  return 0;
} 

#include "rice/Class.hpp"
#include <iostream>
#include <math.h>
using namespace Rice;
// using namespace std;


int rice_fibonacci(int n) {
  int a = 1, b = 1, c, i;
  if (n == 0) {
    return 0;
  }
  for (i = 3; i <= n; i++) {
    c = a + b;
    a = b;
    b = c;
  }
  return b;
}
int rice_factorial(int max) {
  int i=max, result=1;
  while (i >= 2) { result *= i--; }
  return result;
}
int rice_pow(int a, int n) {
  return pow(a, n);
}

extern "C"

void Init_rice_test()
{
  Class rb_c = define_class("RiceTest")
    .define_method("fibonacci", &rice_fibonacci)
    .define_method("factorial", &rice_factorial)
    .define_method("pow", &rice_pow);
}
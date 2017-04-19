#include "rice/Class.hpp"
using namespace Rice;

extern "C"

void Init_[CLASSNAME]()
{
  Class rb_c = define_class("[CLASSNAME]")
    .define_method("methodName_1", &methodName_1)
    .define_method("methodName_2", &methodName_2)
    .define_method("methodName_n", &methodName_n);
}
#include <stdio.h>

extern "C" {
  void rust_function_1();
  // void rust_function_2();
}

int main(int argc, char** argv) {
  printf("Main\n");
  rust_function_1();
  // rust_function_2();
  printf("Done\n");
}

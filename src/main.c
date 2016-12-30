#include <stdlib.h>
#include <stdio.h>

#include "parse.tab.h"

extern FILE* yyin;

int main(int argsN, char *args[]) {
  if (argsN > 1) {
    yyin = fopen(args[1], "r");
  }

  yylex();

  return EXIT_SUCCESS;
}

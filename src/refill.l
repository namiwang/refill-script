%{
#include <stdio.h>

#include "parse.tab.h"

//#define TYPE(type) printf("%s\n", type)
//#define TYPE_WITH_VALUE(type, value) printf("%s(%s)\n", type, value)
%}

%option noyywrap
%option yylineno

letter [a-zA-Z]
digit [0-9]

INTEGER [1-9]digit*

%%

{INTEGER} {
  int temp;
  sscanf(yytext, "%d", &temp);
  printf("%d", temp);
}

"+" { yylval = PLUS; }

[\t ] {}

 \n {}

. {
  fprintf(stderr, "lex err.\n");
  exit(1);
}

%%

void yyerror(char const *s) {  
  fprintf(stderr,
          "%s. Unexpected \"%s\" on line %d\n",
          s,
          yytext,
          yylineno);
}

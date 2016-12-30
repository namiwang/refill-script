%{
  #include <stdio.h>
  extern int yylex(void);
%}

%token INTEGER PLUS
%start program

%%

program
  : lines

lines
  : lines line;
  | line

line
  : expression '\n'

expression
  : INTEGER;
  | expression PLUS expression { printf("%d\n", $1 + $3); }

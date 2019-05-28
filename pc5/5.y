%{
#include<stdio.h>
%}
%token DIGIT
%%
S:DIGIT DIGIT DIGIT S | DIGIT ; 
%%
void main()
{
printf("enter an integer\n");
yyparse();
printf("valid\n");
}
void yyerror()
{
printf("invalid\n");
exit(0);
}

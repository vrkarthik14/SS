%{ 
  #include<stdio.h> 
  int id=0,flag=0,com=0, oper=0;; 
  int yylex(void); 
%} 
%% 
\/\/.* {com++;}
"/*"[^"*/"]*"*/" {com++;}
[\+\-\*\/] oper++;
= ;
[ \t\n] ;
"int"|"char"|"float"|"double" {flag=1;} 
";" {flag=0;} 
[a-zA-Z][a-zA-Z0-9]* {if(flag!=0) id++;} 
. ;
%% 
int main(void) 
{ 
  yyin=fopen("input.txt","r");
  yylex(); 	
  printf("Number of Identifier:%d\n",id); 
  printf("No. of comments=%d\n", com);
  printf("No. of operators=%d\n", oper);
  fclose(yyin); 
  return 0; 
} 

int yywrap(){
  return 1;
  fclose(yyin);
}

int yyerror(void) 
{
   printf("ERROR"); 
   return 1;
} 


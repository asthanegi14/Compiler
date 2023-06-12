%{
#include<stdio.h>
%}

%%

[//](.*){};
[/*](.*\n)*[*/]{};

%%

int yywrap(){return 1;}

int main(){
yyin = fopen("inpre.c","r");
yyout = fopen("outre.c","w");
yylex();
return 0;
}
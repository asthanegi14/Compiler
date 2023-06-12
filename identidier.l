%{
#include<stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier %s\n", yytext); }
%%

int yywrap(){
    return 0;
}


int main(){
    printf("Enter a string = ");
    yylex();
    return 0;
}
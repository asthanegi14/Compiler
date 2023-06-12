%{
#include<stdio.h>
%}

%%
[\t" "]+ {fprintf(yyout," ");}


%%

int yywrap(){
return 1;
}

int main(){
yyin = fopen("replaceinp.txt", "r");
yyout = fopen("replaceout.txt", "w");    
yylex();
return 0;
}
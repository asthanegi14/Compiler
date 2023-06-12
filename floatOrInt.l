%{
    #include<stdio.h>
%}

%%
[0-9]* {printf("Integer\n");}
[0-9]*[.][0-9]* {printf("Float\n");}
%%

int yywrap(void){}

int main(){
    printf("enter a number: ");
    yylex();

    return 0;
}
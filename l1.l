%{
    #include<stdio.h>
    int ocount=0, icount=0, scount=0;
%}
%%
[{};'()] {scount++;}
[+-/=*%] {ocount++;}
^[a-zA-Z][a-zA-Z0-9]* {icount++;}

%%

int yywrap(void){}

int main(){
    yyin = fopen("text1.txt", "r");
    yylex();
    printf("Number of separator = %d\n", scount);
    printf("Number of identifier = %d\n", icount);
    printf("Number of operator = %d\n", ocount);

    return 0;
}
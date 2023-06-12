%{
    #include<stdio.h>
    int ocount=0, icount=0, scount=0, kcount=0;
%}
%%
auto|do|while|int|float|double|char|for|ayto|string {kcount++;}
[{};'()] {scount++;}
[+-/=*%] {ocount++;}
^[a-zA-Z][a-zA-Z0-9]* {icount++;}
.|\n;

%%

int yywrap(void){}

int main(){
    yyin = fopen("text2.txt", "r");
    yylex();
    printf("Number of separator = %d\n", scount);
    printf("Number of identifier = %d\n", icount);
    printf("Number of separator = %d\n", scount);
    printf("Number of keywords = %d\n", kcount);

    return 0;
}
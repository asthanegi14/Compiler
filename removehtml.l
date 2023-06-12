%{
    #include<stdio.h>
%}

%%
"<"[^>]*">" {fprintf(yyout, "%s\n", yytext);}
. {};
%%

int yywrap(){return 1;}

int main(){
    yyin = fopen("remove.html", "r");
    yyout = fopen("store.html", "w");
    yylex();
    return 0;
}
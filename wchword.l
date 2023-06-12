%{
#include<stdio.h>
int l=0;
int c=0;
int s=0;
int t=0;
int w=0;
%}

%%
" " {s++;w++;}
[\t] {t++;}
[\n] {l++;}
[\n\t] {w++;}
[^\n\t] {c++;}
%%

int main(){
yyin=fopen("inp.txt","r");
yylex();
printf(" lines=%d\n characters=%d\n spaces=%d\n tab=%d\nwords=%d\n",l,c,s,t,w);
}

int yywrap(){
return 1;
}

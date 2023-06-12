%{
#include<stdio.h>
int line=0,space=0,tab=0,ch=0;
%}

%%
[\n] { line++;}
[ \t] { space++;}
[^\t] { tab++;}
%%

int yywrap(){ return 0; }

int main(){
	yyin = fopen("inp.txt","r");
	yylex();
	ch = space + tab;
	printf("Number of lines : %d\n",line);
	printf("Number of spaces : %d\n",space);
	printf("Number of tabs : %d\n",tab);
	printf("Number of charc : %d\n",ch);
	
	return 0;
}

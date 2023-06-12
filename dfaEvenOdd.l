%{
#include<stdio.h>
%}
%s A B C D

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN B;
<INITIAL>[^ab\n] BEGIN D;
<INITIAL>[\n] BEGIN INITIAL; {printf("****Accepted****\n");}

<A>a BEGIN INITIAL; 
<A>b BEGIN C;
<A>[^ab\n] BEGIN D;
<A>[\n] BEGIN INITIAL; {printf("****Not Accepted****\n");}

<B>a BEGIN C;
<B>b BEGIN INITIAL;
<B>[^ab\n] BEGIN D;
<B>[\n] BEGIN INITIAL; {printf("****Not Accepted****\n");}

<C>a BEGIN B;
<C>b BEGIN INITIAL; 
<C>[^ab\n] BEGIN D;
<C>[\n] BEGIN INITIAL; {printf("****Not Accepted****\n");}

<D>a BEGIN D;
<D>b BEGIN D;
<D>[^ab\n] BEGIN D;
<D>[\n] BEGIN INITIAL; {printf("****Invalid****\n");}
%%
int yywrap(){
return 1;
}
void main()
{
printf("enter a string: ");
yylex();

}

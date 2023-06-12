%{
    #include<stdio.h>
%}

%s A B C Dead

%%

<INITIAL>[0-9]+ BEGIN A;
<INITIAL>[0-9]+[.][0-9]+ BEGIN B;
<INITIAL>[A-Za-z_][A-Za-z0-9]* BEGIN C;
<INITIAL>[^\n] BEGIN Dead;
<INITIAL>[\n] BEGIN INITIAL; {printf("Not Accepted\n");}

<A>[^\n] BEGIN Dead;
<A>[\n] BEGIN INITIAL; {printf("Integer Accepted\n");}


<B>[^\n] BEGIN Dead;
<B>[\n] BEGIN INITIAL; {printf("Float Accepted\n");}


<C>[^\n] BEGIN Dead;
<C>[\n] BEGIN INITIAL; {printf("Keyword Accepted\n");}


<Dead>[^\n] BEGIN Dead;
<Dead>[\n] BEGIN INITIAL; {printf("Invalid\n");}

%% 

int yywrap(){
    return 1;
}

void main(){
    printf("enter a string: ");
    yylex();
}

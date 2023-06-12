%{
    #include<stdio.h>
%}

%s A B C D E F G Dead

%%

<INITIAL>a BEGIN A;
<INITIAL>b BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN Dead;
<INITIAL>[\n] BEGIN INITIAL; {printf("Not Accepted\n");}

<A>a BEGIN B;
<A>b BEGIN F;
<A>[^ab\n] BEGIN Dead;
<A>[\n] BEGIN INITIAL; {printf("Not Accepted\n");}

<B>a BEGIN C;
<B>b BEGIN D;
<B>[^ab\n] BEGIN Dead;
<B>[\n] BEGIN INITIAL; {printf("Not Accepted\n");}

<C>a BEGIN C;
<C>b BEGIN D;
<C>[^ab\n] BEGIN Dead;
<C>[\n] BEGIN INITIAL; {printf("Accepted\n");}

<D>a BEGIN E;
<D>b BEGIN G;
<D>[^ab\n] BEGIN Dead;
<D>[\n] BEGIN INITIAL; {printf("Accepted\n");}

<E>a BEGIN B;
<E>b BEGIN F;
<E>[^ab\n] BEGIN Dead;
<E>[\n] BEGIN INITIAL; {printf("Accepted\n");}

<F>a BEGIN E;
<F>b BEGIN G;
<F>[^ab\n] BEGIN Dead;
<F>[\n] BEGIN INITIAL; {printf("Not Accepted\n");}

<G>a BEGIN A;
<G>b BEGIN INITIAL;
<G>[^ab\n] BEGIN Dead;
<G>[\n] BEGIN INITIAL; {printf("Accepted\n");}

<Dead>a BEGIN Dead;
<Dead>b BEGIN Dead;
<Dead>[^ab\n] BEGIN Dead;
<Dead>[\n] BEGIN INITIAL; {printf("Invalid\n");}

%%

int yywrap(){
    return 1;
}

void main(){
    printf("Enter a string: ");
    yylex();
}
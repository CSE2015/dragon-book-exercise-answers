%{
#include<stdio.h>
#include<string.h>
char line[20];
int count=0,i=0;
FILE *out;
%}
%%
[\n\t ' '+' ']+ {fprintf(yyout,"%s"," ");}
[0-9]+\.[0-9]+ {fprintf (yyout, "%s", yytext);}
[0-9]+  {fprintf (yyout, "%s", yytext);}
[a-zA-Z0-9]+ {fprintf (yyout, "%s", yytext);}

%%
main()
{
	FILE *myfile=fopen("inputfile.ext","r");
	FILE *outfile = fopen("outputfile.ext","w");
	yyin = myfile;
	yyout = outfile;
	yylex();

}
int yywrap()
{
return 1;
}


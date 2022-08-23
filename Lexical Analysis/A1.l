%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	#include <stdbool.h>
	#include <assert.h>
	#include "A1.tab.h"
	void yyerror(char*); 
    int yyparse(void); 
%}

%%    
"//".*		;
"class"     {
                int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                 strcpy(yylval.text,yytext); 
                 return CLASS;
            }
"public"    {
                int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                 strcpy(yylval.text,yytext); 
                 return PUBLIC;
            }
"static"    {
                int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                 strcpy(yylval.text,yytext);
                 return STATIC;
            }
"void"      {
                int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                 strcpy(yylval.text,yytext); 
                 return VOID;
            }
"main"      {    
                int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                 strcpy(yylval.text,yytext); 
                 return MAIN;
            }


"extends"   {
               int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                strcpy(yylval.text,yytext); 
                return EXTENDS;
            }
"return"	{
		       int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
		        strcpy(yylval.text,yytext); 
		        return RETURN;
               }
"int"		{
                 int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                  strcpy(yylval.text,yytext); 
                  return INT;
               }
"boolean"	{
                 int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                  strcpy(yylval.text,yytext); 
                  return BOOLEAN;
               }
"String"    {
                int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                 strcpy(yylval.text,yytext); 
                 return STRING;
            }               
"if"		{
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return IF;
               }
"else"		{
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return ELSE;
               }
"System.out.println" 	{
                int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                 strcpy(yylval.text,yytext); 
                 return OUTPUT;
                      }               
"while"            {
		          int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
		           strcpy(yylval.text,yytext); 
		           return WHILE;
                   }
".length"   {
                 int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                  strcpy(yylval.text,yytext); 
                  return LENGTH;
            }
"true"      {
                 int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                  strcpy(yylval.text,yytext); 
                  return TRE;
            }
"false" 	{
                   int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                    strcpy(yylval.text,yytext); 
                    return FLSE;
                }
"this"		{
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return THIS;
               }
"new"		{
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return NEW;
               }
"#defineExpr"  {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return DEFINE;
               }
"#defineExpr0"  {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return DEFINE;
                }
"#defineExpr1"  {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return DEFINE;
                }
"#defineExpr2"  {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return DEFINE;
                }
"#defineStmt"  {
                   int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                    strcpy(yylval.text,yytext); 
                    return DEFINE;
               }
"#defineStmt0"  {
                   int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                    strcpy(yylval.text,yytext); 
                    return DEFINE;
                }
"#defineStmt1"  {
                   int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                    strcpy(yylval.text,yytext);
                     return DEFINE;
                }
"#defineStmt2"  {
                   int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                    strcpy(yylval.text,yytext); 
                    return DEFINE;
                }
"{"         {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return LCURLB;
            }
"}"         {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return RCURLB;
            }
"("         {
                 int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                  strcpy(yylval.text,yytext); 
                  return LB;
            }
")"         {
                 int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                  strcpy(yylval.text,yytext); 
                  return RB;
            }
"["	        {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return LSQUAB;
                }
"]"         {
               int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                strcpy(yylval.text,yytext); 
                return RSQUAB;
            }
"="			{
                          int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                           strcpy(yylval.text,yytext); 
                           return EQUAL;
                       }
"+" 		{
                      int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                       strcpy(yylval.text,yytext); 
                       return PLUS;
               }
"-"	       {
                      int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                       strcpy(yylval.text,yytext); 
                       return MINUS;
               }                       
"/"			{
                          int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                           strcpy(yylval.text,yytext); 
                           return DIVISION;
                        }
"*"			{
                          int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                           strcpy(yylval.text,yytext); 
                           return MULTIPLICATION;
                       }

";"	       {
                      int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                       strcpy(yylval.text,yytext); 
                       return SEMICOLON;
               }
"!="		{
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return NOTEQ;
                }
"<="		{
                   int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                    strcpy(yylval.text,yytext); 
                    return LEQ;
                }               
","	       {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return COMMA;
               }
"!"         {
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext);
                   return NOT;
            }
"."         {
                 int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                  strcpy(yylval.text,yytext); 
                  return DOT;
             }
"&&"		{
                 int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                  strcpy(yylval.text,yytext); 
                  return AND;
                }
"||"		{
                  int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return OR;
                }		

[A-Z|a-z]([A-Z|a-z]|[0-9]|[_])* {
		           int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
		            strcpy(yylval.text,yytext); 
		            return IDENTIFIER;
                    }
[0-9]+	 	{
                   int len = strlen(yytext);
              yylval.text = (char*) malloc((len+1)*sizeof(char));;
                   strcpy(yylval.text,yytext); 
                   return INTEGER;
                }
[ \t\n]+	;
<<EOF>>     {return 0;};
.     		;
%%


void yyerror(char* str) { printf("//Failed to parse input code"); }

int yywrap(void) { return 1; }

int main(void) {
	yyparse();	
}

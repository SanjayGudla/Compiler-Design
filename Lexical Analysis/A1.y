%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <assert.h>
#define MAX_LEN 1000
#define ERROR "err"
#define IFELSE 
extern int yylex();
extern void yyerror(char *);

char* findId[MAX_LEN];
char* findValue[MAX_LEN];
char* findParams[MAX_LEN];
void storeVal(char*,char*,char*);
char* getVal(char*);
char* getPar(char*);
%}

%union {
	char* text;
}

%token <text>   CLASS PUBLIC STATIC VOID MAIN STRING OUTPUT EXTENDS RETURN INT BOOLEAN IF ELSE WHILE LENGTH TRE FLSE THIS NEW EQUAL DIVISION MULTIPLICATION PLUS MINUS SEMICOLON COMMA DOT NOT AND OR NOTEQ LEQ IDENTIFIER INTEGER DEFINE LCURLB RCURLB LB RB LSQUAB RSQUAB 

%type <text> Goal MainClass TypeDeclaration MethodDeclaration Type Statement Expression PrimaryExpression MacroDefinition MacroDefStatement MacroDefExpression Identifier Integer
%type <text> A B C D E F G H



%start Goal

%%

Goal: MainClass	{sprintf($$,"%s\n",$1); printf("%s\n",$$);}	
	|	A MainClass {sprintf($$,"%s\n",$2); printf("%s\n",$$);}	
	|	MainClass B {sprintf($$,"%s %s\n",$1,$2); printf("%s\n",$$);}
	|	A MainClass B 	{sprintf($$,"%s %s\n",$2,$3); printf("%s\n",$$);};

MainClass: CLASS Identifier LCURLB PUBLIC STATIC VOID MAIN LB STRING LSQUAB RSQUAB Identifier RB LCURLB OUTPUT LB Expression RB SEMICOLON RCURLB RCURLB{sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21);};


TypeDeclaration: CLASS Identifier LCURLB RCURLB {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
		|	CLASS Identifier EXTENDS Identifier LCURLB RCURLB	{sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}
		|	CLASS Identifier EXTENDS Identifier LCURLB C RCURLB	{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	CLASS Identifier EXTENDS Identifier LCURLB D RCURLB	{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	CLASS Identifier EXTENDS Identifier LCURLB C D RCURLB	{sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}	
		|	CLASS Identifier LCURLB C RCURLB  {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		| 	CLASS Identifier LCURLB D RCURLB   {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		|	CLASS Identifier LCURLB C D RCURLB	{sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);};


MethodDeclaration: PUBLIC Type Identifier LB  RB LCURLB  RETURN Expression SEMICOLON RCURLB {sprintf($$,"%s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10);}
				 |PUBLIC Type Identifier LB  RB LCURLB F RETURN Expression SEMICOLON RCURLB {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);}
				 |PUBLIC Type Identifier LB Type Identifier RB LCURLB F RETURN Expression SEMICOLON RCURLB {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);}
				 |PUBLIC Type Identifier LB  Type Identifier E RB LCURLB F RETURN Expression SEMICOLON RCURLB {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14);}
				  | PUBLIC Type Identifier LB Type Identifier RB LCURLB  RETURN Expression SEMICOLON RCURLB {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);}
				 | PUBLIC Type Identifier LB  Type Identifier E RB LCURLB  RETURN Expression SEMICOLON RCURLB     {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);};
				
Type: INT   {sprintf($$,"%s",$1);}
	|	BOOLEAN	{sprintf($$,"%s",$1);}
	|	INT LSQUAB RSQUAB	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	Identifier	{sprintf($$,"%s",$1);}	;

Statement: LCURLB RCURLB	{sprintf($$,"%s %s",$1,$2);}
	|	IF LB Expression RB Statement	{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
	|	IF LB Expression RB Statement ELSE Statement	{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
	|	WHILE LB Expression RB Statement	{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
	|	Identifier LB RB SEMICOLON		{if(strcmp(getVal($1),ERROR)!=0){sprintf($$,"%s",getVal($1));} else{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}}
	|	Identifier LB Expression RB SEMICOLON	{if(strcmp(getVal($1),ERROR)!=0){sprintf($$,"%s","");}else{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}}
	|		LCURLB F RCURLB	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	OUTPUT LB Expression RB SEMICOLON	{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
	|	Identifier EQUAL Expression SEMICOLON	{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
	|	Identifier LSQUAB Expression RSQUAB EQUAL Expression SEMICOLON	{sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
	|	Identifier LB Expression G RB SEMICOLON	{
		if(strcmp(getVal($1),ERROR)==0){
		        sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);
			
		}
		else{
		    char* param =(char*)malloc(MAX_LEN);strcpy(param,getPar($1));
			char** tokens;
			tokens = 0;
			char* stmt = (char*)malloc(MAX_LEN);
			strcpy(stmt,getVal($1));
			if (tokens)
			    {
				int i;
				for (i = 0; *(tokens + i); i++)
				{
				    free(*(tokens + i));
				}
				printf("\n");
				free(tokens);
			    }
			sprintf($$,"%s",stmt);
		
		}
		
		}
	| 	Type Identifier SEMICOLON	{sprintf($$,"%s %s %s",$1,$2,$3);};

Expression: PrimaryExpression AND PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression OR PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression NOTEQ PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression PLUS PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression MINUS PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression LEQ PrimaryExpression	{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression MULTIPLICATION PrimaryExpression		{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression DIVISION PrimaryExpression		{sprintf($$,"%s %s %s",$1,$2,$3);}
	|	PrimaryExpression LSQUAB PrimaryExpression RSQUAB	{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
	|	PrimaryExpression LENGTH		{sprintf($$,"%s %s",$1,$2);}
	|	PrimaryExpression		{sprintf($$,"%s",$1);}
	|	PrimaryExpression DOT Identifier LB RB	{if(strcmp(getVal($3),ERROR)!=0){sprintf($$,"%s %s %s %s %s",$1,$2,$4,getVal($3),$5);}else{sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}}
	|	PrimaryExpression DOT Identifier LB Expression RB	{if(strcmp(getVal($3),ERROR)!=0){sprintf($$,"%s %s %s %s %s",$1,$2,$4,"",$6);}else{sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}}
	|	PrimaryExpression DOT Identifier LB Expression G RB	  {
		if(strcmp(getVal($3),ERROR)==0){
		        sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);
		}
		else{
		       int len=strlen($5);
			len+=strlen($6);
			len++;	
			char* param =(char*)malloc(MAX_LEN);strcpy(param,getPar($3));
			char** paramtokens;
			paramtokens = 0;
			char* stmt = (char*)malloc(MAX_LEN);
			strcpy(stmt,getVal($3));
			if (paramtokens)
			    {
				int i;
				for (i = 0; *(paramtokens + i); i++)
				{
				    
				    free(*(paramtokens + i));
				
				}
				printf("\n");
				
			    }
			sprintf($$,"%s %s %s %s %s",$1,$2,$4,stmt,$7);
		}}
	|	Identifier LB RB	{if(strcmp(getVal($1),ERROR)!=0){sprintf($$,"%s %s %s",$2,getVal($1),$3);}else{sprintf($$,"%s %s %s",$1,$2,$3);}}
	|	Identifier LB Expression RB	{if(strcmp(getVal($1),ERROR)!=0){sprintf($$,"%s %s %s",$2,"",$3);}else{sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}}
	|	Identifier LB Expression G RB  {
		if(strcmp(getVal($1),ERROR)==0){
		        sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);
			
		}
		else{
		        int len=0;
			len+=strlen($3);
			len+=strlen($4);
			len+=1;
			char* param =(char*)malloc(MAX_LEN);strcpy(param,getPar($1));
			char** paramtokens;
			paramtokens = 0;
			char* stmt = (char*)malloc(MAX_LEN);
			strcpy(stmt,getVal($1));
			if (paramtokens)
			    {
				int i;
				for (i = 0; *(paramtokens + i); i++)
				{
				    
				    free(*(paramtokens + i));
				  
				}
				printf("\n");
				free(paramtokens);
			    }
			sprintf($$,"%s %s %s",$2,stmt,$5);
		 }}	;

PrimaryExpression: Integer	{sprintf($$,"%s",$1);}
		|	TRE	{sprintf($$,"%s",$1);}
		|	FLSE	{sprintf($$,"%s",$1);}
		|	Identifier	{sprintf($$,"%s",$1);}
		|	THIS	{sprintf($$,"%s",$1);}
		|	NEW INT LSQUAB Expression RSQUAB	 {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		|	NEW Identifier LB RB	 {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
		|	NOT Expression		 {sprintf($$,"%s %s",$1,$2);}
		|	LB Expression RB	 {sprintf($$,"%s %s %s",$1,$2,$3);}	;

MacroDefinition: MacroDefExpression	{sprintf($$,"%s",$1);}
		|	MacroDefStatement	{sprintf($$,"%s",$1);}	;
		
		
MacroDefStatement: DEFINE Identifier LB RB LCURLB RCURLB	{storeVal($2,"",""); sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}
		|	DEFINE Identifier LB RB LCURLB F RCURLB	{storeVal($2,$6,""); sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	DEFINE Identifier LB Identifier RB LCURLB RCURLB	{storeVal($2,"",$4); sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	DEFINE Identifier LB Identifier H RB LCURLB RCURLB	{int len=strlen($4);len+=strlen($5);len++;char* temp=(char*)malloc(len-len+len);strcpy(temp,$4);strcat(temp,$5);storeVal($2,"",temp);free(temp);sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}
		|	DEFINE Identifier LB Identifier RB LCURLB F RCURLB	{storeVal($2,$7,$4); sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}
		|	DEFINE Identifier LB Identifier H RB LCURLB F RCURLB	{char* temp=(char*)malloc(strlen($4)+strlen($5)+1);strcpy(temp,$4);strcat(temp,$5);storeVal($2,$8,temp);free(temp);sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}	;

MacroDefExpression: DEFINE Identifier LB RB LB Expression RB	{storeVal($2,$6,""); sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		|	DEFINE Identifier LB Identifier RB LB Expression RB	{storeVal($2,$7,$4); sprintf($$,"%s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8);}
		|	DEFINE Identifier LB Identifier H RB LB Expression RB	{char* temp=(char*)malloc(strlen($4)+strlen($5)+1);strcpy(temp,$4);strcat(temp,$5);storeVal($2,$8,temp);free(temp);sprintf($$,"%s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9);}	;

Identifier: IDENTIFIER		{sprintf($$,"%s",$1);}	;

Integer: INTEGER	{sprintf($$,"%s",$1);}	;

A         : MacroDefinition A {sprintf($$,"%s %s",$1,$2);}
              | MacroDefinition {sprintf($$,"%s",$1);};
             
B         :  TypeDeclaration B {sprintf($$,"%s %s",$1,$2);}
              |  TypeDeclaration {sprintf($$,"%s",$1);};
              
              
C         : Type Identifier SEMICOLON C {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
              | Type Identifier SEMICOLON {sprintf($$,"%s %s %s",$1,$2,$3);};
          
               
D         : MethodDeclaration D {sprintf($$,"%s %s",$1,$2);}
              | MethodDeclaration {sprintf($$,"%s",$1);};
               
               
E         : COMMA Type Identifier  E {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}        
              | COMMA Type Identifier {sprintf($$,"%s %s %s",$1,$2,$3);};
               
               
F         : Statement {sprintf($$,"%s",$1);}
              | Statement F {sprintf($$,"%s %s",$1,$2);};
               
G         : COMMA Expression G{sprintf($$,"%s %s %s",$1,$2,$3);}
              | COMMA Expression {sprintf($$,"%s %s",$1,$2);};
               
H         : COMMA Identifier H {sprintf($$,"%s %s %s",$1,$2,$3);}
              | COMMA Identifier {sprintf($$,"%s %s",$1,$2);};  
 
%%



void storeVal(char* A,char* B,char* C){
	int index = 0;
	while(findId[index]!=NULL){
		index++;	
	}
	while(true){
		if(findId[index]){index++;}
		else{break;}
	}
	int ind = strlen(A);
	findId[index] = (char*)malloc(ind+1);
	strcpy(findId[index],A);
	int vid = strlen(B);
	findValue[index] = (char*)malloc(vid+1);
	strcpy(findValue[index],B);
	int pid = strlen(C);
	findParams[index] = (char*)malloc(pid+1);
	strcpy(findParams[index],C);
	return;
}

char* getVal(char* S){
	
	int idx = 0;
	while(true){
		if(findId[idx]==NULL){return ERROR;}
		else if(strcmp(findId[idx],S)!=0)
		{       
		        idx++;
			
		}
		else{return findValue[idx];}
	}
	
}

char* getPar(char* S){
	int idx = 0;
	while(true){
		if(findId[idx]==NULL)
		{    return ERROR;
		}
		else if(strcmp(findId[idx],S)!=0)
		{       
		        idx++;
			
		}
		else{return findParams[idx];}
	}
}

    


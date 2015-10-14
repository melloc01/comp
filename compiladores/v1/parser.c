/*@<parser.c>::*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <lexer.h>
#include <parser.h>
#include <tokens.h>


/**
 * Top-down recursive parser emulating an EBNF for a simplified
 * arithmetic expression:
 *
 * cmd -> expr EOF
 *
 * expr -> [NEG] term { ADDOP term }
 *
 * term -> fact { MULOP fact }
 *
 * fact -> ID | DEC | ( expr )
 *
 **/



#ifndef MAXIDLEN
	#define MAXIDLEN 31
#endif

 /* cmd -> expr EOF */
void cmd (void)
{
	expr ();
	match (EOF);
}

 /* expr -> [NEG] term { ADDOP term } */
void expr (void)
{
	
	int lastoperator = 0;

	if (lookahead == '-') {
		
		lastoperator = '-';
		match ('-');

	}

	term ();

	if (lastoperator) {

		// change signal
		printf("CHS");

	}

	while (lookahead == '+' || lookahead == '-') {
		
		lastoperator = lookahead;
		match (lookahead); 
		term ();

		switch(lastoperator) {
			
			case '+':printf("ADD\n"); break;
			default: printf("SUB\n");
		
		}

	}

}

 /* term -> fact { MULOP fact } */
void term (void)
{

	int lastoperator;

	fact ();

	while (lookahead == '*' || lookahead == '/') {
		
		lastoperator = lookahead;	
		match (lookahead); 
		fact ();

		switch(lastoperator) {
			
			case '*':printf("MUL\n"); break;
			default: printf("DIV\n");
		
		}
	
	}
}

 /* fact -> ID | DEC | ( expr ) */
void fact (void)
{
	
	char varname[MAXIDLEN +1];
	int assign = 0;

	switch (lookahead) {
	case ID:
	
		strcpy(varname, lexeme);
		

		match (ID); 

		if (lookahead == ':') {
			assign = 1;
			match(':'); match('='); 
			expr();
		}

		
		if (assign) {
			
			printf("storage(\"%s\")\n", varname);
			
		} else {

			printf("push(retrieve(%s)) \n", varname);
		
		}
		
		break; 

	case DEC:
		
		printf("push(%s) \n", lexeme);
		match (DEC); break;

	default:
		match ('('); expr (); match (')');
	}
}

/** lexer-to-parser interface **/

int lookahead;

void match (int predicted)
{
	if (predicted == lookahead) {
		if (lookahead != EOF) {
			lookahead = gettoken (tape);
		}
	} else {
		fprintf (stderr,
		"token mismatch... exiting\n");
		exit(-1);
	}
}

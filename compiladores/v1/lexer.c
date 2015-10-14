/*@<lexer.c>::*/

#include <stdio.h>
#include <ctype.h>

#include <lexer.h>
#include <tokens.h>


#ifndef MAXIDLEN
	#define MAXIDLEN 31
#endif

int lexcursor;
char lexeme[MAXIDLEN + 1];

/* automata cock-tail */

/* skip spaces */

int skipspaces (FILE *tape)
{
	int head;

	while ( isspace (head = getc (tape) ) );

	if (head == EOF) return EOF;

	ungetc (head, tape);

	return 0;
}

/*
 * ID = [A-Za-z][A-Za-z0-9_]*
 */
int is_ID (FILE *tape)
{
	lexcursor = 0;

	lexeme[lexcursor] = getc (tape);

	if ( isalpha (lexeme[lexcursor]) ) {

		lexcursor++;

		while ( isalpha (lexeme[lexcursor] = getc (tape) ) ||
				isdigit (lexeme[lexcursor]) || 
				lexeme[lexcursor] == '_' ) {

			if (lexcursor < MAXIDLEN) {

				lexcursor++;

			}

		}

		ungetc ( lexeme[lexcursor], tape);

		lexeme[lexcursor] = 0;

		// printf("%s ", lexeme);

		return ID;
	}

	ungetc ( lexeme[lexcursor], tape);

	return 0;
}

/*
 * DEC = [1-9][0-9]* | '0'
 */
int is_DEC (FILE *tape)
{
	int head = getc (tape);

	if ( isdigit (head) ) {

		if (head != '0') {

			while ( isdigit (head = getc (tape) ) );

			ungetc ( head, tape);
		}

		return DEC;
	}

	ungetc ( head, tape);

	return 0;
}

/* visible module is gettokent below: */

int gettoken (FILE * tape)
{
	int token;

	if (token = skipspaces (tape)) return token;

	if (token = is_ID (tape)) return token;

	if (token = is_DEC (tape)) return token;

	return token = getc (tape);
}

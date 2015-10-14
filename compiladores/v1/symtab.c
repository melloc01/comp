/**
* symtab.c
*
* symbol matrix and utilities for 'interpreter'
*
*/

#include "symtab.h"
#include "exceptions.h"


char symtab[MAX_ENTRIES][MAXIDLEN + 1];

#ifndef MAX_ENTRIES
	#define MAX_ENTRIES 0x1000
#endif


int 	symtab_next_entry = 0;
double 	memory[MAX_ENTRIES];
double 	stack[MAX_ENTRIES];
int 	top = -1;

void storage(char *varname) {

	int address;

	if (address = symtab_lookup(varname) == -1) {

		// assigns symtab_next_entry to address and add symtab_next_entry
		address = symtab_next_entry++;

		if (add_symbol(varname, address)) {

			memory[address] = stack[top];

		}

	}

}

double retrieve(char *varname) {

	int address;

	if (address = symtab_lookup(varname) != -1) {
		return memory[address];
	}

	exit(UNDECLARED_VARIABLE_EXCEPTION);

}

bool add_symbol(char *varname, int address) {

	// test for MAX_ENTRIES
	strcpy(symtab[address], varname);

	return 1;

}

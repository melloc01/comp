##Alocação de maneira contígua

	.DATA
	value DW 0 			; DW = Define Word 2 Bytes
	sum DD 0			; DD = Define DoubleWord 4 Bytes
	marks times 10 DW 0 ; times = Aloca tantas vezes (no caso 10 Words)


##Definição de constantes numéricas

	%assign 	i 	j+1

##Transferência de memória
	
	mov	destination,source

	mov register,register
	mov register,immediate ; constantes ex. mov eax,1
	mov memory,immediate
	mov register,memory
	mov memory,register


###mov: formas de endereçamento

	response 	DB 'Y'			; aloca um byte inicializa pra 'Y'
	table1 		TIMES 20 DD 0 	; aloca 80 bytes, iniciados com 0
	name1 		DB 'Jim Ray'	; aloca 7 bytes e inicializa pra 'Jim Ray'

	mov AL, [response]			; copia 'Y' pro reg. AL
	mov [response], 'N'			; escreve N na resposta
	mov [name1],'K'
	mov [table1],[name1] 		

###lea:	Load Effective Address
	
	lea register,source

	lea EBX,[table1]		--> 	mov	EBX,table1

####Flexibilidade
	
	lea EBS, [array1+EBX]
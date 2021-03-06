grammar compilador;

/// Fragment ///
fragment LETRA: [a-zA-Z];
fragment DIGITO: [0-9];

/// Tokens ///
ENTERO: DIGITO+;

/// Palabras reservadas /// Estructura de control //
IF: 'if';
// Estructura de repeticion //
WHILE: 'while';
FOR: 'for';

/// Operadores ///
PYC: ';';
COMA: ',';
LA: '{';
LC: '}';
PA: '(';
PC: ')';
// Comparadores //
IGUAL: '=';
MENOR: '<';
MAYOR: '>';
// Operadores aritmeticos //
MAS: '+';
MENOS: '-';
MUL: '*';
DIV: '/';
MOD: '%';

/**** INICIO ****/
programa: lineas;
/** Jerarquia **/
lineas: instruccion lineas | | EOF;
instruccion:
	bloque
	| declaracion_variables
	| asignacion PYC
	| estructuras;

bloque: LA lineas LC;
estructuras: iwhile | iif | ifor;

/*-------------Definición de variables-------------*/
/*Tipo*/
INT: 'int';
DOUBLE: 'double';
CHAR: 'char';
tipo_dato: (INT | DOUBLE | CHAR);

/*ID*/
ID: (LETRA | '_') ((LETRA | DIGITO | '_'))*;

/*MATEO ZONE*/
asignable: ID | ENTERO | expresion; //Agregar funcion
decl_var: tipo_dato asig PYC;
asig:
	ID IGUAL asignable lista_asignaciones
	| ID lista_asignaciones;
lista_asignaciones: COMA asig | IGUAL asig |;
/*!MATEO ZONE*/

/*Declaración*/
declaracion_variables: tipo_dato ID la PYC;

/*Asignaciones*/
asignacion: ID IGUAL ID | ID IGUAL ENTERO | ID IGUAL expresion;

la: IGUAL ID la | IGUAL ENTERO | COMA ID la |;

/*-------------Operadores relacionales-------------*/
/* Declaracion */
operadores_relacionales: (IGUAL IGUAL)
	| MAYOR
	| MENOR
	| (MAYOR IGUAL)
	| (MENOR IGUAL);

/* Comparacion */
comparacion:
	ID operadores_relacionales ENTERO
	| ID operadores_relacionales ID
	| ENTERO operadores_relacionales ENTERO
	| ENTERO operadores_relacionales ID;

/** Operaciones aritmeticas **/
/* Jerarquia de terminos */
expresion:
	expresion MAS termino
	| expresion MENOS termino
	| termino;
termino:
	termino MUL factor
	| termino DIV factor
	| termino MOD factor
	| factor;
factor: PA expresion PC | ID | ENTERO;

/*-------------Estructuras-------------*/
/* If */
iif:
	IF PA comparacion PC
	| IF PA ENTERO PC
	| IF PA ID PC; // no contempla la forma if(true), solo comparacion
/* While */
iwhile: WHILE PA comparacion PC;
/* FOR */
ifor:
	FOR PA declaracion_variables comparacion PYC asignacion PC
	| FOR PA declaracion_variables comparacion PYC PC
	| FOR PA declaracion_variables PYC asignacion PC
	| FOR PA declaracion_variables PYC PC
	| FOR PA PYC comparacion PYC asignacion PC
	| FOR PA PYC comparacion PYC PC
	| FOR PA PYC PYC asignacion PC
	| FOR PA PYC PYC PC;

// ver la forma de i++

/*-------------Caracteres ignorados-------------*/
WS: [ \t\n\r] -> skip;
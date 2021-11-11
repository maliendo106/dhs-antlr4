grammar compilador;

fragment LETRA: [a-zA-Z];
fragment DIGITO: [0-9];
ENTERO: DIGITO+ ;
IF: 'if' ;
WHILE: 'while';
FOR: 'for' ;
PYC: ';' ;
IGUAL: '=' ;
COMA: ',' ;
MENOR: '<' ;
MAYOR: '>' ;
LA: '{' ;
LC: '}' ;
PA: '(' ;
PC: ')' ;
MAS: '+' ;
MENOS: '-' ;
MUL: '*' ;
DIV: '/' ;
MOD: '%' ;



/*DEFINICION DE PROGRAMA*/

programa: instrucciones;

instrucciones: inst instrucciones 
               |
               |EOF
               ;

inst: LA instrucciones LC
      | declaracion_variables
      | asignacion
      | iwhile
      | iif
      | ifor;

/*******************DEFINICION DE VARIABLES/*******************/

/*DEFINICION DE TIPOS*/
INT: 'int';
DOUBLE: 'double';
CHAR: 'char';

tipo_dato: (INT | DOUBLE | CHAR);

/*RECONOCIMIENTO DE ID*/

ID: (LETRA | '_') ((LETRA | DIGITO | '_'))*;

/* WHILE */

iwhile: WHILE PA comparacion PC ;

declaracion_variables: tipo_dato ID la PYC;

la: IGUAL ID la
    |IGUAL ENTERO
    |COMA ID la 
    | 
    ;



WS: [ \t\n\r]->skip;


/* Asignacion */
asignacion: ID IGUAL ID PYC
          | ID IGUAL ENTERO PYC
          | ID IGUAL expresion PYC
          ;

/* Operadores relacionales */

operadores_relacionales: (IGUAL IGUAL) 
                        | MAYOR 
                        | MENOR 
                        | (MAYOR IGUAL) 
                        | (MENOR IGUAL) 
                        ;

/* Comparacion */
comparacion: ID operadores_relacionales ENTERO
            |ID operadores_relacionales ID
            | ENTERO operadores_relacionales ENTERO
            | ENTERO operadores_relacionales ID
            ;


/* OPERACIONES ARITMETICAS */
expresion: expresion MAS termino 
          | expresion MENOS termino
          | termino
          ;

termino: termino MUL factor
        | termino DIV factor
        | termino MOD factor
        | factor
        ;

factor: PA expresion PC
        | ID
        | ENTERO
        ;




/* CONDICIONAL IF */
iif: IF PA comparacion PC ; // no contempla la forma if(true), solo comparacion

/* FOR */
ifor: FOR PA declaracion_variables comparacion PYC comparacion PC ;

// ver la forma de i++
/*
for(;;){

}
for(x=0, y=1, z=2; i < 5; i++)

for(i=0, w=5, t=w; i<5; i++, t=t+w) ;

asignaciones condiciones actualizacionesdelavariable
 */








/*grammar compilador;

fragment LETRA: [a-zA-Z];
fragment DIGITO: [0-9];

PA: '(';  
PC: ')';

PALABRA: (LETRA)+;
NUM_ENTERO: (DIGITO)+;

WS: [ \t\n\r]->skip;

si: s EOF;

s: PA s PC s
  |
  ;


 
grammar compilador;

fragment LETRA: [a-zA-Z];
fragment DIGITO: [0-9];
fragment MAS: '+';
fragment MENOS: '-';
fragment IGUAL: '=';
fragment MULT_DIV: [];


PALABRA: (LETRA)+;
NUM_ENTERO: (DIGITO)+;
SUMA: (NUM_ENTERO)MAS(NUM_ENTERO)IGUAL(NUM_ENTERO);
RESTA: (NUM_ENTERO)MENOS(NUM_ENTERO)IGUAL(NUM_ENTERO);
GENERIC_OP: (NUM_ENTERO)MULT_DIV(NUM_ENTERO)IGUAL(NUM_ENTERO);

WS: [ \t\n\r]->skip;

s: PALABRA {print("PALABRAA -> "+$PALABRA.text+"  "+str($PALABRA))} s | 
   NUM_ENTERO {print("NUMERO -> "+$NUM_ENTERO.text+"  "+str($NUM_ENTERO))} s | 
   SUMA {print("SUMA ->"+$SUMA.text)} s |
   RESTA {print("RESTA ->"+$RESTA.text)} s |
   GENERIC_OP {print("MULT o DIV ->"+$GENERIC_OP.text)} s |
   EOF;



 */
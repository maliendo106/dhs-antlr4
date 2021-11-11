from antlr4 import *
if __name__ is not None and "." in __name__:
    from .compiladorParser import compiladorParser
else:
    from compiladorParser import compiladorParser

# This class defines a complete listener for a parse tree produced by compiladorParser.
class miListener(ParseTreeListener):

    numDeclaraciones = 0

    # Enter a parse tree produced by compiladorParser#programa.
    def enterPrograma(self, ctx:compiladorParser.ProgramaContext):
        print("Comienza la compilacion")

    # Exit a parse tree produced by compiladorParser#programa.
    def exitPrograma(self, ctx:compiladorParser.ProgramaContext):
        print("se hicieron ", self.numDeclaraciones, " declaraciones")
        print("Terminamos!")


    # Enter a parse tree produced by compiladorParser#declaracion_variables.
    def enterDeclaracion_variables(self, ctx:compiladorParser.Declaracion_variablesContext):
        self.numDeclaraciones += 1
        print("----> Declaracion (in) -> " + ctx.getText())
        #ctx es el nombre de la variable que tiene el contexto, recive un subarbol creo

    # Exit a parse tree produced by compiladorParser#declaracion_variables.
    def exitDeclaracion_variables(self, ctx:compiladorParser.Declaracion_variablesContext):
        print("----> Declaracion (out) -> " + ctx.getText())
    
        


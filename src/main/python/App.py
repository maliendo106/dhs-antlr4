import sys
from antlr4 import *
from compiladorLexer import compiladorLexer
from compiladorParser import compiladorParser
#from main.python.miListener import miListener
#from fechasLexer import fechasLexer
#from fechasParser import fechasParser
from miListener import miListener  # agregado


def main(argv):
    archivo = "../../entrada.txt"  # entrada.txt
    if len(argv) > 1:
        archivo = argv[1]
    input = FileStream(archivo)
    lexer = compiladorLexer(input)
    stream = CommonTokenStream(lexer)
    parser = compiladorParser(stream)
    escucha = miListener()          # agregado
    parser.addParseListener(escucha)    # agregado
    tree = parser.programa()
    print(tree.toStringTree(recog=parser))


if __name__ == '__main__':
    main(sys.argv)

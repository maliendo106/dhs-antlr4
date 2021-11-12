from ID import *

class Funcion(ID):

    def __init__(self, parametros):
         self.parametros = parametros
         
# Parametros
    @property
    def parametros(self):
        return self.__parametros
    @parametros.setter
    def parametros(self,val):
        self.__parametros = val
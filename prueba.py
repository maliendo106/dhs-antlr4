
# ts = [{'a': 1}]
# print('a' in ts[0])
class Tabla():
    class __Tabla:
        def __init__(self):
            pass
    instance = None

    def __init__(self):
        if not Tabla.instance:
            Tabla.instance = Tabla.__Tabla()

    def __getattr__(self, name):
        return getattr(self.instance, name)

    ts = []

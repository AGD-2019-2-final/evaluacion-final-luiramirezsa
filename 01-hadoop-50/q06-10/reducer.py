import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    maximo = None
    minimo = None
    letra = None

    for line in sys.stdin:

        line = line.strip()
        cur_letra, cur_valor = line.split("\t")

        if cur_letra == letra:
          maximo = cur_valor if cur_valor >= maximo else maximo
          minimo = cur_valor if cur_valor < minimo else minimo
        else:
            if letra is not None:
              sys.stdout.write("{0}\t{1}\t{2}\n".format(letra, maximo, minimo))
            letra = cur_letra
            maximo = cur_valor
            minimo = cur_valor

    sys.stdout.write("{0}\t{1}\t{2}\n".format(letra, maximo, minimo))
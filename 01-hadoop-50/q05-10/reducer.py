import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    mes = None
    count = 0
  
    for line in sys.stdin:
        line = line.strip()
        cur_mes, val = line.split("\t")

        if mes == cur_mes:
            count = count + 1
        else:
            if mes is not None:
                sys.stdout.write("{}\t{}\n".format(mes, count))
    
            mes = cur_mes
            count = 1
    sys.stdout.write("{}\t{}\n".format(mes, count))

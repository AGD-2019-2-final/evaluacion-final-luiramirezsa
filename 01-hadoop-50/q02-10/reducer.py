import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    purpose = None
    max_amount = 0
  
    for line in sys.stdin:
        line = line.strip()
        cur_purpose, val = line.split("\t")

        if purpose == cur_purpose:
            if (int(val) > max_amount): max_amount = int(val)
        else:
            if purpose is not None:
                sys.stdout.write("{}\t{}\n".format(purpose, max_amount))
            purpose = cur_purpose
            max_amount = int(val)
    sys.stdout.write("{}\t{}\n".format(purpose, max_amount))
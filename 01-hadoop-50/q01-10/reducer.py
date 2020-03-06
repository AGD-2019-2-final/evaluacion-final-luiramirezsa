import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    credit_history = None
    count = 0
    for line in sys.stdin:
        line = line.strip()
        cur_credit_history, val = line.split("\t")

        if credit_history == cur_credit_history:
            count = count + 1
        else:
            if credit_history is not None:
                sys.stdout.write("{}\t{}\n".format(credit_history, count))
    
            credit_history = cur_credit_history
            count = 1
    sys.stdout.write("{}\t{}\n".format(credit_history, count))
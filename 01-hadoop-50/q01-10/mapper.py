import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        splits = line.split(",")
        sys.stdout.write("{}\t1\n".format(splits[2]))
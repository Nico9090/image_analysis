#!/usr/bin/env python3
from subprocess import call #This is to allow the program to automatically run the next file
def rm_ASCII(filename):
        sequences=' '
        with open(filepath, 'r')as f:
                for line in f:
                        if line[0]=='A' or line[0]=='T' or line[0]=='G' or line[0]=='C':
                                sequences+=line.rstrip('/n')
        return sequences
f=open(filepath,'w')
print(rm_ASCII(filepath),file=f)

find_perc=call('./percent_bases.sh')

#!/usr/bin/env python3
complement={'A':'T', 'C':'G', 'T':'A', 'G':'C'}
seq=input("Enter a strand: ")
bases=['A','T','C','G']
count=0
for nucleotide in seq:
        if nucleotide not in complement.keys():
                count+=1
if count>0:
        print('invalid')
#for nucelotide in seq:
        #print(complement[nucleotide])
for i in range(len(seq)):
        print (complement[seq[i]], end=' ')

#!/usr/bin/env python3
count_A=0
count_G=0
count_C=0
count_T=0
with open(filepath,'r')as f:
        bases=[]
        for line in f:
                bases+=line

for nucleotide in bases:
        if nucleotide == 'A':
                count_A+=1
        elif nucleotide =='T':
                count_T+=1
        elif nucleotide == 'C':
                count_C+=1
        elif nucleotide =='G':
                count_G+=1
perc_A=str((count_A/len(bases))*100)+"%"
perc_T=str((count_T/len(bases))*100)+"%"
perc_G=str((count_G/len(bases))*100)+"%"
perc_C=str((count_C/len(bases))*100)+"%"
print(perc_A, "A ", perc_T, "T ", perc_G,"G ",perc_C,"C ")

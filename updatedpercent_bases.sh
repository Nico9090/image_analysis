bases={'A':0, 'T':0, 'C':0, 'G':0}
with open('/root/nicko/seq_analysis#/prefetch/sra/SARS-COV-2/selectedline.txt','r')as f:
        for line in f:
                for nucleotides in line:
                        if nucleotides=='A' or nucleotides=='T' or nucleotides=='C' or nucleotides=='G':
                                bases[nucleotides]+=1
        print(bases)
total_bases=bases['A']+bases['T']+bases['C']+bases['G']
print(total_bases)

for nucleotides in bases:
        bases[nucleotides] = ((bases[nucleotides])/total_bases)
print(bases)

complement={'A':'T', 'C':'G', 'T':'A', 'G':'C'}
seq=input("Enter a strand: ")
bases=['A','T','C','G']
if 'A' not in seq:
        print('Invalid')
if 'C' not in seq:
        print('Invalid')
if 'T' not in seq:
        print('Invalid')
if 'G' not in seq:
        print('Invalid')
#Getting actual complement

def complement(sequence):
        complement={'A':'T', 'C':'G', 'T':'A', 'G':'C'}
        for base in sequence:
                return(complement.values())
print(complement(seq))

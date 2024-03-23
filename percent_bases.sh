#!/bin/bash

#Calculate how many of each nucleotide there is out of the total for each line

head -n 1 SARS-COV2_pure_genome.txt > selectedline.txt
./calc_perc.py

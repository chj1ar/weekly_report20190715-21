#! /bin/bash

python3 ~/GWAS_lipid_traits/lipidGWAS2bed.py --input-file $1 --output-directory $2

bedtools intersect -a ./tmp.zscore.bed -b ~/GWAS_lipid_traits/bed_Whole_Blood_v7_egenes_annotations/ld_chunk.bed -wa -wb | awk '{print $4"\t"$9"\t"$5}' > $3 

rm ./tmp.zscore.*


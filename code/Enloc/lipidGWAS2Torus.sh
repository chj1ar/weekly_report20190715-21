#! /bin/bash

python3 lipidGWAS2bed.py --input-file $1 --output-directory $2 --snp-table $3

cd $2

bedtools intersect -a tmp.zscore.bed -b $4 -wa -wb | awk '{print $4"\t"$9"\t"$5}' > $5

rm tmp.zscore.*


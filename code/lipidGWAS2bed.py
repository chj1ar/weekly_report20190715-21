#! /scratch/midway2/chj1ar/miniconda3/bin/python3

import pandas as pd
import numpy as np
import scipy.stats
import math
from argparse import ArgumentParser
import os

parser = ArgumentParser()
parser.add_argument("--input-file", help="lipid GWAS data")
parser.add_argument("--output-directory", help="output directory for bed file")
args=parser.parse_args()
 
# raw lipid GWAS data to GWAS z-score
GWAS_raw = pd.read_table(args.input_file, sep='\t') # raw lipid GWAS data

SNP = pd.read_table('/home/chj1ar/GWAS_lipid_traits/HDL/GCST004232/AGEN_lipids_hapmap_hdl_m2.txt.gz', sep='\t') # a reference table to convert SNP rsid to SNP chr+pos
SNP = SNP[SNP['CHR'] != 'Y']
SNP = SNP[SNP['CHR'] != 'X']
SNP['CHR'] = SNP['CHR'].apply(int)
SNP = SNP[['CHR', 'POS', 'MARKERNAME']] # extract the reference table
SNP.columns = ['chr', 'pos', 'MarkerName'] # to match GWAS_raw for pd.merge

GWAS = pd.merge(GWAS_raw, SNP, on=['MarkerName', ], how='left')
GWAS = GWAS[~GWAS['chr'].apply(math.isnan)] # remove SNPs whose rsid fails to find chr+pos
GWAS['chr'] = GWAS['chr'].apply(int)
GWAS['pos'] = GWAS['pos'].apply(int)
GWAS['Allele1'] = GWAS['Allele1'].str.upper()
GWAS['Allele2'] = GWAS['Allele2'].str.upper()
GWAS['SNP'] = GWAS[['chr', 'pos', 'Allele1', 'Allele2']].apply(lambda x: ':'.join([str(i) for i in x]), axis=1) # to match the requirement of the enrichment analysis pipeline (Torus)
os.chdir(args.output_directory)
GWAS[['SNP', 'GC.Zscore']].to_csv('tmp.zscore.txt', sep='\t', header=None, index=False)

# zscore2bed
GWAS_zscore = pd.read_table('tmp.zscore.txt', sep='\t', header=None)
GWAS_zscore['chr'] = GWAS_zscore[0].apply(lambda x: 'chr' + x.split(':')[0])
GWAS_zscore['start'] = GWAS_zscore[0].apply(lambda x: int(x.split(':')[1]))
GWAS_zscore['end'] = GWAS_zscore['start'].apply(lambda x: x + 1)
GWAS_zscore[['chr', 'start', 'end', 0, 1]].to_csv('tmp.zscore.bed', sep='\t', header=None, index=False)


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
parser.add_argument("--snp-table", help="SNP ChrPos <-> rsID")
args=parser.parse_args()
 
# raw lipid GWAS data to GWAS z-score
GWAS_raw = pd.read_table(args.input_file, sep='\t') # raw lipid GWAS data

SNPcomplete = pd.read_table(args.snp_table, sep='\t', header=None)
SNPcomplete.columns = ['chr', 'pos', 'MarkerName'] # to match GWAS_raw for pd.merge

GWAS = pd.merge(GWAS_raw, SNPcomplete, on=['MarkerName', ], how='left')
GWAS = GWAS[~GWAS['chr'].apply(math.isnan)] # remove SNPcompletes whose rsid fails to find chr+pos
GWAS['chr'] = GWAS['chr'].apply(int)
GWAS['pos'] = GWAS['pos'].apply(int)
GWAS['Allele1'] = GWAS['Allele1'].str.upper()
GWAS['Allele2'] = GWAS['Allele2'].str.upper()
GWAS['SNPcomplete'] = GWAS[['chr', 'pos', 'Allele1', 'Allele2']].apply(lambda x: ':'.join([str(i) for i in x]), axis=1) # to match the requirement of the enrichment analysis pipeline (Torus)
os.chdir(args.output_directory)
GWAS[['SNPcomplete', 'GC.Zscore']].to_csv('tmp.zscore.txt', sep='\t', header=None, index=False)

# zscore2bed
GWAS_zscore = pd.read_table('tmp.zscore.txt', sep='\t', header=None)
GWAS_zscore['chr'] = GWAS_zscore[0].apply(lambda x: 'chr' + x.split(':')[0])
GWAS_zscore['start'] = GWAS_zscore[0].apply(lambda x: int(x.split(':')[1]))
GWAS_zscore['end'] = GWAS_zscore['start'].apply(lambda x: x + 1)
GWAS_zscore[['chr', 'start', 'end', 0, 1]].to_csv('tmp.zscore.bed', sep='\t', header=None, index=False)


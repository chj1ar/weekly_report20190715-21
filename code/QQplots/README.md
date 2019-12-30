# diagnosis of enrichment analysis by QQ plots

## Goal
Diagnose whether there are too few eQTL SNPs in the eQTL PIP data.

## Background
As the result of the enrichment analysis using eQTL PIP data showed, the credible intervals of $\alpha_1$ were too large, suggesting that there were probably too few eQTL SNPs.

## Methods
Select the SNPs whose eQTL PIPs are more than a pre-specified PIP threshold as the eQTL SNPs. Select all SNPs in the GWAS data as the full GWAS. For each set of selected SNPs, draw a QQ plot of log(GWAS P-values) of the SNPs (i.e., Observed log(GWAS P-values)) vs. log(GWAS P-values) where P-values follow the standard uniform distribution (i.e., Expected log(GWAS P-values)). Then visually compare the 2 QQ plots. If the 2 curves are very close, then there are too few eQTL SNPs.

## Input
GWAS data, eQTL PIP data

## Output
QQ plots: Observed log(GWAS P-values) vs. Expected log(GWAS P-values)

## QQ plots of distribution of P-values of SNPs in various conditions

### QQplot_P-values.ipynb

There are so many data processing steps. Please take care of them and change whatever code when appropriate.


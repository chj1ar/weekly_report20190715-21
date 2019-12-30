# Preparing files for enrichment analysis (by Torus)

## Goal

Identify biologically relevant tissues to complex traits.

## Methods

The enrichment level is the ratio of the log odds of the SNP causal states to the complex trait given that the SNPs are eQTLs from a certain tissue, to that of the SNPs which are not eQTLs from the tissue. The formula is as follows.

$$log \frac {P(\gamma_i = 1)} {P(\gamma_i = 0)} = \alpha_0 + \alpha_1 d_i$$
where $\alpha_1$ is the enrichment level, $d_i$ means whether SNP i is an eQTL, and $\gamma_i$ is the causal state of SNP i to the complex trait.

## Input

GWAS data, binary eQTL data

## Output

$\alpha_1$, credible intervals of $\alpha_1$

## File locations preparation

### enrichment_file_preparation.sh

Usage: `./enrichment_file_preparation.sh`

This script is still under developing. But basically one only needs to change the file names upon different runs. Please refer to the script for details.


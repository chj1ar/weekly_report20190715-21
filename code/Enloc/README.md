# Reproducing Fig 5 of Enloc paper

## GWAS data preprocessing

`lipidGWAS2Torus.sh`: convert the lipid GWAS data to what Torus requires.
`~/Enloc/Enloc_GWAS.sh`: convert Torus GWAS format to Enloc GWAS format.

### lipidGWAS2Torus.sh

Usage: `./lipidGWAS2Torus.sh file_lipid_GWAS directory_Torus_GWAS file_SNP_table file_LD_chunk file_Torus_GWAS`
Example usage: `./lipidGWAS2Torus.sh ../../GWAS_lipid_traits/HDL/HDL_ONE_Europeans.tbl ../../GWAS_lipid_traits/HDL_zscore ../../GWAS_lipid_traits/SNPtable.csv ../../GWAS_lipid_traits/bed_Whole_Blood_v7_egenes_annotations/ld_chunk.bed HDL.zscore`

The first argument is the raw lipid GWAS data downloaded from [here](http://csg.sph.umich.edu/willer/public/lipids2010/). The second argument is the output directory of GWAS data for Torus. The third argument is the SNP table to correspond ChrPos with rsID. The fourth argument is the LD chunk bed file. The fifth argument is the file name you'd like for the GWAS data for Torus. (Decompress `GWAS_lipid_traits.tar.gz` before using 'Example usage')

### Enloc_GWAS.sh

Usage: `./Enloc_GWAS.sh file_Torus_GWAS file_Enloc_GWAS`
Example usage: `./Enloc_GWAS.sh ../../GWAS_lipid_traits/HDL_zscore/HDL.zscore ../../GWAS_lipid_traits/HDL.zscore`

The first argument is the output, i.e., the last argument, of `./lipidGWAS2Torus.sh`. The second argument is the file name you'd like for the GWAS data for Enloc. (Decompress `GWAS_lipid_traits.tar.gz` before using 'Example usage')

### plot_enrichment.R

This plotting script is still under developing. Please refer to the script for details.

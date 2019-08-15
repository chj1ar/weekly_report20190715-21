# Reproducing Fig 5 of Enloc paper

## GWAS data preprocessing

`lipidGWAS2Torus.sh`: convert the lipid GWAS data to what Torus requires.
`~/Enloc/Enloc_GWAS.sh`: convert Torus GWAS format to Enloc GWAS format.

### lipidGWAS2Torus.sh

Usage: `./lipidGWAS2Torus.sh file_lipid_GWAS directory_Torus_GWAS file_Torus_GWAS`

The first argument is the raw lipid GWAS data downloaded from [here](http://csg.sph.umich.edu/willer/public/lipids2010/). The second argument is the output directory of GWAS data for Torus. The third argument is the file name you'd like for the GWAS data for Torus.

### Enloc_GWAS.sh

Usage: `./Enloc_GWAS.sh file_Torus_GWAS file_Enloc_GWAS`

The first argument is the output, i.e., the last argument, of `./lipidGWAS2Torus.sh`. The second argument is the file name you'd like for the GWAS data for Enloc.


#! /bin/bash

mkdir /Users/cjr/Documents/GWAS_ATAC/bed_Whole_Blood_v7_egenes_annotations # make a directory for annotations. You can choose a path, but to make sure the 'GWAS_ATAC' folder should be all the same in the following paths.

gzip -cd /Users/cjr/Documents/GWAS_ATAC/GTEx/GTEx_Analysis_v7_eQTL/Whole_Blood.v7.egenes.txt.gz | awk '{print $3,$4,$5}' > /Users/cjr/Documents/GWAS_ATAC/bed_Whole_Blood_v7_egenes_annotations/temp.bed # copy the annotations to a .bed file. You can use any annotation in the 'GTEx_Analysis_v7_eQTL' folder, which is downloaded from GTEx.
 
awk '$1="chr"$1' /Users/cjr/Documents/GWAS_ATAC/bed_Whole_Blood_v7_egenes_annotations/temp.bed | sed '1d' > /Users/cjr/Documents/GWAS_ATAC/bed_Whole_Blood_v7_egenes_annotations/Whole_Blood_v7_egenes.bed # data preprocessing. again, modify the annotation file.

rm /Users/cjr/Documents/GWAS_ATAC/bed_Whole_Blood_v7_egenes_annotations/temp.bed # clean temporary files. again, modify the annotation file.

cp /Users/cjr/Documents/GWAS_ATAC/bed_annotations/{ld_chunk.bed,smap} /Users/cjr/Documents/GWAS_ATAC/bed_Whole_Blood_v7_egenes_annotations # copy common annotations (LD chunk & SNP map) to the annotations directory. the 'ld_chunk.bed' and 'smap' is in the current directory.

mkdir /Users/cjr/Documents/GWAS_ATAC/SCZGWAS_zscore_Whole_Blood_v7_egenes # make a directory for GWAS z-score

cp /Users/cjr/Documents/GWAS_ATAC/SCZGWAS_zscore/SCZGWAS.zscore.gz /Users/cjr/Documents/GWAS_ATAC/SCZGWAS_zscore_Whole_Blood_v7_egenes # copy the .zscore.gz file (which is in the current directory) to the GWAS z-score directory

mv /Users/cjr/Documents/GWAS_ATAC/SCZGWAS_zscore_Whole_Blood_v7_egenes/SCZGWAS.zscore.gz /Users/cjr/Documents/GWAS_ATAC/SCZGWAS_zscore_Whole_Blood_v7_egenes/SCZGWAS.zscore.Whole.Blood.v7.egenes.gz # rename the .zscore.gz file to match the directory name (the name of the .gz file must be replacing '_' of the name of the folder to '.').

# we have finished preparing all files, and we need to define some bash variables as the parameters of the enrichment analysis pipeline.
work_dir=/Users/cjr/Documents/GWAS_ATAC
anno_dir=/Users/cjr/Documents/GWAS_ATAC/bed_Whole_Blood_v7_egenes_annotations # the directory made at the very beginning.
z_file=/Users/cjr/Documents/GWAS_ATAC/SCZGWAS_zscore_Whole_Blood_v7_egenes/SCZGWAS.zscore.Whole.Blood.v7.egenes.gz # the same as the .gz file.
git_path=/Users/cjr/Documents/留学/暑研/Xin/reading_materials/5th/data/fine-mapping # the path for the 'gwas_enrichment.ipynb' workflow.
echo 'Whole_Blood_v7_egenes' > /Users/cjr/Documents/留学/暑研/Xin/reading_materials/5th/data/fine-mapping/data/Whole_Blood_v7_egenes_annotations.txt # single-annot
single=/Users/cjr/Documents/留学/暑研/Xin/reading_materials/5th/data/fine-mapping/data/Whole_Blood_v7_egenes_annotations.txt

cd $git_path
sos run workflow/gwas_enrichment.ipynb range2var_annotation --cwd $work_dir --annotation_dir $anno_dir --z-score $z_file --single-annot $single -v3
sos run workflow/gwas_enrichment.ipynb enrichment --cwd $work_dir --annotation_dir $anno_dir --z-score $z_file --single-annot $single -v3


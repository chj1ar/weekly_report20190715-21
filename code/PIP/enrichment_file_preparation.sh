#! /bin/bash

mkdir /Users/cjr/Documents/GWAS_SCZ/SCZGWAS_zscore_DAPG_pip_gt_Whole_Blood-filtered_variants

cp /Users/cjr/Documents/GWAS_ATAC/SCZGWAS_zscore/SCZGWAS.zscore.gz /Users/cjr/Documents/GWAS_SCZ/SCZGWAS_zscore_DAPG_pip_gt_Whole_Blood-filtered_variants # copy the .zscore.gz file (which is in the current directory) to the GWAS z-score directory

mv /Users/cjr/Documents/GWAS_SCZ/SCZGWAS_zscore_DAPG_pip_gt_Whole_Blood-filtered_variants/SCZGWAS.zscore.gz /Users/cjr/Documents/GWAS_SCZ/SCZGWAS_zscore_DAPG_pip_gt_Whole_Blood-filtered_variants/SCZGWAS.zscore.DAPG.pip.gt.Whole.Blood-filtered.variants.gz # rename the .zscore.gz file to match the directory name (the name of the .gz file must be replacing '_' of the name of the folder to '.').

cp /Users/cjr/Documents/GWAS_SCZ/DAPG/DAPG_pip_gt_Whole_Blood-filtered_variants.txt.gz /Users/cjr/Documents/GWAS_SCZ/SCZGWAS_zscore_DAPG_pip_gt_Whole_Blood-filtered_variants # copy the annotation .gz file to the GWAS z-score directory

mv /Users/cjr/Documents/GWAS_SCZ/SCZGWAS_zscore_DAPG_pip_gt_Whole_Blood-filtered_variants/DAPG_pip_gt_Whole_Blood-filtered_variants.txt.gz /Users/cjr/Documents/GWAS_SCZ/SCZGWAS_zscore_DAPG_pip_gt_Whole_Blood-filtered_variants/DAPG_pip_gt_Whole_Blood-filtered_variants.SCZGWAS.zscore.DAPG.pip.gt.Whole.Blood-filtered.variants.gz # rename the annotation file to match the naming system.

# we have finished preparing all files, and we need to define some bash variables as the parameters of the enrichment analysis pipeline.
work_dir=/Users/cjr/Documents/GWAS_SCZ
	z_file=/Users/cjr/Documents/GWAS_SCZ/SCZGWAS_zscore_DAPG_pip_gt_Whole_Blood-filtered_variants/SCZGWAS.zscore.DAPG.pip.gt.Whole.Blood-filtered.variants.gz # the same as the .gz file.
	git_path=/Users/cjr/Documents/留学/暑研/Xin/reading_materials/5th/data/fine-mapping # the path for the 'gwas_enrichment.ipynb' workflow.
	echo 'DAPG_pip_gt_Whole_Blood-filtered_variants' > /Users/cjr/Documents/留学/暑研/Xin/reading_materials/5th/data/fine-mapping/data/DAPG/DAPG_pip_gt_Whole_Blood-filtered_variants_annotations.txt # single-annot
single=/Users/cjr/Documents/留学/暑研/Xin/reading_materials/5th/data/fine-mapping/data/DAPG/DAPG_pip_gt_Whole_Blood-filtered_variants_annotations.txt

cd $git_path
sos run workflow/gwas_enrichment.ipynb enrichment --cwd $work_dir --z-score $z_file --single-annot $single -v3


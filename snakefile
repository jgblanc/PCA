
rule run_pca:
    input:
        "1kg_IDS/{POP}.txt"
    output:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec.var"
    shell:
        "plink -bcf ../../data/1kg/bcf/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5.20130502.genotypes.bcf --keep 1kg_IDS/{wildcards.POP}.txt --double-id --pca var-wts --out output/PCA/{wildcards.POP}/{wildcards.POP}_{wildcards.MAF} --maf {wildcards.MAF} --no-sex --allow-extra-chr --noweb"
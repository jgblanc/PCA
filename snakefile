
rule run_pca:
    input:
        "1kg_IDS/{POP}.txt"
    output:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec.var"
    shell:
        "plink -bcf ../../data/1kg/bcf/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5.20130502.genotypes.bcf --keep 1kg_IDS/{wildcards.POP}.txt --double-id --pca var-wts --out output/PCA/{wildcards.POP}/{wildcards.POP}_{wildcards.MAF} --maf {wildcards.MAF} --no-sex --allow-extra-chr --noweb"

rule plot_pca:
    input:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec.var"
    output:
        "output/figures/{POP}/{POP}_{MAF}_PCA.png"
    script:
        "scripts/plot_PCA.R"

rule add_evo_info:
    input:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec.var"
    output:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec.var.evo"
    script:
        "scripts/get_evo_info.py"

rule LD_pruning:
    input:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec.var.evo"
    output:
        "output/pruned/{POP}/{POP}_{MAF}.{window}_{step}_{thresh}.DA.prune.in"
    shell:
        """
        cut -f2,25 -d',' {input} > all_ss.temp
	awk '$2 != "NA"' FS=',' all_ss.temp | cut -f1 -d',' > all_ss.snps #Pick only D/A SNPs and get rsID 
        plink \
        --noweb \
        --bcf ../../data/1kg/bcf/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5.20130502.genotypes.bcf \
        --extract all_ss.snps \
        --make-bed \
        --out all_ss_plink \
	--allow-extra-chr
        plink \
        --bfile all_ss_plink \
        --indep-pairwise {wildcards.window} {wildcards.step} {wildcards.thresh} \
        --noweb \
        --out "output/pruned/{wildcards.POP}/{wildcards.POP}_{wildcards.MAF}.{wildcards.window}_{wildcards.step}_{wildcards.thresh}.DA"
	rm all_ss*
        """

rule plot_loadings:
    input:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec.var.evo",
	"output/pruned/{POP}/{POP}_{MAF}.{window}_{step}_{thresh}.DA.prune.in"
    output:
        "output/figures/{POP}/{POP}_{MAF}.{window}_{step}_{thresh}.png"
    script:
        "scripts/plot_loadings.R"
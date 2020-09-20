pops = ['ALL', 'EAS', 'EUR', 'SAS', 'AFR', 'AMR', 'AA', 'MX']
mafs = [0.01]
windows = [50]
steps = [5]
threshs = [0.5]

rule all:
    input:
        expand("output/figures/{POP}/{POP}_{MAF}_PCA.png", POP=pops, MAF=mafs),
	expand("output/figures/{POP}/{POP}_{MAF}.{window}_{step}_{thresh}.png", POP=pops, MAF=mafs, window=windows, step=steps, thresh=threshs)

rule run_pca:
    input:
        "1kg_IDS/{POP}.txt"
    output:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec",
	"output/PCA/{POP}/{POP}_{MAF}.eigenvec.var"
    shell:
        "plink -bfile ../../data/1kg/plink-files/files/ALL.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes --keep 1kg_IDS/{wildcards.POP}.txt --pca var-wts --out output/PCA/{wildcards.POP}/{wildcards.POP}_{wildcards.MAF} --maf {wildcards.MAF} --no-sex  --noweb --no-pheno"

rule plot_pca:
    input:
        "output/PCA/{POP}/{POP}_{MAF}.eigenvec"
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
        --bfile ../../data/1kg/plink-files/files/ALL.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes \
        --extract all_ss.snps \
        --make-bed \
        --out all_ss_plink 
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
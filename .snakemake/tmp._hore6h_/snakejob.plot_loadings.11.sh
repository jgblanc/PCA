#!/bin/sh
# properties = {"type": "single", "rule": "plot_loadings", "local": false, "input": ["output/PCA/SAS/SAS_0.01.eigenvec.var.evo", "output/pruned/SAS/SAS_0.01.50_5_0.5.DA.prune.in"], "output": ["output/figures/SAS/SAS_0.01.50_5_0.5.png"], "wildcards": {"POP": "SAS", "MAF": "0.01", "window": "50", "step": "5", "thresh": "0.5"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 11, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/plot_loadings.MAF=0.01,POP=SAS,step=5,thresh=0.5,window=50.out", "error": "logs/plot_loadings.MAF=0.01,POP=SAS,step=5,thresh=0.5,window=50.err", "job-name": "plot_loadings.MAF=0.01,POP=SAS,step=5,thresh=0.5,window=50"}}
 cd /project2/jjberg/jgblanc/PCA && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/figures/SAS/SAS_0.01.50_5_0.5.png --snakefile /project2/jjberg/jgblanc/PCA/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_ output/PCA/SAS/SAS_0.01.eigenvec.var.evo output/pruned/SAS/SAS_0.01.50_5_0.5.DA.prune.in --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules plot_loadings --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_/11.jobfinished || (touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_/11.jobfailed; exit 1)


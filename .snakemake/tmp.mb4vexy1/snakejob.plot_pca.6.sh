#!/bin/sh
# properties = {"type": "single", "rule": "plot_pca", "local": false, "input": ["output/PCA/MX/MX_0.01.eigenvec"], "output": ["output/figures/MX/MX_0.01_PCA.png"], "wildcards": {"POP": "MX", "MAF": "0.01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 6, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/plot_pca.MAF=0.01,POP=MX.out", "error": "logs/plot_pca.MAF=0.01,POP=MX.err", "job-name": "plot_pca.MAF=0.01,POP=MX"}}
 cd /project2/jjberg/jgblanc/PCA && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/figures/MX/MX_0.01_PCA.png --snakefile /project2/jjberg/jgblanc/PCA/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/PCA/.snakemake/tmp.mb4vexy1 output/PCA/MX/MX_0.01.eigenvec --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules plot_pca --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp.mb4vexy1/6.jobfinished || (touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp.mb4vexy1/6.jobfailed; exit 1)


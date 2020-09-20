#!/bin/sh
# properties = {"type": "single", "rule": "plot_pca", "local": false, "input": ["output/PCA/ALL/ALL_0.01.eigenvec"], "output": ["output/figures/ALL/ALL_0.01_PCA.png"], "wildcards": {"POP": "ALL", "MAF": "0.01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 1, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/plot_pca.MAF=0.01,POP=ALL.out", "error": "logs/plot_pca.MAF=0.01,POP=ALL.err", "job-name": "plot_pca.MAF=0.01,POP=ALL"}}
 cd /project2/jjberg/jgblanc/PCA && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/figures/ALL/ALL_0.01_PCA.png --snakefile /project2/jjberg/jgblanc/PCA/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/PCA/.snakemake/tmp.rz_5ea7r output/PCA/ALL/ALL_0.01.eigenvec --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules plot_pca --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp.rz_5ea7r/1.jobfinished || (touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp.rz_5ea7r/1.jobfailed; exit 1)


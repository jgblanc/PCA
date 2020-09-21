#!/bin/sh
# properties = {"type": "single", "rule": "LD_pruning", "local": false, "input": ["output/PCA/ALL/ALL_0.01.eigenvec.var.evo"], "output": ["output/pruned/ALL/ALL_0.01.50_5_0.5.DA.prune.in"], "wildcards": {"POP": "ALL", "MAF": "0.01", "window": "50", "step": "5", "thresh": "0.5"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 28, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/LD_pruning.MAF=0.01,POP=ALL,step=5,thresh=0.5,window=50.out", "error": "logs/LD_pruning.MAF=0.01,POP=ALL,step=5,thresh=0.5,window=50.err", "job-name": "LD_pruning.MAF=0.01,POP=ALL,step=5,thresh=0.5,window=50"}}
 cd /project2/jjberg/jgblanc/PCA && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/pruned/ALL/ALL_0.01.50_5_0.5.DA.prune.in --snakefile /project2/jjberg/jgblanc/PCA/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/PCA/.snakemake/tmp.mb4vexy1 output/PCA/ALL/ALL_0.01.eigenvec.var.evo --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules LD_pruning --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp.mb4vexy1/28.jobfinished || (touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp.mb4vexy1/28.jobfailed; exit 1)


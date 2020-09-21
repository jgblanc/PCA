#!/bin/sh
# properties = {"type": "single", "rule": "run_pca", "local": false, "input": ["1kg_IDS/MX.txt"], "output": ["output/PCA/MX/MX_0.01.eigenvec", "output/PCA/MX/MX_0.01.eigenvec.var"], "wildcards": {"POP": "MX", "MAF": "0.01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 22, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/run_pca.MAF=0.01,POP=MX.out", "error": "logs/run_pca.MAF=0.01,POP=MX.err", "job-name": "run_pca.MAF=0.01,POP=MX"}}
 cd /project2/jjberg/jgblanc/PCA && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/PCA/MX/MX_0.01.eigenvec --snakefile /project2/jjberg/jgblanc/PCA/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_ 1kg_IDS/MX.txt --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules run_pca --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_/22.jobfinished || (touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_/22.jobfailed; exit 1)


#!/bin/sh
# properties = {"type": "single", "rule": "add_evo_info", "local": false, "input": ["output/PCA/MX/MX_0.01.eigenvec.var"], "output": ["output/PCA/MX/MX_0.01.eigenvec.var.evo"], "wildcards": {"POP": "MX", "MAF": "0.01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 35, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/add_evo_info.MAF=0.01,POP=MX.out", "error": "logs/add_evo_info.MAF=0.01,POP=MX.err", "job-name": "add_evo_info.MAF=0.01,POP=MX"}}
 cd /project2/jjberg/jgblanc/PCA && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake output/PCA/MX/MX_0.01.eigenvec.var.evo --snakefile /project2/jjberg/jgblanc/PCA/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_ output/PCA/MX/MX_0.01.eigenvec.var --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules add_evo_info --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_/35.jobfinished || (touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp._hore6h_/35.jobfailed; exit 1)


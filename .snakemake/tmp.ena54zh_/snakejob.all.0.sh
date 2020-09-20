#!/bin/sh
# properties = {"type": "single", "rule": "all", "local": true, "input": ["output/figures/ALL/ALL_0.01_PCA.png", "output/figures/ALL/ALL_0.01.50_5_0.5.png"], "output": [], "wildcards": {}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 0, "cluster": {"mem": 16000, "partition": "broadwl", "ntasks": 1, "tasks": 1, "mem-per-cpu": 2000, "output": "logs/all..out", "error": "logs/all..err", "job-name": "all."}}
 cd /project2/jjberg/jgblanc/PCA && \
/software/python-3.7.0-el7-x86_64/bin/python \
-m snakemake all --snakefile /project2/jjberg/jgblanc/PCA/snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /project2/jjberg/jgblanc/PCA/.snakemake/tmp.ena54zh_ output/figures/ALL/ALL_0.01_PCA.png output/figures/ALL/ALL_0.01.50_5_0.5.png --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
  -p --allowed-rules all --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp.ena54zh_/0.jobfinished || (touch /project2/jjberg/jgblanc/PCA/.snakemake/tmp.ena54zh_/0.jobfailed; exit 1)


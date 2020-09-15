# Plot PC1 vs PC2 from .eigenvec file 

library(tidyverse)
library(data.table)

vecs <- fread(snakemake@input[[1]])
pop_info <- fread("1kg_IDS/20130606_sample_info.txt")

dat <- inner_join(vecs, pop_info, by = c("V2"= "Sample"))
print(nrow(dat))
p1 <- ggplot(data = dat, aes(x=V3, y=V4, color = Population)) + geom_point() + xlab("PC1") + ylab("PC2")

ggsave(snakemake@output[[1]], p1)

#! ~/R-3.4.1/bin/R

This is just an example. In practice, one needs to change the files and trait names.

file = '~/Enloc/workspace_HDL/HDL_blood/HDL.enrich.est' # the file should be the result of enrichment analysis of Enloc one just performed.
enrichment <- read.csv(file = file, sep = '', header = FALSE)
enrichment <- enrichment[2,]
colnames(enrichment) <- c("LOR", "low", "high")
ggplot(data = enrichment) + geom_pointrange(aes(x = "HDL", y = LOR, ymin = low, ymax = high)) # the trait should be what is being analyzed.
 

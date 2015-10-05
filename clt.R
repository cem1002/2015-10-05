library(dplyr)
library(ggplot2)

source("magic.R")

# Number of replications (to get fine results)
k <- 10000

# Sample size
n <- 100

rs1_samples <- replicate(k, random_source_1(sample_size = n))

## Histogram of all samples put together. Used qplot for simplicity with this
## completely artificial plot.
qplot(unlist(rs1_samples), binwidth=0.2)

rs1_samp_aves <- data_frame(sample_averages = sapply(rs1_samples, mean))
ggplot(rs1_samp_aves, aes(x=sample_averages)) + geom_histogram(binwidth=0.02)

rs2_samples <- replicate(k, random_source_2(sample_size = n))
qplot(unlist(rs2_samples), binwidth=0.2)

rs2_samp_aves <- data_frame(sample_averages=sapply(rs2_samples, mean))
ggplot(rs2_samp_aves, aes(x=sample_averages)) + geom_histogram(binwidth=0.02)

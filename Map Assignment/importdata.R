#importing my data

library(cancensus)

census_data <- get_census(dataset='CA16', regions=list(CSD="3525005"), vectors=c("v_CA16_43","v_CA16_64"), labels="detailed", geo_format=NA, level='CT')

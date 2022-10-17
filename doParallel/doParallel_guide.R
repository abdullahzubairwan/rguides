# DoParallel Guide
# by: Abdullah Zubair
# 19th May 2020

# 1.0 Library
library(doParallel)

# 2.0 Create Dummy Data
set.seed(123)

sample_df = data.frame(col1 = rnorm(10000, mean=50, sd=10),col2 = rnorm(10000, mean=16, sd=10))

# 3.0 Setting Parameters for Parallel Run

# 3.1 Number of cores you want to use
workers = 7 
# 3.2 Register Cluster
ccl = makeCluster(workers)
registerDoParallel(ccl)

# 3.3 Create Index for Parallel to subset
# This for loop will divide index for each core to pickup the data
bloks = list()
div = ceiling(nrow(sample_df)/workers)
for (i in 1:workers) {
  k = ifelse(i == 1,1,j+1)
  j = ifelse(i != workers,div*i,nrow(sample_df))
  bloks[[i]] = k:j 
}

# 4.0 Run Parallel
# Since parallel run in its own environment, you MUST input the needed packages for your process unless it is a base package.
tryloop = foreach(l=1:workers, .packages = c("dplyr")) %dopar% {
  # subset the dataframe
  get_df = sample_df[unlist(bloks[[l]]),]
  
  get_df = get_df %>% mutate(col3 = col1+col2)
  # you can also run a for loop inside the parallel
  # k = 1
  # for(i in 1:nrow(get_df)){
  #   # do something
  # }
  
  # Since it is a function, you must return an object
  return(get_df)
}

# After finish, it will return a list. Simply rbind or subset as you wish
dfbind = do.call("rbind", tryloop)

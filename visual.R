library(tidyverse)
library(ggplot2)


#drift_regr

setwd("C:\\Users\\huonf\\workspace\\591\\results\\1.1 drift")

#regr
file_names <- c("1.1.01_regr.csv","1.1.02_regr.csv","1.1.03_regr.csv")
files <- file_names %>%
  lapply(read.csv, comment.char = "#")%>%
  lapply(select, (contains("current_mse_.")))


for(i in seq(1:length(file_names))){
  file <- files[[i]]
  fname <- file_names[i]
  colnames(file) <- colnames(file) %>% str_replace("current_mse_","") %>% str_replace(".","")
  file$num <- seq(1:nrow(file))*200
  file <- file %>% gather("Learner","MSE",-num)

   plot <- ggplot(file)+ aes(y=MSE,x=num,colour=Learner) + geom_line()+scale_y_continuous(trans='log10')
   save_name <- paste("current_mse",fname,sep="_") %>% str_replace(".csv","")%>% paste0(".png")
   print(save_name)
   show(plot)
   ggsave(save_name)
}

#class
file_names <- c("1.1.01_class.csv","1.1.02_class.csv","1.1.03_class.csv")
files <- file_names %>%
  lapply(read.csv, comment.char = "#") %>%
  lapply(select, (contains("current_acc_.")))


for(i in seq(1:length(file_names))){
  file <- files[[i]]
  fname <- file_names[i]
  colnames(file) <- colnames(file) %>% str_replace("current_acc_","") %>% str_replace(".","")
  file$num <- seq(1:nrow(file))*200
  file <- file %>% gather("Learner","Accuracy",-num)

  plot <- ggplot(file)+ aes(y=Accuracy,x=num,colour=Learner) + geom_line()
  save_name <- paste("current_acc",fname,sep="_") %>% str_replace(".csv","")%>% paste0(".png")
  print(save_name)
  show(plot)
  ggsave(save_name)
}




#no_drift_regr

setwd("C:\\Users\\huonf\\workspace\\591\\results\\1.0 no_drift")

#regr
file_names <- c("1.001_regr.csv","1.002_regr.csv","1.003_regr.csv",
                "1.01_regr.csv","1.02_regr.csv","1.03_regr.csv",
                "1.04_regr.csv","1.05_regr.csv","1.06_regr.csv",
                "1.07_regr.csv","1.08_regr.csv","1.09_regr.csv")
files <- file_names %>%
  lapply(read.csv, comment.char = "#")%>%
  lapply(select, (contains("current_mse_.")))


for(i in seq(1:length(file_names))){
  file <- files[[i]]
  fname <- file_names[i]
  colnames(file) <- colnames(file) %>% str_replace("current_mse_","") %>% str_replace(".","")
  file$num <- seq(1:nrow(file))*200
  file <- file %>% gather("Learner","MSE",-num)

  plot <- ggplot(file)+ aes(y=MSE,x=num,colour=Learner) + geom_line()+scale_y_continuous(trans='log10')
  save_name <- paste("current_mse",fname,sep="_") %>% str_replace(".csv","")%>% paste0(".png")
  print(save_name)
  show(plot)
  ggsave(save_name)
}






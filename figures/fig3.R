library(ggplot2)
library(dplyr)

raw <- read.csv('force.csv',header=TRUE)
data <- tibble(raw)

fig3 <- ggplot(data,aes(x=x_m,y=F_N))+
     geom_hline(yintercept=0,color="gray70")+
     geom_point(color="skyblue")+
     stat_summary(fun=mean,geom="line",color="skyblue")+
     stat_summary(fun=mean,geom="area",fill="skyblue",alpha=0.5)+
     xlab('$x$, \\unit{\\meter}')+
     ylab('$F$, \\unit{\\newton}')+
     theme_bw(base_size=8)
ggsave('fig3.svg',plot=fig3,width=3.4167,height=2,units="in")

# get area using trapz in pracma package
library(pracma)
print(trapz(data$x_m,data$F_N))
# gives 0.1573

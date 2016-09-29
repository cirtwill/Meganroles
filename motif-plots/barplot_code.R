#barplot with motif i.d's
zscore[which(zscore==888888.000)]=NA
data2["new_zscore"]<-zscore
dat<-na.omit(data2)
newdata<-subset(dat, zscore >2 | zscore <(-2), select=c(motif,zscore)) 

barplot(newdata$zscore,names.arg=(newdata$motif),ylab="zscore",xlab="motif structure")

#make plot larger to include all i.d's and screen shot



#line graph with motif i.d's
jpeg('met_line.jpg')
plot(newdata,xlab="motif structure",ylab="zcore",xlim=c(2,6616))
lines(newdata$motif,newdata$zscore, type="l")
abline(a=0,b=0)
library(Hmisc)
minor.tick(nx=10, tick.ratio=.5)
dev.off()
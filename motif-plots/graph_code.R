### USING FREQUENCY ###

## attaching the metropolis data and creating scatter plot comparing to the real network
data1<- read.table('output_metropolis.txt', header = TRUE)
attach(data1)
a = (1:199)
jpeg('metropolis_plot.jpg')
par(mfrow=c(2,1))
plot(a,real,xlab="motif",ylab="frequency",main="Real Network")
plot(a,rand,xlab="motif",ylab="frequency",main="Metropolis Network")
dev.off()

## attaching the random data and creating scatter plot comparing to the real network
data2<- read.table('output_com_random.txt', header = TRUE)
attach(data2)
jpeg('random_plot.jpg')
par(mfrow=c(2,1))
plot(a,real,xlab="motif",ylab="frequency",main="Real Network")
plot(a,rand,xlab="motif",ylab="frequency",main="Random Network")
dev.off()

#to omit the motifs that appear 0 times
real[which(real==0)] = NA
dat<-data.frame(a,real)
na.omit(dat)

rand[which(rand==0)] = NA
dat2<-data.frame(a,rand)
na.omit(dat2)

## metropolis data with NA's removed
data3<- read.table('output_metropolis.txt', header = TRUE)
attach(data3)
a = (1:199)
real[which(real==0)] = NA
dat<-data.frame(a,real)
datreal<- na.omit(dat)
rand[which(rand==0)] = NA
dat2<-data.frame(a,rand)
datmet<-na.omit(dat2)
jpeg('metropolis_plot2.jpg')
par(mfrow=c(2,1))
plot(datreal,xlab="motif",ylab="frequency",main="Real Network")
plot(datmet,xlab="motif",ylab="frequency",main="Metropolis Network")
dev.off()

##random data with NA's removed
data4<- read.table('output_com_random.txt', header = TRUE)
attach(data4)
a = (1:199)
real[which(real==0)] = NA
dat<-data.frame(a,real)
datreal<- na.omit(dat)
rand[which(rand==0)] = NA
dat2<-data.frame(a,rand)
datran<-na.omit(dat2)
jpeg('random_plot2.jpg')
par(mfrow=c(2,1))
plot(datreal,xlab="motif",ylab="frequency",main="Real Network")
plot(datmet,xlab="motif",ylab="frequency",main="Random Network")
dev.off()

##metropolis data with NA's removed - overlaying points
data5<- read.table('output_metropolis.txt', header = TRUE)
attach(data5)
a = (1:199)
real[which(real==0)] = NA
dat<-data.frame(a,real)
datreal<- na.omit(dat)
rand[which(rand==0)] = NA
dat2<-data.frame(a,rand)
datran<-na.omit(dat2)
jpeg('metropolis_plot3.jpg')
plot(datreal,xlab="motif",ylab="frequency",main="Network Motifs, n=4",col="blue")
points(datran)
legend("topright", c("real network","metropolis network"), lty=c(0,0), col=c("blue","black"),pch=1)
dev.off()

##random data with NA's removed - overlaying points
data6<- read.table('output_com_random.txt', header = TRUE)
attach(data6)
a = (1:199)
real[which(real==0)] = NA
dat<-data.frame(a,real)
datreal<- na.omit(dat)
rand[which(rand==0)] = NA
dat2<-data.frame(a,rand)
datran<-na.omit(dat2)
jpeg('random_plot3.jpg')
plot(datreal,xlab="motif",ylab="frequency",main="Network Motifs, n=4",col="blue")
points(datran)
legend("topright", c("real network","random network"), lty=c(0,0), col=c("blue","black"),pch=1)
dev.off()




### USING N=3 DATA ###

## bar plot of z scores
data4<- read.table('three_n.txt', header = TRUE)
attach(data4)
zscore[which(zscore==888888.000)]=NA
jpeg('n3_zscore_bar.jpg')
barplot(zscore,names.arg=c(1:13),xlab="motif structure",ylab="zscore")
dev.off()

## line graph of z scores
data4<- read.table('three_n.txt', header = TRUE)
attach(data4)
a = (1:13)
zscore[which(zscore==888888.000)]=0
jpeg('n3_zscore_line.jpg')
plot(zscore,xlab="motif structure",ylab="zcore",xlim=c(1,13))
lines(a,zscore, type="l")
library(Hmisc)
minor.tick(nx=2, tick.ratio=1)
abline(a=0,b=0)
dev.off()




### USING ZCORES ###

## random data - bar plot of zscore
data2<- read.table('output_random.txt', header = TRUE)
attach(data2)
zscore[which(zscore==888888.000)]=NA
jpeg('ran_zscore_bar.jpg')
barplot(zscore,names.arg=c(1:199),xlab="motif structure",ylab="zscore")
dev.off()

## random data - line graph of zscore
data2<- read.table('output_random.txt', header = TRUE)
attach(data2)
a = (1:199)
zscore[which(zscore==888888.000)]=0
jpeg('ran_zscore_line.jpg')
plot(zscore,xlab="motif structure",ylab="zcore",xlim=c(1,199))
lines(a,zscore, type="l")
library(Hmisc)
minor.tick(nx=48, tick.ratio=.5)
abline(a=0,b=0)
dev.off()

## metropolis data - bar plot of zscores
data2<- read.table('output_metropolis.txt', header = TRUE)
attach(data2)
zscore[which(zscore==888888.000)]=NA
jpeg('met_zscore_bar.jpg')
barplot(zscore,names.arg=c(1:199),xlab="motif structure",ylab="zscore")
dev.off()

## metropolis data - line graph of zscore
data2<- read.table('output_metropolis.txt', header = TRUE)
attach(data2)
a = (1:199)
zscore[which(zscore==888888.000)]=0
jpeg('met_zscore_line.jpg')
plot(zscore,xlab="motif structure",ylab="zcore",xlim=c(1,199))
lines(a,zscore, type="l")
library(Hmisc)
minor.tick(nx=48, tick.ratio=.5)
abline(a=0,b=0)
dev.off()




## CREATING ZSCORE CUTOFF POINT (-2 & 2)##

data2<- read.table('output_metropolis.txt', header = TRUE)
attach(data2)

#barplot/line graph without motif i.d's
zscore1 <- zscore[which(zscore<(-2))] 
zscore2 <- zscore[which(zscore>2)] 
zscore2[which(zscore2==888888.000)]=NA
newzscore2<-na.omit(zscore2)
new<-c(zscore1,newzscore2)
plot(new)
barplot(new)


#barplot/line graph with motif i.d's
zscore[which(zscore==888888.000)]=NA
data2["new_zscore"]<-zscore
dat<-na.omit(data2)
newdata<-subset(dat, zscore >2 | zscore <(-2), select=c(motif,zscore)) 

jpeg('met_line.jpg')
plot(newdata,xlab="motif structure",ylab="zcore",xlim=c(2,6616))
lines(newdata$motif,newdata$zscore, type="l")
abline(a=0,b=0)
library(Hmisc)
minor.tick(nx=10, tick.ratio=.5)
dev.off()

barplot(newdata$zscore,names.arg=(newdata$motif),ylab="zscore",xlab="motif structure")
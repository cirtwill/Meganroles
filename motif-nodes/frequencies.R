options <- commandArgs(trailingOnly = TRUE)

data<-read.table(options[],header=TRUE)
attach(data)


###real[which(real==0)]= NA  ### include this to remove line when real = 0
newreal<-cbind(motif,real)
#newdata<-as.vector(na.omit(real))
newdat<-na.omit(newreal)
newdata<-as.data.frame(newdat)

freqfile<-sub("output","frequencies",options)  #Makes a new file in the frequencies folder

#newdata$id<- apply(newdata,1,function(row) freqfile)

#sapply(newdata$id,switch,'frequency/id'="") #only switchs full lines

part1<-strsplit(as.character(freqfile),".web.out")
part2<-unlist(strsplit(as.character(part1),"/"))
id<-part2[3]



#df<-data.frame(id= freqfile)
#df$part1<-lapply(strsplit(as.character(df$id), "\\.web.out"), "]",2)
#df$part2<-lapply(strsplit(as.character(df$id), "\\id"), "[", 1)

dat<-data.frame(newdata,id) 
#names(dat)[3] <- "id"

#dat = dat[-1,]

#print(dat)

#outfile=paste('frequencies/',options[1], sep="")

write.csv(dat,file=freqfile,row.names=FALSE,quote=FALSE)

##THIS STILL WRITES THE DATA OVER ORGINAL OUTPUT - need to fix this##

#now to read this file into R remember sep=","


#THIS IS TO TAKE THE OUTPUT REMOVE REDUNDANT COLUMNS, OMIT ROWS WITH ZEROS, INCLUDE ID COLUMN, WRITE TO CSV FILE

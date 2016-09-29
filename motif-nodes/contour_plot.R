dat<-read.table("",header=TRUE)
attach(dat)
mat<-matrix(real,13)
dimnames(mat)<-list((1:13),(1:199))
cormat<-cor(mat)

library(gplots)
filled.contour(cormat,main="")

#attempt to label axes
matrix.axes <- function(data) {
# Do the rows, las=2 for text perpendicular to the axis
x <- (1:dim(data)[1] - 1) / (dim(data)[1] - 1);
axis(side=1, at=x, labels=rownames(data), las=2);
# Do the columns
x <- (1:dim(data)[2] - 1) / (dim(data)[2] - 1);
axis(side=2, at=x, labels=colnames(data), las=2);
}

filled.contour(cormat, plot.axes=matrix.axis)



#to change the colour
library(gplots)
colorpanel(7, "white", "grey10")
filled.contour(cormat,col=colorpanel(7,"white","grey10"),nlevels=7)










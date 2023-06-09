timeseries_plot <- function(Var,time,rdata,unit,ilog=FALSE,label=NULL,range=NULL,uselim=TRUE,xrange=NULL,color="black",linetype="solid"){
  if (ilog) {
    rdata <- log(rdata) #Might have 'log zero' error, need to add check
    logtxt <- "log of"
  }else {
    logtxt <- ""
  }
  
  ylimit <- get_ylim(rdata,range)
  xlimit <- get_ylim(time,xrange)
  
  plot(time,rdata,yaxt="n",type="l",ylab="",xlab="",main=paste(Var,label),ylim=ylimit,xlim=xlimit,col=color,lty=linetype);
  mtext(paste(logtxt,unit),side=3,line=.2,cex=0.8)
  if(uselim){
    axis(2, at=get_lab(ylimit), labels=get_lab(ylimit), las=2)
  }else{
    axis(2, las=2)
  }
  
}


#Adds lines to an existing plot, can change color but not labels or ranges (for comparisons)
timeseries_addlines <- function(Var,time,rdata,color="red",linewidth=1,linetype="solid"){
  lines(time,rdata,col=color,lwd=linewidth,lty=linetype)
}


get_ylim <- function(indata,range) {
  ymin <- min(indata,na.rm=TRUE)
  ymax <- max(indata,na.rm=TRUE)
  if(!is.null(range)){
    ymin <- range[1]
    ymax <- range[2]
  }
  c(ymin,ymax)
}

get_ylim_for2 <- function(indata,indata2,range) {
  ymin <- (min( min(indata,na.rm=TRUE), min(indata2,na.rm=TRUE) ));
  ymax <- (max( max(indata,na.rm=TRUE), max(indata2,na.rm=TRUE) ));
  if(!is.null(range)){
    ymin <- range[1]
    ymax <- range[2]
  }
  c(ymin,ymax)
}

get_lab <- function(ylimit){
  ymin <- ylimit[1]
  ymax <- ylimit[2]
  ymid <- ymin + (ymax-ymin)/2.
  ymin <- signif(ymin,digits=2)
  ymax <- signif(ymax,digits=2)
  ymid <- signif(ymid,digits=2)
  c(ymin,ymid,ymax)
}

library(BSDA)
hasil<-tsum.test(mean.x=3.64, s.x = 1.67, n.x =20 , 
          mean.y =2.79 , s.y = 1.5,
          n.y = 27, alternative = "greater", 
          mu = 0, var.equal = TRUE,
          conf.level = 0.95)

hasil$statistic

qt(p=.025/2, df=2, lower.tail=FALSE)
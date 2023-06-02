library(BSDA)
tsum.test(mean.x=3.64, s.x = 1.67, n.x =20 , 
          mean.y =2.79 , s.y = 1.5,
          n.y = 27, alternative =  "two.sided", 
           var.equal = TRUE,
          conf.level = 0.95)

qt(p=.025/2, df=2, lower.tail=FALSE)

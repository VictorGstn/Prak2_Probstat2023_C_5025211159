data1 = data.frame(Responden=c(1:9),
                  x =c(78,75,67,77,70,72,78,70,77),
                  y = c(100,95,70,90,90,90,89,100,100))
dif= data1$y - data1$x
sd(dif)

library(BSDA)
t.test(dif, alternative = "two.sided")

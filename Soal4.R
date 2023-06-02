data <- read.csv("D:\\Downloads\\GTL.csv", header=TRUE, stringsAsFactors=FALSE)

library(ggpubr)

ggplot(data, aes(x = Glass, y = Temp, color = Light)) +
  geom_jitter(width = .02)

res <- aov(Light ~ Glass * Temp , data = data)

summary(res)

library(dplyr)

data %>%
  group_by(Glass, Temp) %>%
  summarize(
    mean = mean(Light),
    sd = sd(Light)
  )


library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggalt)

data <- read.csv("Clean_Danny_Report.csv")
Danny <- data %>% filter(Pitcher=="Avitia, Daniel")
chart_spin_rate_vs_velocity <- ggplot(Danny)+
  aes(x= RelSpeed, y= SpinRate, color=TaggedPitchType)+
  geom_point()+
  geom_vline(xintercept=0, color="black")+
  geom_hline(yintercept = 0,color="black")+
  geom_encircle(aes(fill = TaggedPitchType), s_shape = 2, expand = 0.000001,alpha=0.3) +
  coord_cartesian(xlim = c(76, 94 ), ylim = c(1400, 2600)) +
  scale_x_continuous(breaks = seq(76, 94, 3)) +
  scale_y_continuous(breaks = seq(1400, 2600, 200))+
  labs(x ="Velocity", y = "Spin Rate")+
  ggtitle("Spin Rate vs Velocity")

print(chart_spin_rate_vs_velocity)
ggsave("Jun10DannySpinratevsVeloChart.png", chart_spin_rate_vs_velocity)

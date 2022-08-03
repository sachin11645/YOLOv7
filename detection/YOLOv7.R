library(tidyverse)
library(gtable)
library(grid)
library(plotly)
library(lubridate)
library(magrittr)
library(gridExtra)
library(ggforce)
library(kableExtra)
library(leaflet)
library(rlang)
library(scales)
library(gridtext)

RY07 <- read_excel("Behavior Detection/YOLOv7/RY07.xlsx")

plot1 <- ggplot(RY07, aes(x =Epochs, y =Box)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0.03, 0.08, 0.01))+
  xlab('') + ylab('') + labs(title= "Box Loss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot2 <- ggplot(RY07, aes(x = Epochs, y = Object)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0.02, 0.07, 0.01))+
  xlab('') + ylab('') + labs(title= "Object Loss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot3 <- ggplot(RY07, aes(x = Epochs, y = Class)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) +
  scale_y_continuous(breaks = seq(0, 0.05, 0.01))+
  xlab('') + ylab('') + labs(title= "Class") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot4 <- ggplot(RY07, aes(x =Epochs, y = Total)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0.05, 0.25, 0.03))+
  xlab('') + ylab('') + labs(title= "Total Loss") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))

grid.arrange(plot1,
             plot2,
             plot3, 
             plot4, 
             nrow=2,
             bottom = textGrob("Epochs", rot = 0, vjust = 0, gp=gpar(fontface = 6, fontsize = 16)),
             left = textGrob("Loss", rot = 90, vjust = 1, gp=gpar(fontface = 6, fontsize = 16)),
             top = textGrob("YOLOv7 Training", gp=gpar(fontface = 7, fontsize = 20))
)

plot7 <- ggplot(RY07, aes(x =Epochs, y = Precision)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0, 0.8, 0.1))+
  xlab('') + ylab('') + labs(title= "Precision") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot8 <- ggplot(RY07, aes(x = Epochs, y = Recall)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0, 0.7, 0.1))+
  xlab('') + ylab('') + labs(title= "Recall") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic() + 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))
plot9 <- ggplot(RY07, aes(x = Epochs, y = mAP)) + 
  geom_line(size = 2)+ geom_point(color = "black", size = 1) + 
  scale_y_continuous(breaks = seq(0, 0.7, 0.1)) +
  xlab('') + ylab('') + labs(title= "mAP") + 
  theme(axis.text.x=element_text(angle = 45, hjust = 0.5)) + theme_classic()+ 
  theme(axis.text = element_text(size=12)) + theme(axis.text = element_text(size=12))

grid.arrange(plot7,
             plot8,
             plot9,
             nrow=1,
             bottom = textGrob("Epochs", rot = 0, vjust = 0, gp=gpar(fontface = 6, fontsize = 16)),
             left = textGrob("Values", rot = 90, vjust = 1, gp=gpar(fontface = 6, fontsize = 16)),
             top = textGrob("Evaluation Metrices", gp=gpar(fontface = 7, fontsize = 20))
)



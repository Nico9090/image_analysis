#load data
library(tidyverse)
cilia1 <- read_csv("cilia1ImageAnalysis.csv")
cilia1
cilia1 <- dplyr::rename(cilia1, particle = ...1)

imageWidth <- 2304   
imageHeight <- 2304

cilia1 <- cilia1 %>%
  mutate(distanceFromCenter = sqrt((X - imageWidth/2)^2 + (Y - imageHeight/2)^2))
cilia1 <- cilia1 %>%
  mutate(imageQuartile = case_when(
    X <= 1152 & Y <= 1152 ~ "top_left",
    X > 1152  & Y <= 1152 ~ "top_right",
    X <= 1152 & Y > 1152  ~ "bottom_left",
    X > 1152  & Y > 1152  ~ "bottom_right"
  ))

ggplot(cilia1, aes(x = particle, 
                   y = distanceFromCenter, 
                   color = imageQuartile)) +
  geom_point() +
  scale_color_manual(values = c(
    top_left = "red4",
    top_right = "blue4",
    bottom_left = "green4",
    bottom_right = "purple4"
  ))

#centroid x and y 
ggplot(cilia1, aes(x = X, y = Y, color = imageQuartile)) +
  geom_point(size = 2, alpha = 0.8) +
  scale_color_manual(values = c(
    top_left = "red4",
    top_right = "blue4",
    bottom_left = "green4",
    bottom_right = "purple4"
  )) +
  coord_equal() +
  theme_minimal() +
  theme(legend.title = element_blank())

ggplot(cilia1, aes(x = X, y = -Y, color = distanceFromCenter)) +
  geom_point() +
  scale_color_viridis_c() +
  coord_equal()



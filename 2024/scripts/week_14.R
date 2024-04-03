
library(ggplot2)
library(dplyr)
library(showtext) #For loading google fonts
library(tidyverse)

# load the data
tuesdata   <- tidytuesdayR::tt_load('2024-04-02')
dubois_week10 <- tuesdata$dubois_week10

# load fonts
font_add_google(name = "Public Sans")
showtext_auto()


# Define colours and fonts-------------------------------------------------

bg_col <- "#e8dccd"
font <- "Public Sans"


# Data wrangling ----------------------------------------------------------
plot_data <- dubois_week10 |>
  mutate(
  Occupation = str_to_upper(Occupation), # Uppercase 
  Occupation = factor(Occupation, levels = Occupation), #convert occupation to factor variable with labels
  TotPerc    = cumsum(Percentage)
  ) 


# Calculate label size based on the size of the pie segment
label_size <-  10*sqrt(plot_data$Percentage/ max(plot_data$Percentage)) + 4

# plot the pie chart
options(repr.plot.width = 2, repr.plot.height =3.5) #potrait 

ggplot(plot_data, aes(x = "", y = - Percentage, fill = 
                     reorder(Occupation, - Percentage))) +
  geom_bar(stat = "identity", color = "black") +
  coord_polar("y", start = 4,direction = - 1) +  ## This converts the Cartesian coordinates to polar cordinates
  ## creating the pie chart effect. Anticlock wise direction
  theme_void() +
  labs(fill = NULL,
       title = "A SERIES  OF STATISTICAL CHARTS ILLUSTRATING \n
       THE CONDITIONS OF DESCENDENTS OF FORMAL AFRICAN SLAVES \n
       NOW RESIDENT IN THE UNITED STATES OF AMERICA") +
  scale_fill_manual(values = alpha(c("red", "gold","grey","pink","tan","lightblue"),0.7)) +
  geom_text(aes(x = 1.3, label = paste0(Percentage, "%") ), 
            position = position_stack(vjust = .5), 
            fontface = "bold",
            size = label_size)  +
  theme(plot.background = element_rect(fill = bg_col),
        legend.position = "left",
        plot.margin = margin(0, 0, 0, 1, "cm"), 
        plot.title.position = "plot",
        plot.title = element_text(size = 22, face = "bold", hjust = 0.5)
  )
  


  

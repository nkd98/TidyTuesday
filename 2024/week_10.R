## install.packages("tidytuesdayR")
library(ggplot2)
library(dplyr)

# load the data
tuesdata <- tidytuesdayR::tt_load('2024-04-02')

# convert to dataframe
mydata <- as.data.frame(tuesdata[1])
head(mydata)


# plot the pie chart
ggplot(mydata, aes(x = "", y = - dubois_week10.Percentage, fill = 
                     reorder(dubois_week10.Occupation, - dubois_week10.Percentage))) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar("y", start = 4,direction = - 1) +  ## This converts the Cartesian coordinates to polar cordinates
  ## creating the pie chart effect. Anticlock wise direction
  theme_void() +
  theme(legend.position = "left") +
  labs(fill = NULL,
       title = "Reproduction of  'A Series Of Statistical Charts Illustrating \n
       The Conditions Of Descendants Of Formal African Slaves Now Resident In The Unites States.' ") +
  scale_fill_manual(values = alpha(c("red", "gold","black","pink","tan","blue"),0.7)) +
  geom_text(aes(x = 1.4, label = paste0(dubois_week10.Percentage, "%") ), 
            position = position_stack(vjust = .5), 
            fontface = "bold",
            size = 3)  +

  theme(plot.title = element_text(size = 10, hjust = 0.7,face = "bold"))
  
  
  


  
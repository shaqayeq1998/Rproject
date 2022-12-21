
library(readxl)
library(datasets) # this library contains the dataset we will be working with this morning
library(here) # package to help us navigate more freely in the directories to get files
library(tidyr) # tidyr and dplyr are packages used to data wrangle
library(dplyr)
library(ggplot2) # creates beautiful plots
library(GGally) # for correlation plots
library(car)

#setwd(C:\R projects\exercise1)

#Your_Data_Name <- read_xlsx("penguin_data.xlsx")
data("penguin_data")


###### Data inspection ######
head(penguin_data)
tail(penguin_data)


###### dplyr and tidyr ######
# Using dplyr we can select subsets that we want
colnames(penguin_data)
tot_spp <- penguin_data%>%select(island)
tot_spp2 <- as.data.frame(penguin_data[,2])

# Here we store the list of species
spp_names <- unique(penguin_data$island) 
print(spp_names)

spp1 <- filter(penguin_data, island == spp_names[1]) 
spp2 <- filter(penguin_data, island == spp_names[2])
spp3 <- filter(penguin_data, island == spp_names[3])






###### Data exploration ######

# We can start with a boxplot using base R
boxplot(penguin_data$bill_length_mm, ylab= "Unit", main = "bill length data overview")
boxplot(bill_length_mm ~ Dream, data = penguin_data, ylab = "bill length [Unit]", main = "bill length data overview")

ggplot(penguin_data, aes(x = island, y = bill_length_mm))+
  geom_boxplot()

ggplot(penguin_data, aes(x = island, y = bill_length_mm))+
  geom_boxplot(aes(fill = island))+
  theme_classic()+
  xlab("island")+
  ylab("bill length [Unit]")+
  ggtitle("bill length data overview")+
  theme(plot.title = element_text(hjust = 0.5), # this line is to center the title
        legend.position = "none") 


# SPINGO demo: Visual overall trends of dNdS among species

#                                             v1.0  Shingo Miyauchi 19March25 
#-------------------
#  Descriptions
#-------------------
# The script converts dNdS values into density heatmaps among the species compared.

# <INPUT>
# 1) dNdS values for orthologous CAZymes 
# 45_Morchella_dNdS_|Cazy|.csv

# 2) 45 Morchella species and taxonomic information
# 45_Morchella_JGI_Taxonomy.csv

# <METHODs>
# PART 1: Preparation
# PART 2: Make heatmaps 
#-------------------

#-----------------
# Load R packages 
#-----------------
library(dplyr)
library(ggplot2)
library(ggpubr)

# Artistic colour palettes 
library(MetBrewer)
library(MoMAColors)

#===========================
# PART 1: Preparation
#===========================
# Load input
input.df <- read.csv("45_Morel_dNdS_Step4.1_data4Figure|Cazy|.csv")

# Load taxonomic info
tax.df <- read.csv("45_Morche_TINGO_Step4_Clean_Species_Taxo_TreeOrd_forMS.csv")

# Factor FungalIDs
input.df$ID1 <-  factor(input.df$ID1, levels=tax.df$SpeciesName)
input.df$ID2 <-  factor(input.df$ID2, levels=tax.df$SpeciesName)

#-------------------
# Make Heat colours
#-------------------
heat.color   <- moma.colors("Exter", n=500, type="continuous")[1:500]
purple.color <- moma.colors("Flash", n=500, type="continuous")[1:500]
blue.color   <- moma.colors("Ernst", n=500, type="continuous")[1:500]
green.color  <- met.brewer("VanGogh3", n=500, type="continuous")[1:500]

#=======================
# PART 2: Make heatmaps 
#=======================
# 1) Make density heatmap for dNdS
dNdS.p <- ggplot(input.df, aes(x=ID1, y=ID2,  color=dNdS)) + 
  # Add points 
  geom_point(alpha= 0.6, position = "jitter", size=1.2) +
  coord_fixed() +
  scale_color_gradientn(colours= heat.color, na.value = "transparent",
                        breaks=c(0, 1, 2, 3),
                        limits=c(0, 2.5)) +
  
  # IMPORTANT: Reverse fungal names
  scale_y_discrete(limits= rev(levels(input.df$ID1)), 
                   expand = c(0, 0.5)) +
  
  # IMPORTANT: Reverse fungal names
  scale_x_discrete(limits= rev(levels(input.df$ID2)), 
                   expand = c(0, 0.5)) +
  
  ggtitle("dNdS") +
  theme(plot.title = element_text(size = 20, hjust = 0.5),
        legend.position="bottom",
        # Remove legend title
        legend.title= element_blank(),
        # Legend background off
        legend.key=element_blank(),
        # Axis ticks off 
        axis.ticks = element_blank(),
        # Label on X axis 
        axis.title.x= element_blank(), 
        axis.text.x = element_text(colour= "grey30", size=7.5, angle=45, hjust = 1), 
        axis.text.y = element_text(colour= "gray30", size=10),
        # Background off
        axis.title.y=element_blank(),
        panel.border=element_blank(),
        panel.background= element_blank(),
        panel.grid = element_blank())

# 2) Make density heatmap for dN
dN.p <- ggplot(input.df, aes(x=ID1, y=ID2,  color=dN)) + 
  # Add points
  geom_point(alpha= 0.6, position = "jitter", size=1.2) +
  coord_fixed() +
  scale_color_gradientn(colours= purple.color, na.value = "transparent",
                        breaks=c(0, 0.5, 1, 2, 3, 4),
                        limits=c(0, 3)) +
  
  # IMPORTANT: Reverse fungal names
  scale_y_discrete(limits= rev(levels(input.df$ID1)), 
                   expand = c(0, 0.5)) +
  
  # IMPORTANT: Reverse fungal names
  scale_x_discrete(limits= rev(levels(input.df$ID2)), 
                   expand = c(0, 0.5)) +
  
  ggtitle("Non-synonymous ratio (dN)") +
  theme(plot.title = element_text(size = 20, hjust = 0.5),
        legend.position="bottom",
        # Remove legend title
        legend.title= element_blank(),
        # Legend background off
        legend.key=element_blank(),
        # Axis ticks off 
        axis.ticks = element_blank(),
        # Label on X axis 
        axis.title.x= element_blank(), 
        axis.text.x = element_text(colour= "grey30", size=7.5, angle=45, hjust = 1), 
        axis.text.y = element_text(colour= "gray30", size=10),
        # Background off
        axis.title.y=element_blank(),
        panel.border=element_blank(),
        panel.background= element_blank(),
        panel.grid = element_blank())

# 3) Make density heatmap for dS
dS.p <- ggplot(input.df, aes(x=ID1, y=ID2,  color=dS)) + 
  # Add points
  geom_point(alpha= 0.6, position = "jitter", size=1.2) +
  coord_fixed() +
  scale_color_gradientn(colours= green.color, na.value = "transparent",
                        breaks=c(0, 1, 2, 3, 4, 5, 6, 7, 8),
                        limits=c(0, 10)) +
  
  # IMPORTANT: Reverse fungal names
  scale_y_discrete(limits= rev(levels(input.df$ID1)), 
                   expand = c(0, 0.5)) +
  
  # IMPORTANT: Reverse fungal names
  scale_x_discrete(limits= rev(levels(input.df$ID2)), 
                   expand = c(0, 0.5)) +
  
  ggtitle("Synonymous ratio (dS)") +
  theme(plot.title = element_text(size = 20, hjust = 0.5),
        legend.position="bottom",
        # Remove legend title
        legend.title= element_blank(),
        # Legend background off
        legend.key=element_blank(),
        # Axis ticks off 
        axis.ticks = element_blank(),
        # Label on X axis 
        axis.title.x= element_blank(), 
        axis.text.x = element_text(colour= "grey30", size=7.5, angle=45, hjust = 1), 
        axis.text.y = element_text(colour= "gray30", size=10),
        # Background off
        axis.title.y=element_blank(),
        panel.border=element_blank(),
        panel.background= element_blank(),
        panel.grid = element_blank())

# Put figures together
pic <- ggarrange(dNdS.p, dN.p, dS.p, ncol=3, nrow=1)

# ggsave funciton with JPEG format 
ggsave(plot= annotate_figure(pic, top = text_grob("CAZymes", size=40)), file = paste0(getwd(),"/" , "SPINGO_OverallStats.jpg"), height = 10, width = 25, device='jpeg', dpi=300)
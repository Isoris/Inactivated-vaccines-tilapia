install.packages("Viridis")
install.packages("viridis")
library(viridis)
library(ggplot2)
library(readxl)
#ggplot theme
theme_qwen<- function() {
  font <- "serif"
  
  ggplot2::theme(
    
    #Text format:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family=font,
                                       size=26,
                                       face="bold",
                                       color="#2C6975"),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family=font,
                                          size=23,
                                          color = "#0a3c62",
                                          margin=ggplot2::margin(7,0,7,0)),
    plot.caption = ggplot2::element_blank(),
    # plot.caption = ggplot2::element_text(family=font,
    #                                      size=16,
    #                                      face = "bold",
    #                                      color = "#063051",
    #                                      margin=ggplot2::margin(7,50,7,15)),
    #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function
    
    #Legend format
    #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font,
                                        size=12,
                                        face = "bold",
                                        color="#2C6975"),
    
    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks.
    #In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    axis.title = element_text(family=font, size = 18, face = "bold", color="#2C6975"),
    axis.text = element_text(family=font, size = 16, face = "bold", color="#2C6975"),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10), family=font, color="#2C6975"),
    axis.ticks = ggplot2::element_blank(),
    axis.line = element_line(color = "#E9765B", arrow = arrow(length = unit(0.6, "lines"), type = "closed")),
    #Grid lines
    #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color="#a9b7be"),
    panel.grid.major.x = ggplot2::element_line(color="#a9b7be"),
    panel.border = element_blank(),
    #Blank background
    panel.background = element_rect(fill = "#F5F5F0",
                                    size = 2),
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    
    #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
    strip.background = element_rect(fill = "#2C6975", color = "#2C6975"),
    strip.text = element_text(size = rel(1), face = "bold", color = "white")
  )
}

theme_qwen_small<- function() {
  font <- "serif"
  
  ggplot2::theme(
    
    #Text format:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family=font,
                                       size=20,
                                       face="bold",
                                       color="#2C6975"),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family=font,
                                          size=14,
                                          color = "#0a3c62",
                                          margin=ggplot2::margin(7,0,7,0)),
    plot.caption = ggplot2::element_blank(),
    # plot.caption = ggplot2::element_text(family=font,
    #                                      size=16,
    #                                      face = "bold",
    #                                      color = "#063051",
    #                                      margin=ggplot2::margin(7,50,7,15)),
    #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function
    
    #Legend format
    #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font,
                                        size=10,
                                        face = "bold",
                                        color="#2C6975"),
    
    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks.
    #In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    axis.title = element_text(family=font, size = 18, face = "bold", color="#2C6975"),
    axis.text = element_text(family=font, size = 9, face = "bold", color="#2C6975"),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10), family=font, color="#2C6975"),
    axis.ticks = ggplot2::element_blank(),
    axis.line = element_line(color = "#E9765B", arrow = arrow(length = unit(0.6, "lines"), type = "closed")),
    #Grid lines
    #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color="#a9b7be"),
    panel.grid.major.x = ggplot2::element_line(color="#a9b7be"),
    panel.border = element_blank(),
    #Blank background
    panel.background = element_rect(fill = "#F5F5F0",
                                    size = 2),
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    
    #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
    strip.background = element_rect(fill = "#2C6975", color = "#2C6975"),
    strip.text = element_text(size = rel(1), face = "bold", color = "white")
  )
}
# Systemic antibody response

Systemic_mono <- readxl::read_xlsx(path = "Systemic antibody response to vaccines.xlsx", 
                                   sheet = "Monovalent") 
Mucosal_mono <- readxl::read_xlsx(path = "Mucosal antibody response to vaccines.xlsx",
                                  sheet = "Monovalent")
Systemic_biva <- readxl::read_xlsx(path = "Systemic antibody response to vaccines.xlsx",
                                   sheet = "Bivalent") 
Mucosal_biva <- readxl::read_xlsx(path = "Mucosal antibody response to vaccines.xlsx",
                     sheet = "Bivalent")

Systemic_mono$Treatment <- as.factor(Systemic_mono$Treatment)
Mucosal_mono$Treatment <- as.factor(Mucosal_mono$Treatment)
Systemic_biva$Treatment <- as.factor(Systemic_biva$Treatment)
Mucosal_biva$Treatment <- as.factor(Mucosal_biva$Treatment)
palette <- c( "#F8A51C","#CFCDCD","#FFF2CC","#E2EFD8", "#DDEBF6", "#8EAADB","#7282AA","#5EBAC0")
palette <- c()

ggplot(Systemic_mono, aes(x=Day_post_vaccination, y = OD_450_nm, color=Treatment))+
  geom_point(size=3)+theme_qwen()+ggtitle("Systemic antibody response (IgM) to monovalent vaccines")+
  scale_color_viridis(discrete=TRUE, option="viridis")

ggplot(Systemic_biva, aes(x=Day_post_vaccination, y = OD_450_nm, colour=Treatment))+
  geom_point(size=3)+theme_qwen()+ggtitle("Systemic antibody response (IgM) to bivalent vaccines")+
  scale_color_viridis(discrete=TRUE, option="viridis")

ggplot(Mucosal_mono, aes(x=Day_post_vaccination, y = OD_450_nm, colour=Treatment))+
  geom_point(size=3)+theme_qwen()+ggtitle("Mucosal antibody response (IgM) to monovalent vaccines")+
  scale_color_viridis(discrete=TRUE, option="viridis")

ggplot(Mucosal_biva, aes(x=Day_post_vaccination, y = OD_450_nm, colour=Treatment))+
  geom_point(size=3)+theme_qwen()+ggtitle("Mucosal antibody response (IgM) to monovalent vaccines")+
  scale_color_viridis(discrete=TRUE, option="viridis")

# Bacterial challenges

Challenge1 <- readxl::read_xlsx(path = "Bacterial challenge.xlsx", sheet = "Challenge 1")
Challenge2 <- readxl::read_xlsx(path = "Bacterial challenge.xlsx", sheet = "Challenge 2")

Challenge1$Group <- as.factor(Challenge1$Group)
Challenge1$Challenge <- as.factor(Challenge1$Challenge)
Challenge1$Aquarium_number <- as.factor(Challenge1$Aquarium_number)

Challenge2$Group <- as.factor(Challenge2$Group)
Challenge2$Challenge <- as.factor(Challenge2$Challenge)
Challenge2$Aquarium_number <- as.factor(Challenge2$Aquarium_number)

Challenge1 %>% ggplot(aes(x = Survival_time_hour, y = Survival_rate, color = Group))+
  geom_point()




install.packages(c("survival", "survminer"))
library("survival")
library("survminer")

lung <- lung
head(lung)
colon <-  colon

require("survival")
fit2 <- survfit( Surv(time, status) ~ sex + rx + adhere,
                 data = colon )
ggsurv <- ggsurvplot(fit2, fun = "event", conf.int = TRUE,
                     ggtheme = theme_bw())

ggsurv$plot +theme_bw() + 
  theme (legend.position = "right")+
  facet_grid(rx ~ adhere)

challenge1_KM <- readxl::read_xlsx(path = "Bacterial challenge.xlsx", sheet = "Challenge 1 KM")

challenge1_KM$treatment <- as.factor(challenge1_KM$treatment)
challenge1_KM$vaccine <- as.factor(challenge1_KM$vaccine)
challenge1_KM$type <- as.factor(challenge1_KM$type)

#Compute survival curves: survfit()

install.packages("ggsci")
library(ggsci)

fitchal1 <- survfit(Surv(time, status) ~ full, data = challenge1_KM)
print(fitchal1)


fitchallenge1 <- survfit( Surv(time, status) ~ vaccine + treatment + type,
                          data = challenge1_KM )

ggsurvplot(fitchal1,
           pval = TRUE, conf.int = TRUE,
           risk.table = TRUE, # Add risk table
           risk.table.col = "strata", # Change risk table color by groups
           linetype = "strata", # Change line type by groups
           surv.median.line = "hv", # Specify median survival
           ggtheme = theme_qwen_small(),
           palette = mypal # Change ggplot2 theme
           )

mypal = pal_npg("nrc")(10)
mypal
mypal2 = pal_npg("nrc")(13)
mypal2
#Fit complex survival curves

col_vector<-c('#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', 
              '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', 
              '#808000', '#ffd8b1', '#000075', '#808080', '#ffffff', '#000000')

ggsurv1 <- ggsurvplot(fitchallenge1, fun = "event", conf.int = TRUE,
                     ggtheme = theme_qwen(), palette = col_vector)

ggsurv1$plot +theme_qwen() + 
  theme (legend.position = "right")+
  facet_grid(treatment ~ type)+theme(strip.text.y = element_text(margin = margin(0.5,0,0.5,0, "cm")))+
  xlab("Hours post-infection")

challenge1_KM$treatment <- factor(challenge1_KM$treatment, levels = c("PBS","Sa","Av"))
levels(challenge1_KM$treatment)



challenge2_KM <- readxl::read_xlsx(path = "Bacterial challenge.xlsx", sheet = "Challenge 2 KM")
challenge2_KM$treatment <- as.factor(challenge2_KM$treatment)
challenge2_KM$vaccine <- as.factor(challenge2_KM$vaccine)
challenge2_KM$type <- as.factor(challenge2_KM$type)

challenge2_KM$treatment <- factor(challenge2_KM$treatment, levels = c("PBS","Sa","Av"))
levels(challenge2_KM$treatment)


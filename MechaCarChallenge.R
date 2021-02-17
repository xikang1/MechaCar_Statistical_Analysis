library(dplyr)
MechaCar <- read.csv("02/MechaCar_mpg.csv")# import data from MechaCar
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=MechaCar)#generate multiple linear regression model
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=MechaCar))# show p-value and r**2 value

# lot_summary and total_summary
Suspension_Coil <- read.csv("02/Suspension_Coil.csv")#import data from Suspension_Coil.csv

total_summary<- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups ="keep")

lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot)%>%summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups ="keep" )

# t-test for all lots
t.test(log10(Suspension_Coil$PSI),mu=log10(1500))#compare sample versus population means
# t-test for lot1
lot1<- subset(Suspension_Coil,Manufacturing_Lot=="Lot1")
t.test(log10(lot1$PSI),mu=log10(1500))
# t-test for lot2
lot2<- subset(Suspension_Coil,Manufacturing_Lot=="Lot2")
t.test(log10(lot2$PSI),mu=log10(1500))
# t-test for lot3
lot3<- subset(Suspension_Coil,Manufacturing_Lot=="Lot3")
t.test(log10(lot3$PSI),mu=log10(1500))

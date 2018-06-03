library(tidyverse)
library(reshape2)

kadapa_schools <- read.csv(file = "ap janma/kadapa.csv")
anantapur_schools <- read.csv(file = "ap janma/anantapur_schools.csv")
chittor_schools <- read.csv(file = "ap janma/chittor_schools.csv")


str(kadapa_schools)
head(kadapa_schools)

dim(chittor_schools)
dim(anantapur_schools)
dim(kadapa_schools)


# # remove unwanted columns
# names(kadapa_schools)
# kadapa_schools <- (kadapa_schools[,-which(names(kadapa_schools) %in% c("District.code", "District.name","Mandal.code"))])
# anantapur_schools <- (anantapur_schools[,-which(names(anantapur_schools) %in% 
#                                                   c("District.code", "District.name","Mandal.code"))])
# chittor_schools <- (kadapa_schools[,-which(names(kadapa_schools) %in% c("District.code", "District.name","Mandal.code"))])


ap_schools <- rbind(anantapur_schools,chittor_schools,kadapa_schools)


dim(ap_schools)
ap_schools$state <- "Andhra Pradesh"
ap_schools$country <- "India"
#ap_schools$


write_csv(x = ap_schools,path = "ap janma/ap_schools.csv")


head(ap_schools)
india_lat_long <- read.csv(file = "ap janma/Ind_adm2_Points.csv")
india_lat_long_Atp_cdp_chtr <- india_lat_long %>% filter(District %in% c("Anantapur","Cuddapah","Chittoor"))
write.csv(x = india_lat_long_Atp_cdp_chtr,file = "ap janma/atp_kdp_chtr_lat_long.csv")

install.packages("ggmap")
library(ggmap)
citation('ggmap')
names(ap_schools)

ap_schools %>% group_by(District.name,Mandal.Name,Higer.Class) %>% summarise(count = n()) %>% arrange(desc(count))


qmap(location = "Sidhout",maptype = "roadmap",panel.spacing = 10) 

geocode(location = "VEMPALLI")

na_list <- c("PARIGI","KALYANDRUG","NARPALA","KAMBADUR","GORANTLA","BRAHMASAMUDRAM","RODDAM","YELLANUR","GUMMAGATA","TALUPULA","AMARAPURAM","RAMAGIRI","NALLAMADA","KOTHACHERUVU","DHARMAVARAM","MADAKASIRA","ROLLA","VAJRAKARUR","BUKKARAYASAMUDRAM","BATHALAPALLE","KUNDURPI","NAMBULAPULIKUNTA","PENUKONDA","TADIMARRI","GUDIPALA","SANTHIPURAM","KUPPAM","SRIKALAHASTI","K.V.B.PURAM","KALIKIRI","PALAMANER","GANGAVARAM","PUNGANUR","PITCHATUR","NARAYANAVARAM","PENUMUR","NAGARI","KURABALAKOTA","K.V.PALLE","MADANAPALLE","PUTTUR","B.KOTHAKOTA","THAMBALLAPALLE","TIRUPATHI(U)","GANGADHARANELLORE","KARVETINAGAR","PUTHALAPATTU","NIMMANAPALLE","KALAKADA","BAIREDDIPALLE","YERPEDU","B.N.KANDRIGA","PULICHERLA","S.R.PURAM","PEDDAPANJANI","PULLAMPET","KONDAPURAM","CHAKRAYAPET","CHINNAMANDEM","MYDUKUR","THONDUR","SIMHADRIPURAM","VEMULA","KALASAPADU","OBULAVARIPALLI","PRODDUTUR","GALIVEEDU","B.KODUR","VEERABALLI","PENAGALUR","PENDLIMARRY","SAMBEPALLI","PEDDAMUDIUM","RAYACHOTY","MUDDANUR","VEMPALLI","Sri Avadhutha KASINAYANA","Lingala","Veerapunayani Palle")

geo_missing2 <- geocode(location = na_list,output = "latlona",nameType = "short")
View(geo_missing1)
xgeo <- geo_missing

View(geo_missing)

as.data.frame(unique(ap_schools$Mandal.Name))

combin <- cbind(na_list,geo_missing2)
View(combin)
install.packages("Excel")

kdp_dropout <- read.csv(file = "ap janma/dropouts_KDP.csv")
chtr_dropout <- read.csv(file = "ap janma/dropouts_chittoor.csv")
atp_dropout <- read.csv(file = "ap janma/dropouts_ATP.csv")
dropouts.all <- rbind(kdp_dropout,chtr_dropout,atp_dropout)
write.xlsx(x = dropouts.all,file = "ap janma/dropouts_all.xlsx",sheetName = "sheet1")


library(xlsx)

head(atp_dropout)







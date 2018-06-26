# Define pecan file path
path.pecan <- "~/pecan/"

# Source PEcAn ED conversion file
source(file.path(path.pecan, "base/utils/R/seconds_in_year.R"))
source(file.path(path.pecan, "base/utils/R/days_in_year.R"))
source(file.path(path.pecan, "modules/data.atmosphere/R/solar_angle.R"))
source(file.path(path.pecan, "models/ed/R/write_ed_metheader.R"))
source(file.path(path.pecan, "models/ed/R/check_ed_metheader.R"))
source("met2model.ED2.R")


in.base="~/met_ensemble/data/met_ensembles/GLSP.v1/1hr/ensembles"
outfolder="'/home/models/ED_MET/GLSP.v1"
met.base="/home/models/ED_MET/WILLOWCREEK.v2"
if(!dir.exists(outfolder)) dir.create(outfolder, recursive = T)

ed.order <- read.csv("Met_EnsembleOrder.csv")
summary(ed.order)
head(ed.order)

# Convert LDAS Raw
for(i in 1:nrow(ed.order)){
  met2model.ED2(in.path=file.path(in.base, ed.order$metEns[i]), 
                in.prefix=ed.order$metEns[i], 
                outfolder=file.path(outfolder, ed.order$runID[i]), 
                header_folder = file.path(met.base, ed.order$runID[i]),
                start_date="1999-01-01", 
                end_date="2014-12-31")
}
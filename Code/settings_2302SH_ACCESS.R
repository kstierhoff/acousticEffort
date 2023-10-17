# Survey info -------------------------------------------------------------
survey.name <- "2302SH"
survey.vessel <- "Shimada"
sd.survey   <- FALSE

# Define ERDDAP data variables -------------------------------------------------
erddap.survey.start  <- "2023-05-02"  # Start of survey for ERDDAP vessel data query
erddap.survey.end    <- "2023-05-16"  # End of survey for ERDDAP vessel data query

# Configure columns and classes
erddap.vessel        <- "WTED"    # Lasker == WTEG; Shimada == WTED; add "nrt" if during survey
erddap.vars          <- c("time,latitude,longitude,seaTemperature,platformSpeed,flag")
erddap.classes       <- c("character", "numeric", "numeric", "numeric","numeric","character")
erddap.headers       <- c("time", "lat", "long", "SST", "SOG","flag")

# Generate ERDDAP URL
dataURL <- URLencode(paste0(
  "http://coastwatch.pfeg.noaa.gov/erddap/tabledap/fsuNoaaShip",
  erddap.vessel, ".csv0?", erddap.vars,
  "&time>=", erddap.survey.start, "&time<=", erddap.survey.end,
  "&flag=~",'"ZZ.*"'))

# Downsample settings -----------------------------------------------------
# Number of n-th samples to keep in the resulting nav data frame
# Particularly important when dealing with large data sets with frequent
# location estimates
nav.ds <- 1

# Map preferences ---------------------------------------------------------
survey.zoom = 6
map.height  = 8
map.width   = 5
map.type    = "hybrid"

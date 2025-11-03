################################################################################
# title
################################################################################
#
# Juan Carlos Villaseñor-Derbez
# jc_villasenor@miami.edu
# date
#
# Description
#
################################################################################
  
# SET UP #######################################################################

## Load packages ---------------------------------------------------------------

## Load data -------------------------------------------------------------------
my_rast <- function(x){
  r <- rast(xmin=-180, xmax=180, ymin=-75, ymax=75)
  spp <- paste(unique(x$Genus), unique(x$Species), sep = "_")
  
  rast <- x |> 
    select(lon = 4, lat = 3, probability = 6) |> 
    rast(crs = "EPSG:4326") |> 
    extend(r)
  
  names(rast) <- spp
  
  return(rast)
}

my_write <- function(x) {
  writeRaster(x = x, filename = paste0(here("data/raw/AquaMaps/"),names(x), ".tiff"),
              overwrite = T)
}

files <- list.files(here("data/raw/AquaMaps/"), pattern = ".csv", full.names = T)
data <- map(files, read_csv, skip = 12) |> 
  map(my_rast)

walk(data, my_write)

# PROCESSING ###################################################################

## Some step -------------------------------------------------------------------


# VISUALIZE ####################################################################

## Another step ----------------------------------------------------------------


# EXPORT #######################################################################

## The final step --------------------------------------------------------------
  
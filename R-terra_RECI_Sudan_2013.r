# ============================================================================
# Multispectral vegetation/water indices in R (terra), Khartoum region, Sudan.
# Code from the peer-reviewed article:
#   Lemenkova, P.; Debeir, O. (2023). Multispectral Satellite Image Analysis for
#   Computing Vegetation Indices by R in the Khartoum Region of Sudan,
#   Northeast Africa. Journal of Imaging, 9(5), 98.
#   DOI:    https://doi.org/10.3390/jimaging9050098
#   Zenodo: https://doi.org/10.5281/zenodo.7924498
#   HAL:    https://hal.science/hal-04094997v1
#
# Authors: Polina Lemenkova, Olivier Debeir  |  ORCID: 0000-0002-5759-1089
# ============================================================================

# Computing vegetation indices
library(terra)
library(RColorBrewer)
library(Hmisc)
library(pals)
#
setwd("/Users/polinalemenkova/Documents/R/52_Image_Processing/Sudan_RECI")
# Red-Edge Chlorophyll Vegetation Index (RECl) = (NIR / R) - 1
# Nir = Band 5, Red = Band 4.
vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk / bi) - 1
  return(vi)
}
# For Landsat NIR = 5, red = 4.
filenames <- paste0('LC08_L2SP_173049_20131220_20200912_02_T1_SR_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat
reci <- vi(landsat, 5, 4)
options(scipen=10000)
#colors <- rev(jet(100))
#colors <- kovesi.linear_bmy_10_95_c78(100)
#colors <- brewer.piyg(100)
#colors <- cubicl(100)
#colors <- cols25(25)
colors <- rainbow(100)
#colors <- polychrome(36)
#colors <- glasbey(36)
#colors <- kelly(22)
#plot(ndvi, col=brewer.pal(100, "jet"), font.main = 1, main = "NDVI for Landsat-8 OLI/TIRS C1 image LC08_L2SP_197050_20131110_20200912_02_T1_SR: Inner Niger Delta, Mali (2013)", cex.main=0.9)
plot(reci, col=colors, font.main = 1, main = "RECI for Landsat-8 OLI/TIRS C1 image LC08_L2SP_173049_20131220_20200912_02_T1_SR_B: \nWhite Nile and Blue Nile confluence, Sudan (2013)", cex.main=0.9)
minor.tick(nx = 10, ny = 10, tick.ratio = 0.3)
# Plotting histogram of the NDVI
hist(reci, font.main = 1, main = "RECI values for Landsat-8 OLI/TIRS C1 image \nLC08_L2SP_173049_20131220_20200912_02_T1_SR_B: White Nile and Blue Nile confluence, Sudan (2013)", xlab = "RECI", ylab= "Frequency",
    col = "forestgreen", xlim = c(-0.5, 1),  breaks = 50, xaxt = "n")
axis(side=1, at = seq(-0.6, 1, 0.1), labels = seq(-0.6, 1, 0.1))
minor.tick(nx = 10, ny = 10, tick.ratio = 0.3)

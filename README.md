# R/terra Multispectral Vegetation Indices — Khartoum Region, Sudan

R scripts computing a suite of multispectral vegetation and water indices from
Landsat 8 OLI/TIRS surface-reflectance imagery over the Khartoum region of Sudan
(the White Nile - Blue Nile confluence), for three years (2013, 2018, 2022), plus
a GMT script for the study-area map.

## Related publication

These scripts are the code of:

Lemenkova, P.; Debeir, O. Multispectral Satellite Image Analysis for Computing
Vegetation Indices by R in the Khartoum Region of Sudan, Northeast Africa.
Journal of Imaging 2023, 9(5), 98.

- DOI:    https://doi.org/10.3390/jimaging9050098
- Zenodo: https://doi.org/10.5281/zenodo.7924498
- HAL:    https://hal.science/hal-04094997v1
- MDPI:   https://www.mdpi.com/2313-433X/9/5/98 (ISSN 2313-433X, Scopus / Web of Science)

## Scripts

Each index is computed for 2013, 2018 and 2022 (R-terra_<INDEX>_Sudan_<YEAR>.r).
Every script loads the seven Landsat 8 surface-reflectance bands (path/row
173049) into a multi-band SpatRaster with terra::rast, applies a band-arithmetic
function, maps the result with a pals diverging palette and draws a histogram of
the index values.

- NDVI (Normalized Difference Vegetation Index): (NIR - Red) / (NIR + Red).
- GNDVI (Green NDVI): (NIR - Green) / (NIR + Green), more sensitive to
  chlorophyll.
- IPVI (Infrared Percentage Vegetation Index): NIR / (NIR + Red).
- NDWI (Normalized Difference Water Index): (Green - NIR) / (Green + NIR), for
  open-water / moisture.
- OSAVI (Optimized Soil-Adjusted Vegetation Index): (NIR - Red) / (NIR + Red +
  0.16), reducing soil-brightness effects.

GMT-01-SD.sh: a Generic Mapping Tools (GMT) shell script producing the
topographic/location map of the Sudan study area.

## Methods

- Spectral index computation by band arithmetic on surface-reflectance data
  (terra).
- Multi-temporal comparison by repeating each index for 2013, 2018 and 2022.
- Perceptually-uniform diverging colour mapping (pals) and distribution
  histograms.

## Data

- Landsat 8 OLI/TIRS Collection 2 Level-2 surface-reflectance scenes
  (LC08_L2SP_173049_...), seven bands each, Khartoum region. The GeoTIFF bands
  are expected in the working directory and are not stored in this repository.

## Requirements

- R (>= 4.0): terra, RColorBrewer, Hmisc, pals
- GMT (Generic Mapping Tools) for the map script

## Usage

Place the Landsat bands for a given year in the working directory and run, e.g.:

    Rscript R-terra_NDVI_Sudan_2022.r

## Authors and citation

Polina Lemenkova, Olivier Debeir
ORCID: https://orcid.org/0000-0002-5759-1089

If you use these scripts, please cite:

Lemenkova, P.; Debeir, O. Multispectral Satellite Image Analysis for Computing
Vegetation Indices by R in the Khartoum Region of Sudan, Northeast Africa.
Journal of Imaging 2023, 9(5), 98. https://doi.org/10.3390/jimaging9050098

## License

See the LICENSE file in this repository (Copyright Polina Lemenkova).
- RECI (Red-Edge Chlorophyll Index): (NIR / Red) - 1, sensitive to canopy chlorophyll content.

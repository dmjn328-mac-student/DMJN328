to.install<-c('usethis', 'car', 'plotly', 'learnr', 'devtools', 'tidyverse', 'magrittr', 'lubridate', 'haven', 'rmarkdown', 'datapasta', 'tibble', 'readr', 'foreign', 'dplyr', 'labelled', 'questionr', 'readxl',  'openxlsx', 'knitr', 'jsonlite', 'tidyr', 'DT', 'stringr', 'ggthemes', 'ggbeeswarm', 'glue', 'stringi', 'ggridges', 'viridis', 'scales', 'sf', 'tidycensus', 'tigris', 'censusapi', 'ggmap', 'leaflet', 'httpuv', 'cancensus', 'statcanR', 'cansim', 'valetr', 'weathercan', 'CANSIM2R', 'rcanvec', 'opendatatoronto', 'VancouvR', 'guardianapi', 'GuardianR', 'gapminder', 'broom', 'coefplot', 'cowplot', 'GGally', 'ggrepel', 'gridExtra', 'here', 'interplot', 'margins', 'maps', 'mapproj', 'mapdata', 'MASS', 'quantreg', 'rlang', 'survey', 'srvyr', 'viridisLite')

install.lib<-to.install[!to.install %in% installed.packages()]
for(lib in install.lib) install.packages(lib,dependencies=TRUE)

#Install from github
devtools::install_github("andrewbtran/muckrakr")
devtools::install_github("AliciaSchep/gglabeller") 
devtools::install_github("kjhealy/socviz") 

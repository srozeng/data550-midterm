here::i_am("code/03_render_report.R")

# WHICH_CONFIG <- Sys.getenv("WHICH_CONFIG") 
# config_list <- config::get(
#   config = WHICH_CONFIG
# )
# 
# 
library(rmarkdown)
# report_filename <- paste0(
#   "report_config_",
#   WHICH_CONFIG,
#   ".html"
# )

# rendering a report in production mode
render(
  "report.Rmd",
  output_file = "report.html")

## REPLACE above w/ output_file = report_filename

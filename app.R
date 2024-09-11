# app.R
library(shiny)
setwd("/Users/audrey/Downloads/research/ckweb/Tcellstates")
shinyApp(ui = source("ui.R")$value, server = source("server.R")$value)

# rmarkdown::render("app.R", output_format = "html_document")

shinylive::export(appdir = "Tcellstates", destdir = "docs")
httpuv::runStaticServer("docs/", port=8008)

# rmarkdown::render("app.Rmd")
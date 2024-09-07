# app.R
library(shiny)
source("ui.R")
source("server.R")
shinyApp(ui = ui, server = server)

rmarkdown::render("app.R", output_format = "html_document")



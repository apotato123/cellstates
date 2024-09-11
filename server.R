# server.R
library(shiny)
library(readxl)
library(DT)

setwd("/Users/audrey/Downloads/research/ckweb/Tcellstates")

# Define server logic
function(input, output, session) {
  
  # Server logic for home tab
  output$home <- renderText({
    "Welcome to the Home page"
  })
  
  # Function to read Excel files
  read_excel_file <- function(path) {
    df <- read_excel(path)
    colnames(df)[1] <- "Regulator Names"
    return(df)
  }
  
  # Function to filter data based on search input
  filter_data <- function(data, keyword) {
    if (is.null(keyword) || is.na(keyword) || keyword == "") {
      return(data)
    } else {
      keyword <- tolower(keyword)
      return(data[apply(data, 1, function(x) any(grepl(keyword, tolower(x)))), ])
    }
  }
  
  
  # Main page data
  data <- reactive({
    read_excel_file("www/tablePagerank/Table_TF PageRank Scores for Audrey.xlsx")
  })
  
  filtered_data <- reactive({
    filter_data(data(), input$search_input)
  })
  
  output$table <- renderDT({
    filtered_data()
  })
  
  # Server logic for naive tab
  output$naive <- renderText({
    "TF Activity Score: Naive"
  })
  
  # Naive tab data
  naive_data <- reactive({
    read_excel_file("www/tablePagerank/Naive.xlsx")
  })
  
  filtered_naive_data <- reactive({
    filter_data(naive_data(), input$search_input_naive)
  })
  
  output$table_naive <- renderDT({
    filtered_naive_data()
  })
  

  # Server logic for TE tab
  output$te <- renderText({
    "TF Activity Score: TE"
  })
  
  # TE tab data
  te_data <- reactive({
    read_excel_file("www/tablePagerank/TE.xlsx")
  })
  
  filtered_te_data <- reactive({
    filter_data(te_data(), input$search_input_te)
  })
  
  output$table_te <- renderDT({
    filtered_te_data()
  })

  # Server logic for MP tab
  output$mp <- renderText({
    "TF Activity Score: MP"
  })
  
  # MP tab data
  mp_data <- reactive({
    read_excel_file("www/tablePagerank/MP.xlsx")
  })
  
  filtered_mp_data <- reactive({
    filter_data(mp_data(), input$search_input_mp)
  })
  
  output$table_mp <- renderDT({
    filtered_mp_data()
  })

  # Server logic for T CM tab
  output$tcm <- renderText({
    "TF Activity Score: T CM"
  })
  
  # T CM tab data
  tcm_data <- reactive({
    read_excel_file("www/tablePagerank/TCM.xlsx")
  })
  
  filtered_tcm_data <- reactive({
    filter_data(tcm_data(), input$search_input_tcm)
  })
  
  output$table_tcm <- renderDT({
    filtered_tcm_data()
  })

  # Server logic for T EM tab
  output$tem <- renderText({
    "TF Activity Score: T EM"
  })
  
  # T EM tab data
  tem_data <- reactive({
    read_excel_file("www/tablePagerank/TEM.xlsx")
  })
  
  filtered_tem_data <- reactive({
    filter_data(tem_data(), input$search_input_tem)
  })
  
  output$table_tem <- renderDT({
    filtered_tem_data()
  })

  # Server logic for T RM tab
  output$trm <- renderText({
    "TF Activity Score: T RM"
  })
  
  # T RM tab data
  trm_data <- reactive({
    read_excel_file("www/tablePagerank/TRM.xlsx")
  })
  
  filtered_trm_data <- reactive({
    filter_data(trm_data(), input$search_input_trm)
  })
  
  output$table_trm <- renderDT({
    filtered_trm_data()
  })

  # Server logic for Tex Prog tab
  output$texprog <- renderText({
    "TF Activity Score: Tex Prog"
  })
  
  # Tex Prog tab data
  texprog_data <- reactive({
    read_excel_file("www/tablePagerank/TEXprog.xlsx")
  })
  
  filtered_texprog_data <- reactive({
    filter_data(texprog_data(), input$search_input_texprog)
  })
  
  output$table_texprog <- renderDT({
    filtered_texprog_data()
  })
  

  # Server logic for Tex Eff-like tab
  output$texefflike <- renderText({
    "TF Activity Score: Tex Eff-like"
  })
  
  # Tex Eff-like tab data
  texefflike_data <- reactive({
    read_excel_file("www/tablePagerank/TEXeff.xlsx")
  })
  
  filtered_texefflike_data <- reactive({
    filter_data(texefflike_data(), input$search_input_texefflike)
  })
  
  output$table_texefflike <- renderDT({
    filtered_texefflike_data()
  })

  # Server logic for Tex Term tab
  output$texterm <- renderText({
    "TF Activity Score: Tex Term"
  })
  
  # Tex Term tab data
  texterm_data <- reactive({
    read_excel_file("www/tablePagerank/TEXterm.xlsx")
  })
  
  filtered_texterm_data <- reactive({
    filter_data(texterm_data(), input$search_input_texterm)
  })
  
  output$table_texterm <- renderDT({
    filtered_texterm_data()
  })
  
  #click image code for TF Wave Analysis
  observeEvent(input$c1_link, {
    updateNavbarPage(session, "mainNav", selected = "c1")
  })
  
  observeEvent(input$c2_link, {
    updateNavbarPage(session, "mainNav", selected = "c2")
  })
  
  observeEvent(input$c3_link, {
    updateNavbarPage(session, "mainNav", selected = "c3")
  })
  
  observeEvent(input$c4_link, {
    updateNavbarPage(session, "mainNav", selected = "c4")
  })
  
  observeEvent(input$c5_link, {
    updateNavbarPage(session, "mainNav", selected = "c5")
  })
  
  observeEvent(input$c6_link, {
    updateNavbarPage(session, "mainNav", selected = "c6")
  })
  
  observeEvent(input$c7_link, {
    updateNavbarPage(session, "mainNav", selected = "c7")
  })
  
  
  # TF regulated interaction in TRM and TEXterm
  # Function to read Excel files
  read_regulator_file <- function(path) {
    df <- read_excel(path)
    colnames(df)[1] <- " "  # Adjust column name as needed
    return(df)
  }
  
  # Load data initially
  tfregulated_data <- reactive({
    read_regulator_file("www/networkanalysis/comp_log2FC_RegulatedData_TRMTEXterm.xlsx")
  })
  
  # Filtered data based on search input
  filtered_tfregulated_data <- reactive({
    req(tfregulated_data())  # Ensure tfregulated_data() is available
    if (is.null(input$search_tfregulated_data) || input$search_tfregulated_data == "") {
      return(tfregulated_data())
    } else {
      # Perform filtering based on input$search_tfregulated_data
      # Example filtering logic:
      # filtered_data <- tfregulated_data() %>%
      #   filter(...)  # Add your filtering logic here
      # return(filtered_data)
      # Replace the above with your actual filtering logic
      return(tfregulated_data())  # Placeholder for now
    }
  })
  
  # Render the DataTable
  output$table_tfregulated_data <- renderDT({
    datatable(filtered_tfregulated_data())
  })
  
  
  # Search TF-TF Correlation in TRM/TEXterm
  # Function to read Excel files
  read_regulator_file <- function(path) {
    df <- read_excel(path)
    colnames(df)[1] <- "TF Name"  # Adjust column name as needed
    return(df)
  }
  
  # Load data initially
  tftfcorr <- reactive({
    read_regulator_file("www/TFcorintextrm/TF-TFcorrTRM_TEXterm.xlsx")
  })
  
  # Filtered data based on search input
  filtered_tftfcorr <- reactive({
    req(tftfcorr()) 
    if (is.null(input$search_tftfcorr) || input$search_tftfcorr == "") {
      return(tftfcorr())
    } else {
      # Perform filtering based on input$search_tftfcorr
      # Example filtering logic:
      # filtered_data <- tftfcorr() %>%
      #   filter(...)  # Add your filtering logic here
      # return(filtered_data)
      # Replace the above with your actual filtering logic
      return(tftfcorr())  # Placeholder for now
    }
  })
  
  # Render the DataTable
  output$table_tftfcorr <- renderDT({
    datatable(filtered_tftfcorr())
  })
  
  
}

# return(server)


# # ############################## CODE GRAVEYARD ##############################
# # # output$main <- renderUI({
# # #   # fluidRow(
# # #   #   column(12, align = "center", # Center the content
# # #   #          # Render the image
# # #   #          img(src = "pipelinecomp.jpeg", width = "30%")
# # #   #   ),
# # #     fluidRow(
# # #       column(12, align = "center", # Center the content
# # #              # Render the text as a paragraph
# # #              p("description placeholder")
# # #       )
# # #     )
# # #   # )
# # # })
# # # 
# # 
# # # output$main <- renderText({
# # #   tags$h1("All TF Activity Score")
# # # })
# # 
# # # output$mainui <- renderUI({
# # #     fluidRow(
# # #       column(12, align = "center", # Center the content
# # #              # Render the image
# # #              img(src = "pipelinecomp.jpeg", width = "30%")
# # #       ),
# # #       fluidRow(
# # #         column(12, align = "center", # Center the content
# # #                # Render the text as a paragraph
# # #                p("description placeholder")
# # #         )
# # #       )
# # #     )
# # #   })
# # 
# # # output$mainui <- renderUI({
# # #   fluidPage(
# # #     tabPanel("Main",
# # #              fluidRow(
# # #                        column(12, align = "center", # Center the content
# # #                               # Render the image
# # #                               tags$img(src = "pipeline.jpg", width = "100%")
# # #                        )
# # #                  ),
# # #              fluidRow(
# # #                column(12, align = "center", # Center the content
# # #                       # Render the image
# # #                       br(),
# # #                       br(),
# # #                       p("description placeholder")
# # #                )
# # #              )
# # #     )
# # #   )
# # # })
# # 
# # # output$naiveui <- renderUI({
# # #   fluidRow(
# # #     column(12, align = "center", # Center the content
# # #            # Render the image
# # #            tags$img(src = "_Naive_P005_F05_L31_single.jpg", width = "100%")
# # #     )
# # #   )
# # # })
# # 
# # # output$naive <- renderText({
# # #   "TF Activity Score: Naive"
# # # })

# # Function to read Excel files
# read_excel_file <- function(path) {
#   df <- read_excel(path)
#   colnames(df)[1] <- "Regulator Names"
#   return(df)
# }
# 
# # Function to filter data based on search input
# filter_data <- function(data, keyword) {
#   keyword <- tolower(keyword)
#   if (is.null(keyword) || keyword == "") {
#     return(data())
#   } else {
#     return(data()[apply(data(), 1, function(x) any(grepl(keyword, tolower(x)))), ])
#   }
# }
# 
# # Main page data
# data <- reactive({
#   read_excel_file("/Users/audrey/Downloads/research/ckweb/Tcellstates/www/Table_TF PageRank Scores for Audrey.xlsx")
# })
# 
# filtered_data <- reactive({
#   req(input$search_input)  # Ensure input is available
#   filter_data(data(), input$search_input)
# })
# 
# output$table <- renderDT({
#   filtered_data()
# })
#   
#   # Server logic for main page tab
#   # Read Excel file
#   data <- reactive({
#     df <- read_excel("/Users/audrey/Downloads/research/ckweb/Tcellstates/www/Table_TF PageRank Scores for Audrey.xlsx")
#     colnames(df)[1] <- "Regulator Names"  # Change the first column name
#     return(df)
#   })
#   
#   # Filter data based on search input
#   filtered_data <- reactive({
#     keyword <- tolower(input$search_input)
#     if (is.null(keyword) || keyword == "") {
#       return(data())
#     } else {
#       return(data()[apply(data(), 1, function(x) any(grepl(keyword, tolower(x)))), ])
#     }
#   })
#   
#   # Render the table
#   output$table <- renderDT({
#     filtered_data()
#   })
#   
#   # Server logic for naive tab
#   output$naive <- renderText({
#     "TF Activity Score: Naive"
#   })
#   
#   # Read Excel file for naive tab
#   naive_data <- reactive({
#     df <- read_excel("/Users/audrey/Downloads/research/ckweb/Tcellstates/www/Naive.xlsx")
#     return(df)
#   })
#   
#   # Filter data based on search input for naive tab
#   filtered_naive_data <- reactive({
#     keyword <- tolower(input$search_input_naive)
#     if (is.null(keyword) || keyword == "") {
#       return(naive_data())
#     } else {
#       return(naive_data()[apply(naive_data(), 1, function(x) any(grepl(keyword, tolower(x)))), ])
#     }
#   })


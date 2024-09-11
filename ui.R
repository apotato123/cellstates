library(shiny)
library(shinythemes)
library(DT)

setwd("/Users/audrey/Downloads/research/ckweb/Tcellstates")

# Define UI
ui <- navbarPage(
  title = "T Cell States",
  id = "mainNav",
  # title = tags$a("T Cell States", href = "#shiny-tab-home", style = "text-decoration: none; color: inherit;"),
  theme = shinytheme("flatly"),
  
  
  tabPanel(
    "Home",
    # Big header in a box
    tags$div(
      style = "background-color: #f8f9fa; padding: 20px;",
      tags$h1(
        "EPIGENETIC AND TRANSCRIPTIONAL ATLAS-ASSISTED SYSTEMIC IDENTIFICATION OF KEY TRANCRIPTION FACTORS
                            ENABLES SPECIFIC PROGRAMMING OF T CELL STATES",
        style = "font-size: 36px;",
        align = "center"
      )
    ),
    
    # Button saying "Read Now"
    tags$div(
      style = "text-align: center;",
      actionButton("read_now", "Read Now", style = "font-size: 24px; margin-top: 20px;")
    ),
    
    # Placeholder for content below the button
    uiOutput("home_content")
  ),
  
  
  navbarMenu(
    "TF Catalog",
    tabPanel("Description",
             # #image from ui
             fluidRow(
               column(
                 width = 12,
                 align = "center",
                 # Center the content
                 tags$h1("TF Activity Score"),
                 br(),
                 
                 tags$div(style = "background-color: #f8f9fa; padding: 20px;",
                          h2("TF Activity Pipeline", style = "font-size: 26px;")),
                 
                 br(),
                 
                 tags$img(
                   src = "pipeline.jpg",
                   style = "max-width: 80%; height: auto;",
                   alt = "something went wrong",
                   deleteFile = FALSE
                 ),
                 
                 br(),
                 br(),
                 
                 tags$div(style = "background-color: #f8f9fa; padding: 20px;",
                          p("Cell States", style = "font-size: 26px;")),
                 
                 br(),
                 
                 tags$img(
                   src = "csdescrip.jpeg",
                   style = "max-width: 80%; height: auto;",
                   alt = "something went wrong",
                   deleteFile = FALSE
                 ),
                 
                 br(),
                 br(),
                 
                 p(
                   "Naive T cells assume diverse cell states in different contexts, such as acute or chronic infection, or tumor. Once naive cells are activated, they become early effector (EE) cells that differentiate in a parallel manner into various CD8+ T cell subsets. Notable distinctions in trafficking patterns are signified by residence in lymphoid organs (gray), blood (red), or peripheral tissues (green)."
                 ),
                 p(
                   "In acute infection, several effector and memory states are found. TE (Terminal Effector) cells are typically found in the red pulp of spleen or blood, whereas MP (Memory Precursor) cells are primarily found in white pulp or lymphoid structures, but they are also capable of recirculation. TCM (Central memory) and TEM (Effector memory) cells both circulate in the blood, but TCM cells predominate in lymphoid organs, whereas TEM cells are also found in tissues. TPM cells are proposed to circulate throughout lymph, blood, and tissues. TRM (Tissue-resident memory) cells do not circulate much and reside long-term in tissues."
                 ),
                 p(
                   "As in acute infection, diverse states and distinct localization of CD8+ T cells are found in chronic infection. Chronic antigen presentation in chronic infection or tumor environment induces T cells to express inhibitory receptors that suppress T cell receptor signals. Concurrent transcriptional program and epigenetic modification lead to spectrum of T cell states in the trajectory of exhaustion such as TEXprog (Progenitor exhaustion), TEXteff (Effector-like exhaustion), and TEXterm (Terminal exhaustion). These heterogeneous cells display a progressive loss of function and memory potential. Ultimately, TEXterm become dysfunctional. Akin to cell states in acute infection, TEXprog and MP cells are often observed in lymphoid structures, yet their circulation tendency might not be equivalent. TEXteff and TEXterm cells are predominantly found in blood and peripheral tissue, respectively."
                 ),
                 p(
                   "In this study, we aimed to generate a pipeline to study the transcription factor regulation of each and every cell state which could allow therapeutic manipulation of T cell differentiation states. To achieve this goal, we generated an epigenetic and transcription atlas of major CD8+ T cell states in both memory and exhaustion contexts (totaling 9 cell states) via incorporating 121 experiments from multiple datasets. This then performed an unbiased comparative TF activity analysis across the cell states to identify unique and shared TF activities in heterogenous CD8+ T cell states."
                 )
                 
                 # tags$a(href = "#", id = "csdescrip_link",
                 #        tags$img(src = "csdescrip.jpeg", id = "csdescrip_img", style = "max-width: 80%; height: auto;", alt="something went wrong", deleteFile=FALSE)),
                 # p("Click the image above to zoom")
               )
             )),
    
    tabPanel("Search TF Scores",
             #search bar
             fluidRow(
               column(
                 width = 12,
                 align = "center",
                 # Center the content
                 # Search bar
                 textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
               )
             ),
             
             #read in excel file and make it searchable
             fluidRow(
               column(width = 12, align = "center", # Center the content
                      # Output table
                      DTOutput("table"))
             )),
    # navbarMenu("Cell State Specific TF Catalog",
    tabPanel(
      "Cell State Specific TF Catalog",
      navlistPanel(
        "Cell State Specific TF Catalog",
        tabPanel(
          "Naive",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("Naive Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/naivebubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            # Search bar
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12, align = "center", # Center the content
            DTOutput("table_naive")
          ))
        ),
        
        tabPanel(
          "TE",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("TE Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/tebubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            # Search bar
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12, align = "center", # Center the content
            DTOutput("table_te")
          ))
        ),
        
        tabPanel(
          "MP",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("MP Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/mpbubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            # Search bar
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12, align = "center", # Center the content
            DTOutput("table_mp")
          ))
        ),
        
        tabPanel(
          "Tcm",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("Tcm Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/tcmbubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            # Search bar
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12, align = "center", # Center the content
            DTOutput("table_tcm")
          ))
        ),
        
        tabPanel(
          "Tem",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("Tem Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/tembubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            # Search bar
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12, align = "center", # Center the content
            DTOutput("table_tem")
          ))
        ),
        
        tabPanel(
          "Trm",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("Trm Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/trmbubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            # Search bar
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12, align = "center", # Center the content
            DTOutput("table_trm")
          ))
        ),
        
        tabPanel(
          "TEXprog",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("TEXprog Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/texprogbubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            # Search bar
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            DTOutput("table_texprog")
          ))
        ),
        
        tabPanel(
          "TEXeff-like",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("TEXeff-like Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/texintbubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            # Search bar
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12,
            align = "center",
            # Center the content
            DTOutput("table_texefflike")
          ))
        ),
        
        tabPanel(
          "TEXterm",
          fluidRow(column(
            12,
            align = "center",
            # Center the content
            tags$h1("TEXterm Specific Cells & normalized TF Activity Scores"),
            p(
              "Below you will find the bubble plot and a searchable excel file containing all the normalized TF activity scores"
            ),
            br(),
            # Render the image
            tags$img(src = "bubbleplots/textermbubble.jpg", width = "100%")
          )),
          
          br(),
          br(),
          
          #search bar
          fluidRow(column(
            width = 12,
            align = "center",
            textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
          )),
          
          fluidRow(column(
            width = 12,
            align = "center",
            DTOutput("table_texterm")
          ))
        )
      )
    ),
    
    tabPanel(
      "Multi-Tasker TF Catalog",
      navlistPanel(
        "Multi-Tasker TF Catalog",
        tabPanel("Memory Group",
                 fluidRow(
                   column(
                     12,
                     align = "center",
                     # Center the content
                     tags$h1("Memory Group"),
                     tags$img(src = "placeholder.jpg", width = "100%")
                   )
                 )),
        tabPanel("TEX Group",
                 fluidRow(
                   column(
                     12,
                     align = "center",
                     # Center the content
                     tags$h1("TEX Group"),
                     tags$img(src = "placeholder.jpg", width = "100%")
                   )
                 )),
        tabPanel("TRM/TEX",
                 fluidRow(
                   column(
                     12,
                     align = "center",
                     # Center the content
                     tags$h1("TRM/TEX"),
                     tags$img(src = "placeholder.jpg", width = "100%")
                   )
                 )),
        tabPanel("Early Cell State",
                 fluidRow(
                   column(
                     12,
                     align = "center",
                     # Center the content
                     tags$h1("Early Cell State"),
                     tags$img(src = "placeholder.jpg", width = "100%")
                   )
                 )),
        tabPanel("Memory-like Cell State",
                 fluidRow(
                   column(
                     12,
                     align = "center",
                     # Center the content
                     tags$h1("TEX Group"),
                     tags$img(src = "placeholder.jpg", width = "100%")
                   )
                 )),
        tabPanel("Universal",
                 fluidRow(
                   column(
                     12,
                     align = "center",
                     # Center the content
                     tags$h1("TEX Group"),
                     tags$img(src = "placeholder.jpg", width = "100%")
                   )
                 ))
      )
    )
  ),
  
  navbarMenu(
    "TF Wave Analysis",
    tabPanel(
      "Overview",
      value = "overview",
      
      fluidRow(
        column(
          12,
          align = "center",
          tags$h1("TF Wave Analysis"),
          br(),
          tags$img(
            src = "tfwaveanal.png",
            style = "max-width: 80%; height: auto;",
            alt = "something went wrong",
            deleteFile = FALSE
          ),
          p(
            "Transcription factor waves are generated via integration of the unbiased clustering and prior immunology
                    knowledge. This curates catalogs of TFs associated with different cell states or differentiation trajectories. Circles
                    represent specific cell state. Color indicates normalized PageRank scores with red displaying high values. Click to
                    check TFs and GSEA results associated with each wave."
          ),
          
          br(),
          br(),
          
          tags$div(style = "background-color: #f8f9fa; padding: 20px;",
                   p("TF Waves", style = "font-size: 26px;")),
          br(),
          p(
            "Click on the wave images on the right to be redirected to their corresponding pages and find out more about them!"
          ),
          br(),
          br()
        )
      ),
      
      fluidRow(
        column(
          6,
          align = "center",
          fluidRow(
            column(6, align = "center",
                   h5("Wave 1"),
                   actionLink(
                     "c1_link",
                     tags$img(
                       src = "waveanalysis/c1.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   )),
            column(6, align = "center",
                   h5("Wave 2"),
                   actionLink(
                     "c2_link",
                     tags$img(
                       src = "waveanalysis/c2.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ))
          ),
          fluidRow(
            column(6, align = "center",
                   h5("Wave 3"),
                   actionLink(
                     "c3_link",
                     tags$img(
                       src = "waveanalysis/c3.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   )),
            column(6, align = "center",
                   h5("Wave 4"),
                   actionLink(
                     "c4_link",
                     tags$img(
                       src = "waveanalysis/c4.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ))
          ),
          fluidRow(
            column(6, align = "center",
                   h5("Wave 5"),
                   actionLink(
                     "c5_link",
                     tags$img(
                       src = "waveanalysis/c5.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   )),
            column(6, align = "center",
                   h5("Wave 6"),
                   actionLink(
                     "c6_link",
                     tags$img(
                       src = "waveanalysis/c6.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ))
          ),
          fluidRow(column(
            6, align = "center",
            h5("Wave 7"),
            actionLink(
              "c7_link",
              tags$img(
                src = "waveanalysis/c7.jpg",
                style = "max-width: 100%; height: auto;",
                deleteFile = FALSE
              )
            )
          ))
        ),
        
        column(
          6,
          align = "center",
          h5("Transcriptional Waves All Pathways"),
          tags$img(
            src = "waveanalysis/waveallpathway.jpg",
            style = "max-width: 100%; height: auto;",
            deleteFile = FALSE
          )
        )
      )
    ),
    
    tabPanel("Wave 1", value = "c1",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("Wave 1 Analysis"),
                 p("Details about the Wave 1 analysis go here."),
                 br(),
                 fluidRow(
                   column(
                     6,
                     align = "center",
                     tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                              p("Wave 1", style = "font-size: 20px;")),
                     tags$img(
                       src = "waveanalysis/c1.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ),
                   column(
                     6,
                     align = "center",
                     fluidRow(column(
                       12,
                       align = "center",
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("GO KEGG Result", style = "font-size: 20px;")),
                       tags$img(
                         src = "waveanalysis/c1_selected_GO_KEGG.jpg",
                         style = "max-width: 100%; height: auto;",
                         deleteFile = FALSE
                       )
                     )),
                     br(),
                     
                     fluidRow(
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("Ranked Text", style = "font-size: 20px;")),
                       column(
                         12,
                         align = "center",
                         tags$img(
                           src = "waveanalysis/txtJPG/c1_ranked_1.jpg",
                           style = "max-width: 100%; height: auto;",
                           deleteFile = FALSE
                         )
                       ),
                       column(
                         12,
                         align = "center",
                         tags$img(
                           src = "waveanalysis/txtJPG/c1_ranked_2.jpg",
                           style = "max-width: 100%; height: auto;",
                           deleteFile = FALSE
                         )
                       )
                     )
                   )
                 )
               )
             )),
    
    tabPanel("Wave 2", value = "c2",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("Wave 2 Analysis"),
                 p("Details about the Wave 2 analysis go here."),
                 br(),
                 fluidRow(
                   column(
                     6,
                     align = "center",
                     tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                              p("Wave 2", style = "font-size: 20px;")),
                     tags$img(
                       src = "waveanalysis/c2.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ),
                   column(
                     6,
                     align = "center",
                     fluidRow(column(
                       12,
                       align = "center",
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("GO KEGG Result", style = "font-size: 20px;")),
                       tags$img(
                         src = "waveanalysis/c2_selected_GO_KEGG_v2.jpg",
                         style = "max-width: 100%; height: auto;",
                         deleteFile = FALSE
                       )
                     )),
                     br(),
                     
                     fluidRow(
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("Ranked Text", style = "font-size: 20px;")),
                       column(
                         12,
                         align = "center",
                         tags$img(
                           src = "waveanalysis/txtJPG/c2_ranked.jpg",
                           style = "max-width: 100%; height: auto;",
                           deleteFile = FALSE
                         )
                       )
                     )
                   )
                 )
               )
             )),
    
    tabPanel("Wave 3", value = "c3",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("Wave 3 Analysis"),
                 p("Details about the Wave 3 analysis go here."),
                 br(),
                 fluidRow(
                   column(
                     6,
                     align = "center",
                     tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                              p("Wave 3", style = "font-size: 20px;")),
                     tags$img(
                       src = "waveanalysis/c3.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ),
                   column(
                     6,
                     align = "center",
                     fluidRow(column(
                       12,
                       align = "center",
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("GO KEGG Result", style = "font-size: 20px;")),
                       tags$img(
                         src = "waveanalysis/c3_selected_GO_KEGG.jpg",
                         style = "max-width: 100%; height: auto;",
                         deleteFile = FALSE
                       )
                     )),
                     br(),
                     
                     fluidRow(
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("Ranked Text", style = "font-size: 20px;")),
                       column(
                         12,
                         align = "center",
                         tags$img(
                           src = "waveanalysis/txtJPG/c3_ranked.jpg",
                           style = "max-width: 100%; height: auto;",
                           deleteFile = FALSE
                         )
                       )
                     )
                   )
                 )
               )
             )),
    
    tabPanel("Wave 4", value = "c4",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("Wave 4 Analysis"),
                 p("Details about the Wave 4 analysis go here."),
                 br(),
                 fluidRow(
                   column(
                     6,
                     align = "center",
                     tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                              p("Wave 4", style = "font-size: 20px;")),
                     tags$img(
                       src = "waveanalysis/c4.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ),
                   column(
                     6,
                     align = "center",
                     fluidRow(column(
                       12,
                       align = "center",
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("GO KEGG Result", style = "font-size: 20px;")),
                       tags$img(
                         src = "waveanalysis/c4_selected_GO_KEGG.jpg",
                         style = "max-width: 100%; height: auto;",
                         deleteFile = FALSE
                       )
                     )),
                     br(),
                     
                     fluidRow(
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("Ranked Text", style = "font-size: 20px;")),
                       column(
                         12,
                         align = "center",
                         tags$img(
                           src = "waveanalysis/txtJPG/c4_ranked.jpg",
                           style = "max-width: 100%; height: auto;",
                           deleteFile = FALSE
                         )
                       )
                     )
                   )
                 )
               )
             )),
    
    tabPanel("Wave 5", value = "c5",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("Wave 5 Analysis"),
                 p("Details about the Wave 5 analysis go here."),
                 br(),
                 fluidRow(
                   column(
                     6,
                     align = "center",
                     tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                              p("Wave 5", style = "font-size: 20px;")),
                     tags$img(
                       src = "waveanalysis/c5.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ),
                   column(
                     6,
                     align = "center",
                     fluidRow(column(
                       12,
                       align = "center",
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("GO KEGG Result", style = "font-size: 20px;")),
                       tags$img(
                         src = "waveanalysis/c5_selected_GO_KEGG.jpg",
                         style = "max-width: 100%; height: auto;",
                         deleteFile = FALSE
                       )
                     )),
                     br(),
                     
                     fluidRow(
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("Ranked Text", style = "font-size: 20px;")),
                       column(
                         12,
                         align = "center",
                         tags$img(
                           src = "waveanalysis/txtJPG/c5_ranked.jpg",
                           style = "max-width: 100%; height: auto;",
                           deleteFile = FALSE
                         )
                       )
                     )
                   )
                 )
               )
             )),
    
    tabPanel("Wave 6", value = "c6",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("Wave 6 Analysis"),
                 p("Details about the Wave 6 analysis go here."),
                 br(),
                 fluidRow(
                   column(
                     6,
                     align = "center",
                     tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                              p("Wave 6", style = "font-size: 20px;")),
                     tags$img(
                       src = "waveanalysis/c6.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ),
                   column(
                     6,
                     align = "center",
                     fluidRow(column(
                       12,
                       align = "center",
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("GO KEGG Result", style = "font-size: 20px;")),
                       tags$img(
                         src = "waveanalysis/c6_selected_GO_KEGG.jpg",
                         style = "max-width: 100%; height: auto;",
                         deleteFile = FALSE
                       )
                     )),
                     br(),
                     
                     fluidRow(
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("Ranked Text", style = "font-size: 20px;")),
                       column(
                         12,
                         align = "center",
                         tags$img(
                           src = "waveanalysis/txtJPG/c6_ranked.jpg",
                           style = "max-width: 100%; height: auto;",
                           deleteFile = FALSE
                         )
                       )
                     )
                   )
                 )
               )
             )),
    
    tabPanel("Wave 7", value = "c7",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("Wave 7 Analysis"),
                 p("Details about the Wave 7 analysis go here."),
                 br(),
                 fluidRow(
                   column(
                     6,
                     align = "center",
                     tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                              p("Wave 7", style = "font-size: 20px;")),
                     tags$img(
                       src = "waveanalysis/c7.jpg",
                       style = "max-width: 100%; height: auto;",
                       deleteFile = FALSE
                     )
                   ),
                   column(
                     6,
                     align = "center",
                     fluidRow(column(
                       12,
                       align = "center",
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("GO KEGG Result", style = "font-size: 20px;")),
                       tags$img(
                         src = "waveanalysis/c7_selected_GO_KEGG.jpg",
                         style = "max-width: 100%; height: auto;",
                         deleteFile = FALSE
                       )
                     )),
                     br(),
                     
                     fluidRow(
                       tags$div(style = "background-color: #f8f9fa; padding: 10px; text-align: center;",
                                p("Ranked Text", style = "font-size: 20px;")),
                       column(
                         12,
                         align = "center",
                         tags$img(
                           src = "waveanalysis/txtJPG/c7_ranked.jpg",
                           style = "max-width: 100%; height: auto;",
                           deleteFile = FALSE
                         )
                       )
                     )
                   )
                 )
               )
             ))
  ),
  
  # TF Network Analysis
  navbarMenu(
    "TF Network Analysis",
    tabPanel("TRM & TEM Network",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("TRM Network"),
                 br(),
                 tags$img(
                   src = "placeholder.jpg",
                   style = "max-width: 80%; height: auto;",
                   alt = "something went wrong",
                   deleteFile = FALSE
                 ),
                 p("Details about TRM Network go here.")
               )
             )),
    
    tabPanel(
      "TF Regulated Interaction in TRM/TEXterm",
      fluidRow(
        column(
          12,
          align = "center",
          tags$h1("TEXterm Network"),
          br(),
          tags$img(
            src = "placeholder.jpg",
            style = "max-width: 80%; height: auto;",
            alt = "something went wrong",
            deleteFile = FALSE
          ),
          p("Details about TEXterm Network go here.")
        ),
        
        #search bar
        fluidRow(column(
          width = 12,
          align = "center",
          textInput(
            "search_tfregulated_data",
            label = "Search",
            placeholder = "Enter interested regulator name..."
          )
        )),
        
        fluidRow(column(
          width = 12,
          align = "center",
          DTOutput("table_tfregulated_data")
        ))
      )
    ),
    
    tabPanel("TF Community in TRM/TEXterm",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("TF Community in TRM/TEXterm"),
                 br(),
                 tags$img(
                   src = "networkanalysis/trmvtexterm.jpg",
                   style = "max-width: 80%; height: auto;",
                   alt = "something went wrong",
                   deleteFile = FALSE
                 ),
                 p("Details about TRM v TEXterm Network go here.")
               )
             )),
    
    tabPanel("Search TF-TF Correlation in TRM/TEXterm",
             fluidRow(
               column(
                 12,
                 align = "center",
                 tags$h1("Search TF-TF Correlation in TRM/TEXterm"),
                 br(),
                 tags$img(
                   src = "placeholder.jpg",
                   style = "max-width: 80%; height: auto;",
                   alt = "something went wrong",
                   deleteFile = FALSE
                 ),
                 
                 #search bar
                 fluidRow(column(
                   width = 12,
                   align = "center",
                   textInput(
                     "search_tftfcorr",
                     label = "Search",
                     placeholder = "Enter interested regulator name..."
                   )
                 )),
                 
                 fluidRow(column(
                   width = 12,
                   align = "center",
                   DTOutput("table_tftfcorr")
                 ))
               )
             )),
  ),
  
  # Adding header with modal and JS
  header = tags$div(
    # Modal dialog to display the expanded image
    tags$div(
      id = "modalDialog",
      class = "modal",
      tags$div(
        class = "modal-content",
        tags$span(class = "close", HTML("&times;")),
        tags$div(
          style = "text-align: center;",
          tags$img(src = "csdescrip.jpeg", style = "max-width: 80%; height: auto;"),
          tags$p("Caption for the csdescrip image.")
        )
      )
    ),
    
    # Custom JavaScript for modal behavior
    tags$script(
      HTML(
        '
      $(document).ready(function(){
        $("#csdescrip_link").click(function(){
          $("#modalDialog").css("display", "block");
        });
        $(".close").click(function(){
          $("#modalDialog").css("display", "none");
        });
        $(window).click(function(event){
          if($(event.target).hasClass("modal")){
            $("#modalDialog").css("display", "none");
          }
        });
      });
    '
      )
    ),
    
    tags$script(
      HTML(
        "
    $(document).on('click', '#c1_link', function(e) {
      e.preventDefault();
      Shiny.setInputValue('c1_link_clicked', Math.random());
    });
  "
      )
    )
  )
)

# return(ui)


############################## CODE GRAVEYARD ##############################
#upload searchable excel file
# fluidRow(
#   column(width = 12, align = "center", # Center the content
#          # File upload
#          fileInput("upload_file", "Upload Excel File", accept = c(".xlsx")),
#          br(),
#          # Output for displaying table
#          tableOutput("excel_table")
#   )
# )

#search in old main page under TF Catalog

# #search bar
# fluidRow(
#   column(width = 12, align = "center", # Center the content
#          # Search bar
#          textInput("search_input", label = "Search", placeholder = "Enter interested regulator name...")
#   )
# ),
#
# #read in excel file and make it searchable
# fluidRow(
#   column(width = 12, align = "center", # Center the content
#          # Output table
#          DTOutput("table")
#   )
# )

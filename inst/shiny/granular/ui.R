library(shiny)
library(shinyjs)
library(rmarkdown)

mastersizer_vis <- function(outputId) {
  HTML(paste("<div id=\"", outputId, "\" class=\"shiny-network-output\"></div>", sep=""))
}

navbarPage(
  title = textOutput("granular_version"),
  id = "tabset",
  windowTitle = "granular",
  #First tabPanel for visualisation of data to estimate number of mixtures and where the centres are
  tabPanel(title = "Setup", value = "setup",
           useShinyjs(),
           tags$head(
             tags$script(src="//d3js.org/d3.v4.js"),
             tags$link(rel = 'stylesheet', type = 'text/css', href = 'custom.css')
           ),
           #sidebarPanel for data upload, 
           tags$div(id = "sidePanel", class = 'col-sm-4',
                    tags$form(class = 'well',
                              tags$div(class = 'row-fluid',
                                       fileInput('file', 'Choose CSV file', accept=c('text/csv', 
                                                                                     'text/comma-separated-values,text/plain', 
                                                                                     '.csv'))),
                              tags$div(class = 'row-fluid',
                                       selectInput("select_data", "Select data", c("Single sample", "Three samples", "Thirty-six samples"))),
                              tags$div(class = 'row-fluid',
                                       checkboxInput('use_example', 'Use example data')),
                              tags$div(class = 'row-fluid',
                                       downloadLink('download_example', "Download example data"))
                    ),
                    tags$form(id = 'guide', class = 'well',
                              tags$div(h4("Guide:"), 
                                       p(id = "step1", class = "inst", "1. Select Data"),
                                       p(id = "step2", class = "inst", "2. Click and drag on the plot to identify the area with true peaks"),
                                       p(id = "step3", class = "inst", "3. Click to identify peaks")),
                              actionButton("goButton", "4. Process Data", width = '100%')
                    )
           ),
           mainPanel(
             # textOutput("granular_version"),
             tags$script(src="plotter.js"),
             mastersizer_vis("mastersizer")
           )
  ),
  tabPanel(title = "Output", value = "output",
           shiny::dataTableOutput("longDataTable")
  ),
  tabPanel(title = HTML("Download output</a></li><li><button id='restartButton' type='button' class='action-button shiny-bound-input navbar-button'>Start again</button></li>"), 
           value = "downloads",
           div(class = "center-button",
               downloadButton("downloadTable", "Download output as csv", class = "center-button")
           ),
           div(class = "center-button",
               downloadButton("downloadPlot", "Download all fit plots as zip", class = "center-button")
           )
  ),
  tabPanel(title = "About",
           div(class = 'col-sm-4'),
           div(class = 'col-sm-4',
               includeMarkdown("about.md")
           )
  )
)
  
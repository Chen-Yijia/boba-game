#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(shinyWidgets)
library(summaryBox)
library(shinyalert)
library(plotly)
library(shinyjs)
source("components/mainPage/mainPageUI.R")
source("components/popupPage/popupPageUI.R")
source("components/helpPage/helpPageUI.R")
source("components/quitgamePage/quitgamePageUI.R")
source("serverFunctions/mainServer.R")

# data <- read.csv("Historical Sale.csv")
# day <- data$Day
# demand <- round(data$Demand,2)
# type <- data$Type
# reviseddata <- data.frame(day, demand, type)

data <- read.csv("Historical Sale copy.csv")
day <- data$Day
demandmt <- round(data$Milktea,2)
demandft <- round(data$Fruitstea,2)
reviseddata <- data.frame(day, demandmt,demandft)

# Define UI for application that draws a histogram
ui <- navbarPage(
  header = tags$head(
    tags$link(rel="stylesheet", href="https://unpkg.com/nes.css/css/nes.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
  ),
  # fluid = TRUE,
  "Boba shop",
  tabPanel("Simulator", 
           mainPage),
  tabPanel("Help",multiplePage),
  navbarMenu(
    "More",
    tabPanel("Restart game"),
    "----",
    tabPanel("Quit game",quitgamePage)
  )
  
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  # print("he")
  
  clicked <- reactiveValues(neworderClick = FALSE, submitClick = FALSE)
  rv <- reactiveValues(page = 1)
  sliderValues <- reactive({
    data.frame(
      Name = c("iceinteger",
               "milkinteger",
               "teainteger",
               "pearlinteger",
               "fruitsinteger",
               "jellyinteger",
               "mtpriceinteger",
               "ftpriceinteger"),
      Value = as.character(c(input$iceinteger,
                             input$milkinteger,
                             input$teainteger,
                             input$pearlinteger,
                             input$fruitsinteger,
                             input$jellyinteger,
                             input$mtpriceinteger,
                             input$ftpriceinteger
      )),
      stringsAsFactors = FALSE)
  })
  
  renderimagesActionDisplay(output)
  
  renderplotsHistoryPrice(input, output, reviseddata)
  
  menuquitPopUp(input)
  
  displayPanelText(output,clicked, sliderValues)
  
  observeEvent(input$submit, {
    clicked$submitClick = TRUE
    clicked$neworderClick = FALSE
    shinyjs::enable("iceinteger")
    shinyjs::enable("milkinteger")
    shinyjs::enable("teainteger")
    shinyjs::enable("pearlinteger")
    shinyjs::enable("fruitsinteger")
    shinyjs::enable("jellyinteger")
    shinyjs::enable("mtpriceinteger")
    shinyjs::enable("ftpriceinteger")
    shinyalert("Oopsies...Deal with deficiency? Let's first enter the number of allocated units of each ingredient for the two beverages!", type="error", html=T)
  })
  
  
  observeEvent(input$submitneworder, {
    print(sliderValues())
    clicked$neworderClick = TRUE
    clicked$submitClick = FALSE
    shinyjs::disable("iceinteger")
    shinyjs::disable("milkinteger")
    shinyjs::disable("teainteger")
    shinyjs::disable("pearlinteger")
    shinyjs::disable("fruitsinteger")
    shinyjs::disable("jellyinteger")
    shinyjs::disable("mtpriceinteger")
    shinyjs::disable("ftpriceinteger")})
  
  
  #help page
  observe({
    toggleState(id = "prevBtn", condition = rv$page > 1)
    toggleState(id = "nextBtn", condition = rv$page < NUM_PAGES)
    hide(selector = ".page")
    show(paste0("step", rv$page))
  })
  navPage <- function(direction) {
    rv$page <- rv$page + direction
  }
  observeEvent(input$prevBtn, navPage(-1))
  observeEvent(input$nextBtn, navPage(1))
  
  renderimagesHelpPage(output)
  
}
# Run the application 
shinyApp(ui = ui, server = server)

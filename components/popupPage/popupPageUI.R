library(shiny)
library(shinyalert)

popup <- fluidPage(
  useShinyalert(), 
  actionButton("start", "Start")
)

# slider
testcontent <- fluidPage(
  fluidRow(
    column(4,
           prettyCheckbox("milk", "Milk", FALSE, shape="round"),),
    column(4, 
           prettyCheckbox("tea", "Tea", FALSE, shape="round"),),
    column(4,
           prettyCheckbox("ice", "Ice", FALSE, shape="round"),),
    column(4,
           prettyCheckbox("fruits", "Fruits", FALSE, shape="round"),),
    column(4,
           prettyCheckbox("pearl", "Pearl", FALSE, shape="round"),),
    column(4,
           prettyCheckbox("jelly", "Jelly", FALSE, shape="round"),),
    column(6,
           # verbatimTextOutput("value"),
           sliderInput("obs", "Number of units allocated for milk tea:",
                       min = 0, max = 20, value = 10),),
    column(6,
           # verbatimTextOutput("value"),
           sliderInput("obs", "Number of units allocated for milk tea:",
                       min = 0, max = 20, value = 10))
  )
)

# text box
testcontent2 <- fluidPage(
  fluidRow(
    column(4,
           prettyCheckbox("milk", "Milk", FALSE, shape="round"),),
    column(4, 
           prettyCheckbox("tea", "Tea", FALSE, shape="round"),),
    column(4,
           prettyCheckbox("ice", "Ice", TRUE, shape="round"),),
    column(4,
           prettyCheckbox("fruits", "Fruits", FALSE, shape="round"),),
    column(4,
           prettyCheckbox("pearl", "Pearl", FALSE, shape="round"),),
    column(4,
           prettyCheckbox("jelly", "Jelly", FALSE, shape="round"),),
    column(6,
           textInput("testboxmt","Number of units allocated for milk tea:"),
           verbatimTextOutput("value"),),
    column(6,
           textInput("testboxmt","Number of units allocated for fruit tea:"),
           verbatimTextOutput("value1"))
  )
)

# # for the popup menus
# mtmenu <- fluidPage(
#   useShinyalert(), 
#   actionButton("mtmenu", "Pricing menu for milk tea")
# )
# ftmenu <- fluidPage(
#   useShinyalert(), 
#   actionButton("ftmenu", "Pricing menu for fruit tea")
# )

mt_ing_price <- h2("The ingredients required are as follows:",
                     column(12,"Milk: $0.6"),
                     column(12,"Tea: $0.6"),
                     column(12,"Pearl: $0.4"),
                     column(12,"Ice: $0.2"))
ft_ing_price <- h2("The ingredients required are as follows:",
                     column(12,"Tea: $0.8"),
                     column(12,"Fruits: $1.2"),
                   column(12,"Jelly: $0.5"),
                     column(12,"Ice: $0.2"))







notificationBox <- fluidPage(
  
  fluidRow(
    summaryBox2("There is new machine that will boost up your sales! Do you want to buy it!!!", "New Machine!", width = 10, icon = "fas fa-bell", style = "info"),
  ),
  
)

contentTags <- tagList(div("There is new machine that will boost up your sales! Do you want to buy it!!!"),
                       div(
                         class="notification-btn",
                         actionBttn(
                           inputId = "a1",
                           label = "Yes",
                           style = "simple", 
                           color = "primary",
                         ),
                         actionBttn(
                           inputId = "a2",
                           label = "No",
                           style = "simple", 
                           color = "primary",
                         ),
                       ))
                       

# notificationBox2 <- summaryBox2("There is new machine that will boost up your sales! Do you want to buy it!!!", "New Machine!", width = 10, icon = "fas fa-bell", style = "info")

notificationBox2 <- summaryBox2(contentTags, "New Machine!", width = 10, icon = "fas fa-bell", style = "info")
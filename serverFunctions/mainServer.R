
renderimagesActionDisplay <- function(output) {
  output$iceimg <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/2458/2458132.png", height="100%", width="100%")})
  output$milkimg <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/372/372973.png", height="100%", width="100%")})
  output$teaimg <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/714/714113.png", height="100%", width="100%")})
  output$pearlimg <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/7519/7519289.png", height="100%", width="100%")})
  output$fruitsimg <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/1625/1625048.png", height="100%", width="100%")})
  output$jellyimg <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/184/184579.png", height="100%", width="100%")})
  output$milkteaimg <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/3081/3081162.png", height="100%", width="100%")})
  output$fruitsteaimg <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/5304/5304705.png", height="100%", width="100%")})
  
  
  output$iceimg1 <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/2458/2458132.png", height="70%", width="70%")})
  output$milkimg1 <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/372/372973.png", height="70%", width="70%")})
  output$teaimg1 <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/714/714113.png", height="70%", width="70%")})
  output$pearlimg1 <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/7519/7519289.png", height="70%", width="70%")})
  output$fruitsimg1 <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/1625/1625048.png", height="70%", width="70%")})
  output$jellyimg1 <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/184/184579.png", height="70%", width="70%")})
  output$milkteaimg1 <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/3081/3081162.png", height="70%", width="70%")})
  output$fruitsteaimg1 <- renderUI({
    tags$img(src = "https://cdn-icons-png.flaticon.com/512/5304/5304705.png", height="70%", width="70%")})
  
}

renderplotsHistoryPrice <- function(input, output, reviseddata) {
  # history plot
  output$previousdata <- renderPlotly({
    # p <- ggplot()+geom_line(data=reviseddata,aes(x=day,y=demand, color=type),size=1.5)+geom_point()+labs(x="Day",y="Demand for milk tea")+
    #   theme(plot.background=element_rect(fill="#FFF89A"),axis.title=element_text(size=14, face="bold"),panel.background=element_blank(),axis.line=element_line(colour="black"),panel.grid.major = element_blank(), panel.grid.minor = element_blank())
    # 
    # fig <- ggplotly(p, width = 834.500, height = 230)
    
    fig <- plot_ly(reviseddata, x = ~day, height = 230)
    fig <- fig %>% add_trace(y = ~demandmt, name = 'Milk tea', type = 'scatter', mode = 'lines', line = list(color = 'rgba(154, 220, 255, 1)', width = 3))
    fig <- fig %>% add_trace(y = ~demandft, name = 'Fruits tea', mode = 'lines', line = list(color = 'rgba(255, 138, 174, 1)', width = 3)) 
    fig <- fig %>% layout(xaxis = list(title = '<b>Day</b>', showgrid = FALSE),
                          yaxis = list (title ='<b>Demand</b>', showgrid = FALSE),
                          paper_bgcolor='rgba(0,0,0,0)',
                          plot_bgcolor='rgba(0,0,0,0)',
                          legend = list(x = 0.1, y = 1))
    fig
  })
  
  output$currentdata <- renderPlot({
    ggplot(data2,aes(x=Price_MT,y=Demand_MT))+geom_line()+labs(x="Price for milk tea",y="Demand for milk tea")+
      theme(plot.background=element_rect(fill="#FFF89A"),axis.title=element_text(size=14, face="bold"),panel.background=element_blank(),axis.line=element_line(colour="black"),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),) +
      geom_vline(xintercept = input$mtpriceinteger, color = "#FF8AAE", size = 2)
  }, height = 266)
  output$currentdata2 <- renderPlot({
    ggplot(data2,aes(x=Price_FT,y=Demand_FT))+geom_line()+labs(x="Price for fruit tea",y="Demand for fruit tea")+
      theme(plot.background=element_rect(fill="#FFF89A"),axis.title=element_text(size=14, face="bold"),panel.background=element_blank(),axis.line=element_line(colour="black"),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),) +
      geom_vline(xintercept = input$ftpriceinteger, color = "#FF8AAE", size = 2)
    
  }, height = 266)
}

deficiencypopup <- function(input) {
  observeEvent(input$submit, {
    shinyalert("Ice allocation", imageUrl="https://cdn-icons-png.flaticon.com/512/2458/2458132.png", type="warning", html=T, text=tagList(testcontent2))
  })
  observeEvent(input$submit, {
    shinyalert("Milk allocation", imageUrl="https://cdn-icons-png.flaticon.com/512/372/372973.png", type="warning", html=T, text=tagList(testcontent2))
  })
  observeEvent(input$submit, {
    shinyalert("Tea allocation", imageUrl="https://cdn-icons-png.flaticon.com/512/714/714113.png", type="warning", html=T, text=tagList(testcontent2))
  })
  observeEvent(input$submit, {
    shinyalert("Pearl allocation", imageUrl="https://cdn-icons-png.flaticon.com/512/7519/7519289.png", type="warning", html=T, text=tagList(testcontent2))
  })
  observeEvent(input$submit, {
    shinyalert("Fruits allocation", imageUrl="https://cdn-icons-png.flaticon.com/512/1625/1625048.png", type="warning", html=T, text=tagList(testcontent2))
  })
  observeEvent(input$submit, {
    shinyalert("Jelly allocation", imageUrl="https://cdn-icons-png.flaticon.com/512/184/184579.png", type="warning", html=T, text=tagList(testcontent2))
  })
}

menuquitPopUp <- function(input) {
  # for the menu
  observeEvent(input$mtmenu, {
    shinyalert("Pearl milk tea", imageUrl="https://cdn-icons-png.flaticon.com/512/3081/3081162.png", type="info", html=T, text=tagList(mt_ing_price))
  })
  observeEvent(input$ftmenu, {
    shinyalert("Fruit tea",imageUrl="https://cdn-icons-png.flaticon.com/512/5304/5304705.png", type="info", html=T, text=tagList(ft_ing_price))
  })
  
  # for quit game
  observeEvent(input$quitgame, {
    shinyalert("Quit game", confirmButtonText = "OK", cancelButtonText = "Cancel", showCancelButton = TRUE,
               showConfirmButton = TRUE, type="error", html=T, text="Progress in this level will be lost. Are you sure you want to quit?")
  })
}

displayPanelText <- function(output, clicked, sliderValues) {
  # for display slider input in the display panel
  output$icequantitydisplay <- renderText({
    if (clicked$neworderClick && !clicked$submitClick) {
      sliderValues()$Value[1]}
    else {
      ""
    }})
  
  output$milkquantitydisplay <- renderText({
    if (clicked$neworderClick && !clicked$submitClick) {
      sliderValues()$Value[2]}
    else {
      ""
    }})
  output$teaquantitydisplay <- renderText({
    if (clicked$neworderClick && !clicked$submitClick) {
      sliderValues()$Value[3]}
    else {
      ""
    }})
  output$pearlquantitydisplay <- renderText({
    if (clicked$neworderClick && !clicked$submitClick) {
      sliderValues()$Value[4]}
    else {
      ""
    }})
  output$fruitsquantitydisplay <- renderText({
    if (clicked$neworderClick && !clicked$submitClick) {
      sliderValues()$Value[5]}
    else {
      ""
    }})
  output$jellyquantitydisplay <- renderText({
    if (clicked$neworderClick && !clicked$submitClick) {
      sliderValues()$Value[6]}
    else {
      ""
    }})
  output$mtpricedisplay <- renderText({
    if (clicked$neworderClick && !clicked$submitClick) {
      paste0("$ ",sliderValues()$Value[7])}
    else {
      ""
    }})
  output$ftpricedisplay <- renderText({
    if (clicked$neworderClick && !clicked$submitClick) {
      paste0("$ ",sliderValues()$Value[8])}
    else {
      ""
    }})
}

renderimagesHelpPage <- function(output) {
  output$logoimg <- renderUI({
    tags$img(src = "https://i.ibb.co/tCypjv4/Screenshot-2022-06-29-at-9-21-30-PM.png", height="60%", width="80%")})
  
  output$labelimg <- renderUI({
    tags$img(src = "https://i.ibb.co/fvvn1GV/Screenshot-2022-06-29-at-9-20-22-PM.png")})
  
  output$portionimg <- renderUI({
    tags$img(src = "https://i.ibb.co/6m3g8ZV/Screenshot-2022-06-29-at-9-37-11-PM.png", height="60%", width="80%")})
  
  output$ingpriceimg <- renderUI({
    tags$img(src = "https://i.ibb.co/7vkTFhc/Screenshot-2022-06-29-at-9-38-28-PM.png", height="60%", width="80%")})
  
  output$demanddayimg <- renderUI({
    tags$img(src = "https://i.ibb.co/M9wLT48/plot.png")})
  
  output$demandpriceimg <- renderUI({
    tags$img(src = "https://i.ibb.co/n00FcRf/plot2.png", height="55%", width="80%")})
  
  output$gameinputimg <- renderUI({
    tags$img(src = "https://i.ibb.co/5KPKb1L/Screenshot-2022-06-30-at-12-26-30-AM.png", height="80%", width="100%")})
  
  output$procedureimg <- renderUI({
    tags$img(src = "https://i.ibb.co/rtwJHKD/Screenshot-2022-06-30-at-12-56-20-AM.png", height="100%", width="100%")})
  
  output$procedureimg <- renderUI({
    tags$img(src = "https://i.ibb.co/8Bkqs6C/esa-game-layout.png", height="100%", width="100%")})
  
  output$scoreimg <- renderUI({
    tags$img(src = "https://i.ibb.co/0czkS5b/score.png")})
}
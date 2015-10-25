library(shiny)


shinyServer(
  function(input, output) {
    output$totalemployees <- renderPrint({input$totalemployees})
    output$futuresoftwareusers <- renderPrint({input$futuresoftwareusers})
    output$currentsoftwareusers <- renderPrint({input$currentsoftwareusers})
    
    licensescost = reactive({input$futuresoftwareusers * 100 })
    developmentcosts = reactive({input$futuresoftwareusers * 100})
    trainingcosts = reactive({input$futuresoftwareusers * 15})
    organizationalchangescosts = reactive({(input$currentsoftwareusers/input$totalemployees)*100*200})
    
 
    output$prediction <- renderPrint({
       licensescost() + developmentcosts() + trainingcosts() + organizationalchangescosts()
    })
    
    output$pie <- renderPlot(
      pie(c(licensescost(),developmentcosts(),trainingcosts(),organizationalchangescosts()), labels = c("licenses","development","training","organizational changes"))
    
    )
  }
)
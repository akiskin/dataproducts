library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Software Implementation Project Cost Prediction"),
    
    sidebarPanel(
      
      helpText("To predict total project cost we need to know size of your business. Fill in 3 simple parameters below."),
      numericInput('totalemployees', 'Total company employees', 100, min = 1, max = 5000, step = 1),
      numericInput('futuresoftwareusers', 'Users in future', 20, min = 1, max = 5000, step = 1),
      numericInput('currentsoftwareusers', 'Current users', 20, min = 1, max = 5000, step = 1),
      helpText("Now submit it and look at the right panel to see results."),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of calculation on the basis of data you provided'),
      helpText("We show you total cost and how it splits into 4 main components"),
      h4('Predicted total cost is '),
      verbatimTextOutput("prediction"),
      h4('How the cost is split between main components'),
      helpText("Components are: Licenses, Development, Training and costs to change organization (processes, mentality, etc)."),
      plotOutput('pie')
    )
  )
)
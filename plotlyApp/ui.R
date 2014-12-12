library(shiny) 

shinyUI(
      pageWithSidebar(
            
            headerPanel(title=HTML("Plotly in Shiny"), windowTitle="Plotly in Shiny"),
            
            sidebarPanel(
                  checkboxGroupInput(inputId="check_group",  # ID to be used in server.R
                                     label="Select species:",
                                     choices=list("Setosa"="setosa",  # Make sure not to mix names with values
                                                  "Versicolor"="versicolor",
                                                  "Virginica"="virginica"),
                                     selected=list("setosa", "versicolor", "virginica"))
            ),
            
            mainPanel(
                  htmlOutput("plot")  # Argument name from server.R
            )
      ))
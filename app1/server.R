```{r}
diabetesRisk <- function(glucose) glucose / 200
shinyServer(
      function(input, output) {
            output$inputValue <- renderText({input$glucose})
            output$prediction <- renderText({diabetesRisk(input$glucose)})
      }
)


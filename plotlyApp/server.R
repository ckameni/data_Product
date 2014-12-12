library(shiny) # Load libraries we will be using
library(plotly)

shinyServer(function(input, output) {
      
      output$plot <- renderUI({  # "plot" to be used as argument in server.R
            
            subset_iris <- iris[iris$Species %in% input$check_group, ]  # Subset dataset
            
            ggiris <- qplot(x=Petal.Width, y=Sepal.Length, data=subset_iris, color=Species)
            
            py <- plotly("r_user_guide", "mw5isa4yqp", "https://plot.ly")  # Open Plotly connection
            
            res <- py$ggplotly(ggiris, kwargs=list(filename="Plotly in Shiny", 
                                                   fileopt="overwrite", # Overwrite plot in Plotly's website
                                                   auto_open=FALSE))
            
            tags$iframe(src=res$response$url,
                        frameBorder="0",  # Some aesthetics
                        height=400,
                        width=650)
            
      })
})
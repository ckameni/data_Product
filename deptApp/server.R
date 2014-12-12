library(shiny)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      
      # Expression that generates a histogram. The expression is
      # wrapped in a call to renderPlot to indicate that:
      #
      #  1) It is "reactive" and therefore should re-execute automatically
      #     when inputs change
      #  2) Its output type is a plot
      
      output$invest <- renderPrint({input$invest})
      
      
      output$odate <- renderPrint({input$date})
      
      
      output$view <- renderTable({
            input$goButton
            Repayment<-c(0) 
            Interest<-c(0) 
            schuldenBetrag<-input$invest;
            i<-input$rate;
            n <- input$n
            
            #==============================================================
            e<-0
            tilg<-schuldenBetrag / n
            time<-"year_0"
            for(a in 2:(n+1)) {
                  #tilg<-schuldenBetrag / n
                  Repayment[a] <- tilg
                  #==============================================================
                  b<-a-1
                  schuldenBetrag[a] <- schuldenBetrag[b] - Repayment[a]
                  #==============================================================
                  Interest[a] <- i * schuldenBetrag[b]
                  c<-b-1
                  time[a]<-paste("year_",b)
            }
            Zahlungsreihe <- Interest+ Repayment
            #amortization<-Repayment  #je l'ai supprimé de l'objet table()
            schuldenBetrag<-abs(schuldenBetrag)
            table<- cbind(Zahlungsreihe,Interest,Repayment,schuldenBetrag)
            Names<-c("Payment","Interest Paid","Principal Paid","Remaining Balance")
            colnames(table)<-Names;  rownames(table)<-time
            table
            
            
      })
})


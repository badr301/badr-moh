

library(shiny)
x    <- seq(0,0.04,0.0001)  # Old Faithful Geyser data
# Define server logic for slider examples
shinyServer(function(input, output) {
  
  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("SampleSize", 
               "AQL",
               "PopulationSize",
               "NumberOfDefects"
              # "Probability of Acceptance"
              ),
      Value = as.character(c(input$SampleSize, 
                             input$AQL,
                             input$PopulationSize,
                             input$NumberOfDefects
                             )), 
      stringsAsFactors=FALSE)
  }) 
    sliderxxx <- reactive({
    df <- data.frame( 
      Name = c("Confidence Using Binomial", 
               "Confidence using Poisson",
               "Confidence using Hypergeometric"
               
      ),
      Value =c( paste(round((1-pbinom(input$NumberOfDefects,input$SampleSize,input$AQL))*100,digits=3),"%",sep=" "),
     paste(round((1-ppois(input$NumberOfDefects, lambda = input$SampleSize*input$AQL))*100,digits=3),"%",sep=" "),
     paste(round((1-phyper(input$NumberOfDefects,round(input$AQL*input$PopulationSize),input$PopulationSize,input$SampleSize))*100,digits=3),"%",sep=" ")
    
    ))
    
  }) 
  
 
  
 
  ###########
  
  
  
  
  output$distPlot <- renderPlot({

    
    tt <- pbinom(input$NumberOfDefects,input$SampleSize,x)
    hp <- phyper(input$NumberOfDefects,round(x*input$PopulationSize),input$PopulationSize,input$SampleSize)
    pp <- ppois(input$NumberOfDefects, lambda = input$SampleSize*x)
    
    #Plots
    plot(x, tt, col = 'blue', border = 'white', type = "b")
    par(new = TRUE)
    plot(x, hp, col = 'black', border = 'white')
    par(new = TRUE)
    plot(x, pp, col = 'red', border = 'white', type = "b")
    abline(v=input$AQL,col='3')
    #abline(v=x[which.min(abs(bb - input$AQL))],col='3')
    
    
  })
 
 
    
##################################################
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
  
  ###########
  output$xxx <- renderTable({
    sliderxxx()
  })
  
  ################################################################################
  
  
})









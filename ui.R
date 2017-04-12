library(shiny)

# Define UI for slider
shinyUI(pageWithSidebar(
  
  #  Application title
  headerPanel("Opearating Characteristic Curve"),
  
  # Sidebar with sliders that demonstrate various available options
  sidebarPanel(
    # Simple SampleSize Slider
    sliderInput("SampleSize", "SampleSize:", 
                min=0, max=5000, value=500),
    
    # AQL Slider
    sliderInput("AQL", "AQL:", 
                min = 0, max = 0.02, value = 0.001, step= 0.0001),
    
    # Population Size Slider
    sliderInput("PopulationSize", "PopulationSize:",
                min = 1, max = 100000, value = 1000),
    
    # Number of Defects Slider
    sliderInput("NumberOfDefects", "NumberOfDefects:", 
                min = 0, max = 20, value = 0, step = 1)
   
  ),
  
  
  # Output
  mainPanel(
    tableOutput("values"),
    plotOutput("distPlot"),
    tableOutput("xxx")
  )
))










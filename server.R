library(shiny)
library(datasets)
library(UsingR)

#Build the model to predict the child's height.

data(galton)
predC <- lm(child ~ ., data=galton)

shinyServer(function(input, output) {
  
#Prepare the input variables and predict the child's height.
  
  cht <- reactive({
    fht <- as.numeric(input$fh)
    mht <- as.numeric(input$mh) * 1.08
    round(predict(predC, data.frame(parent=(mht + fht)/2)),0)
    
  })
  
#Create an output variable with the predicted height.
  output$ch <- renderText({
    paste(cht()," Inches")
  })
  
})

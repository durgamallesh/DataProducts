library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict a child's height"),
 
  # Sidebar with controls to capture Mother and Father heights.
  sidebarLayout(
    sidebarPanel(
      
      helpText("Please enter parents' height in inches to predict the child's height."),
      
      numericInput("mh", "Mother's Height in inches:",60 ),
      
      numericInput("fh", "Father's Height in inches:",72 ),
      
      submitButton("Predict")
    ),
    
    
    # Show the predicted height and also the documentation needed to explain the model.
    mainPanel(
      h4("Child's Projected Height is:"),
      textOutput("ch", container = span),
      h4("Dataset used:"),
      p("The child's height is predicted based on the information gathered in 1885 by Galton. More information about the data can be found", a('here',href="http://www.inside-r.org/packages/cran/UsingR/docs/galton")),
      h4("Data Transformations:"),
      p("Mother's height is increased by 8% and then the average of both the heights is considered to predict the child's height, the reason for adjustment can be found",a("here",href="http://chance.amstat.org/2013/09/1-pagano/"))
    )
  )
)
)
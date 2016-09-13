library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Child height prediction"),
  
    sidebarPanel(
      numericInput('father_num', "Father's height (inches)", 69, min = 20, max = 100, step = 1),
      numericInput('mother_num', "Mother's height (inches)", 64, min = 20, max = 100, step = 1),
      radioButtons("gender_cbx", "Expected child's gender",
                         c("Male" = "male",
                           "Female" = "female")),
      p("Instructions: Please enter the father's height in inches, the mother's height in inches and the expected child's gender.  The predicted child's height will be displayed on the right", style = "color:blue")
    ),
    mainPanel(
        h3('You entered'),
        h4("Father's height"),
        verbatimTextOutput("father_o"),
        h4("Mother's height"),
        verbatimTextOutput("mother_o"),
        h4("Expected child's gender"),
        verbatimTextOutput("gender_o"),
        h3('Result of prediction'),
        h4("Predicted child's height (inches)"),
        verbatimTextOutput("height_o")
    )
  )
)


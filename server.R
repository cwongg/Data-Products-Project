library(shiny)
library(UsingR)
library(caret)

data(GaltonFamilies)

heightFit <- train(childHeight~ gender + father + mother,data=GaltonFamilies,method="glm")

predictHeight <- function (father, mother, gender) {
  predict(heightFit, data.frame(father=father, mother = mother, gender=gender))
  
}


shinyServer(
  function(input, output) {
    
    output$father_o <- renderText({input$father_num})
    output$mother_o <- renderText({input$mother_num})
    output$gender_o <- renderText({input$gender_cbx})
    output$height_o <- renderText({
      predictHeight(input$father_num, input$mother_num, input$gender_cbx)
    })
    
  }
)

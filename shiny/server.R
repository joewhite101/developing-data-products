library(shiny)
library(rpart)
train <- read.csv("data/train.csv")
my_tree <- rpart(Survived ~ Sex + Age + SibSp + Parch + Fare, data=train, method="class")

shinyServer(
  
  function(input, output){

    my_prediction <- reactive({
      
      inputGender <-input$gender
      inputAge <- input$age
      inputSibs <- input$sibs
      inputParents <- input$parents
      inputFare <- input$fare
      
      
      inputData <- data.frame(Sex=inputGender, Age=inputAge, SibSp=inputSibs, Parch=inputParents,Fare=inputFare)
      inputData$Parch <-as.numeric(inputData$Parch)
      #colnames(inputData) <- c("Sex", "Age","SibSp","Parch","Fare")
      my_prediction <- predict(my_tree, inputData, type="class")    
      
      if(my_prediction==1){
        "Survived"
      }else{
        "Perished"
      }
      
      
    })
  
    
    output$survived <- renderPrint(my_prediction())
    
    
   
  }
)
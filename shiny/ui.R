library(shiny)

shinyUI(pageWithSidebar(
  headerPanel(p("Developing Data Products -- Joe White")),
  
  sidebarPanel(
    h3('Documentation'),
    h5(p("This application predicts the survival of a passenger on the Titanic based on factors of Age, Number of siblins/spouses on-bard, the fare
       paid by the passenger, the passengers gender and the whether or not the passengers parents were on-board. The application will display\"Survived\" or
      \"Perished\" depending on the model outputs. This application is based on data from
         the DataCamp Kaggle tutorial that can be found at: https://www.datacamp.com/"),

      p("To use the application enter the values below and hit the blue Submit button. A sample input that changes the prediction to Perished is: Age=34.5 Number of siblings=0, Fare=7.8, Gender=Male, Parents On-Board=No" )),
    
    h3('Prediction Inputs'),
    numericInput('age','Age', 0, min=0,max=100,step=1,width = '90px'),
    numericInput('sibs','Number of sibilings/spouses on-board', 0, min=0,max=10,step=1,width = '90px'),
    numericInput('fare','Fare (max 515)', 0, min=0,max=515,step=1,width = '90px'),
    radioButtons('gender', 'Gender',c("Male" = "male",
                                            "Female" ="female")),
    radioButtons('parents', 'Parents On-Board',c("Yes" = 1,
                                            "No" =0)),
    
    submitButton("Submit")
  ),
  mainPanel(
    h3('Survival Prediction:'),
    verbatimTextOutput("survived")
  
    )
))
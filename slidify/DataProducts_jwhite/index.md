---
title       : Developing Data Products Project
subtitle    : Interactive Data Camp Prediction
author      : Joe White
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

- The objective of this presentation is to demonstrate slidify using the Kaggle examples from DataCamp
  - The data and problem definition for this presentation come from here (https://campus.datacamp.com/courses/kaggle-r-tutorial-on-machine-learning)
  - DataCamp has free courses on machine learning and other techniques. A great addition to your Johns Hopkins Coursera Courses!
- Simple data set to predict fatality rates on the Titanic by gender, age, and other factors
- This presentation makes the machine learning algorith taught by DataCamp interactive!
  - You will input an age, gender, and other factors and the algorithm will predict if you would have survived

---

## The Algorithm and Prediction

- The algorithm used to predict the data is a simple classification using the built in rpart library
  - More on rpart can be found here: https://cran.r-project.org/web/packages/rpart/rpart.pdf
- The algorithm builds a simple decision tree to predict survival based on:
  - Passenger Class
  - Gender
  - Age
  - Number of sibilings/spouses on-board
  - Parents onboard
  - Fare
  - Port of Embarkation


---


## The Code

- The code to generate the decision tree


```r
# Build the decision tree
train <- read.csv("data/train.csv")
my_tree <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, 
                 data=train, method="class")
```

---

## Plotting the Decision Tree

- A decision tree of the model generated Using the tools from rattle, rpart.plot, and RColorBrewer 

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

---

## Output and Quality


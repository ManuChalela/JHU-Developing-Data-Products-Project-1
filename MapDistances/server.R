#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
require(tspmeta)
require(gmp)
require(cluster)
require(raster)

calculateBMI <- function(weight, height, selectweight, selectheight) {
    if(selectweight == 2){
        # convert pounds to kgs
        weight = weight * 0.453592
    }
    if(selectheight == 2){
        # convert inches to cm
        height = height * 2.54
    }
    return((weight / (height * height)) * 10000)
}

bmiToLabel <- function(bmi) {
    # Underweight = <18.5
    # Normal weight = 18.5-24.9 
    # Overweight = 25-29.9 
    # Obesity = BMI of 30 or greater
    
    if(bmi < 18.5) {
        return("This is considered underweight.")
    }
    else if(bmi < 25) {
        return("This is considered normal.")
    }
    else if(bmi < 30) {
        return("This is considered overweight.")
    }
    else {
        return("This is considered obese.")
    }
}

shinyServer(
    function(input, output) {
        output$bmi <- renderPrint({calculateBMI(input$weight, input$height, input$selectweight, input$selectheight)})
        output$label <- renderPrint({bmiToLabel(calculateBMI(input$weight, input$height, input$selectweight, input$selectheight))})
    }
)
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(forcats)
library(leaflet)
library(ukpolice)
library(opencage)
library(highcharter)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
    headerPanel("Body mass index (BMI) calculator"),
    sidebarPanel(
        numericInput(
            'weight',
            h3('Input Weight'),
            75,
            min = 0,
            max = 1000,
            step = 1
        ),
        selectInput(
            'selectweight',
            h3("Weight measure"),
            choices = list(
                "Kilograms" = 1,
                "Pounds" = 2
            ),
            selected = 1
        ),
        numericInput(
            'height',
            h3('Input height'),
            175,
            min = 0,
            max = 250,
            step = 1
        ),
        selectInput(
            'selectheight',
            h3("Height measure"),
            choices = list(
                "centimetres" = 1,
                "inches" = 2
            ),
            selected = 1
        ),
        submitButton('Calculate BMI')
    ),
    mainPanel(
        h3('Results'),
        h4('Your BMI is...'),
        verbatimTextOutput("bmi"),
        verbatimTextOutput("label")
    )
))
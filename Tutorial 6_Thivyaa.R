install.packages("shiny")
intall.packages("rsconnect")
library(shiny)
library(rsconnect)

#Calculator for a Surface Area of a Sphere
ui<- pageWithSidebar(
  #Application title
  headerPanel("Surface Area of a Sphere"),
  sidebarPanel(
    numericInput('r', 'in cm',20, min = 1, max = 200,step = 0.1
  ),
  submitButton('Submit')
  ),
  mainPanel(
    h3('The surface area of the sphere is'),
    h4('The radius entered in cm'),
    verbatimTextOutput("inputValuer"),
    h4('The result of the surface area is :'),
    verbatimTextOutput("Area")
  )
)
  
Area<- function(r) 4*pi*(r^2)

server<- function(input, output) {
  output$inputValuer <- renderPrint({input$r})
  output$Area<- renderPrint({Area(input$r)})
}

shinyApp(ui = ui, server = server)

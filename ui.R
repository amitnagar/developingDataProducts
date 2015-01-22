library(shiny)

shinyUI(fluidPage(
  
  
  titlePanel("Graduation Rate vs School Enrollment"),
  
  sidebarLayout(
    sidebarPanel( 
      
      selectInput("select", h5("School Enrollment"), 
                  c("under 500", "between 501-1000", "more than 1000")),    
      
      checkboxInput("allSchools", "Show All Schools", FALSE),
      
      br(),
      p("Uncheck when selecting from drop down")

      ),
    
    mainPanel(
      h4("Selected Schools"),
      textOutput("selected"),
      textOutput("showAllData",),
      tableOutput("output1")
    )
  )
))
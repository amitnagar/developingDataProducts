library(shiny)

shinyServer(function(input, output) {
  
  schoolData<-read.csv("./populationStats.csv", header=FALSE, sep="," )
  colnames(schoolData) <- c("School", "Enrollment", "Graduates")
  
  output$selected <- renderText({
    if ( !input$allSchools )
      paste("Selected schools with enrollment:",input$select)
      
  })
  
  output$showAllData <- renderText({
      if ( input$allSchools )
        paste("Showing All Schools:",input$allSchools)
  })
  
  output$output1 <- renderTable(
    {    
    if ( input$allSchools ){
        data <- schoolData
    }
    else {
      data <- switch(input$select,
                     "under 500" = subset(schoolData, schoolData["Enrollment"] < 500),
                     "between 501-1000" = subset(schoolData, (schoolData["Enrollment"] < 1001 & schoolData[2] > 500) ),
                     "more than 1000" = subset(schoolData, schoolData["Enrollment"] > 1000))
    }
    }
  )
  
})
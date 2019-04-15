#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Index Fund Simulation"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("amount",
                     "Initial Amount",
                     min = 0,
                     max = 100000,
                     value = 1000,
                     step = 500),
         sliderInput("contrib",
                     "Annual Contribution",
                     min = 0,
                     max = 50000,
                     value = 2000,
                     step = 500),
         sliderInput("rate",
                     "Return Rate (in %)",
                     min = 0,
                     max = 20,
                     value = 5,
                     step = 0.1),
         sliderInput("growth",
                     "Growth Rate (in %)",
                     min = 0,
                     max = 20,
                     value = 2,
                     step = 0.1),
         sliderInput("years",
                     "Years",
                     min = 0,
                     max = 50,
                     value = 20,
                     step = 1),
         selectInput("facet", 
                     "Facet?",
                     choices = c("No" = FALSE, "No" = TRUE))
      ),

      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)


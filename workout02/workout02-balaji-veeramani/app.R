#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

source("functions.R", local = TRUE)

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
         plotOutput("timeline_plot")
         #tableOutput("balance_table")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  
  balances = reactive({
    years = 0:input$years
    no_contrib = NULL
    fixed_contrib = NULL
    growing_contrib = NULL
    
    rate = input$rate / 100
    growth = input$growth / 100
    
    for (year in years) {
      index = year + 1
      
      no_contrib[index] = future_value(input$amount, rate, year)
      fixed_contrib[index] = no_contrib[index] + annuity(input$contrib, rate, year)
      growing_contrib[index] = no_contrib[index] + growing_annuity(input$contrib, rate, growth, year)
    }
    
    balances = data.frame(
      years = years, 
      no_contrib = no_contrib, 
      fixed_contrib = fixed_contrib, 
      growing_contrib = growing_contrib)
    
    return(balances)
  })
   
   output$timeline_plot <- renderPlot({
     ggplot(data = balances(), aes(x = years)) + 
       geom_line(aes(y = no_contrib, color = "red")) + 
       geom_line(aes(y = fixed_contrib, color = "green")) + 
       geom_line(aes(y = growing_contrib, color = "blue")) + 
       labs(x = "year", y = "value") +
       ggtitle("Three modes of investing") +
       scale_colour_discrete(
         name = "variable",
         labels = c("no_contrib", "fixed_contrib", "growing_contrib"), 
         breaks = c("blue", "green", "red"))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)


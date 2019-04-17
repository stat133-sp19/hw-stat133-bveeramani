library(shiny)
library(ggplot2)
library(dplyr)

source("functions.R", local = TRUE)

ui <- fluidPage(
   
   titlePanel(strong("Investing Simulation")),
   
   fluidRow(
      column(4, 
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
                     step = 500)
      ),
      column(4,
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
                     step = 0.1)
      ),
      column(4,
         sliderInput("years",
                     "Years",
                     min = 0,
                     max = 50,
                     value = 20,
                     step = 1),
         selectInput("facet", 
                     "Facet?",
                     choices = c("No" = FALSE, "Yes" = TRUE))
      )
   ),
   
   hr(),
   
   h4(strong("Timelines")),
   
   fluidRow(
     plotOutput("timeline_plot")
   )
   
)

server <- function(input, output) {
   
  
  balance_data = reactive({
    
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
    
    types = c("No Contribution", "Fixed Contribution", "Growing Contribution")

    balances = data.frame(
      year = rep(years, 3), 
      value = c(no_contrib, fixed_contrib, growing_contrib),
      type = factor(rep(types, each = length(years))))
    # Ensure correct ordering of types
    balances$type = factor(balances$type, levels = types)
    return(balances)
  })
   
   output$timeline_plot <- renderPlot({
     base_plot = ggplot(data = balance_data(), aes(x = year, y = value, group = type)) +
       geom_path(aes(color = type)) +
       geom_point(aes(color = type)) + 
       xlab("Time (in Years)") +
       ylab("Balance (in USD)") +
       ggtitle("Three Modes of Investing") +
       labs(color = "Mode")
     
     unfaceted_plot = base_plot

     faceted_plot = base_plot +
       facet_grid(~ type) +
       geom_area(aes(fill = type), alpha = 0.5) +
       theme_light()
     
     if (input$facet) {
       faceted_plot
     } else {
       unfaceted_plot
     }
   })
}

shinyApp(ui = ui, server = server)


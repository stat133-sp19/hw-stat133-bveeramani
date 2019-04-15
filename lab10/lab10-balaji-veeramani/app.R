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
   titlePanel("Drawing Balls Experiment"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("reps",
                     "Number of repetitions:",
                     min = 1,
                     max = 5000,
                     value = 100), 
         sliderInput("threshold",
                     "Threshold for choosing boxes:",
                     min = 0,
                     max = 1,
                     value = 0.5),
         numericInput("seed", 
                      "Choose a random seed:", 
                      12345)
         
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  get_proportions = reactive({
    box1 = c("blue", "blue", "red")
    box2 = c("blue", "blue", rep("red", 3), "white")
    
    boxes = c("box1", "box2")
    repetitions = input$reps
    drawn_balls = data.frame(matrix(NA, nrow = repetitions, ncol = 4))
    
    set.seed(input$seed)
    for (i in 1:repetitions) {
      if (runif(1) > input$threshold) {
        drawn_balls[i, ] = sample(box1, size = 4, replace = TRUE)
      } else {
        drawn_balls[i, ] = sample(box2, size = 4)
      }
    }
    
    counts = data.frame(matrix(0, nrow = repetitions, ncol = 5))
    counters = c(0, 0, 0, 0, 0)
    for (i in 1:repetitions) {
      num_balls = sum(drawn_balls[i, ] == "blue")
      counters[num_balls + 1] = counters[num_balls + 1] + 1
      counts[i, ] = counters
    }
    
    proportions = data.frame(matrix(0, nrow = repetitions, ncol = 5))
    for (i in 1:repetitions) {
      proportions[i, ] = counts[i, ] / i
    }
    return(proportions)
  })
  
   output$distPlot <- renderPlot({
     ggplot(get_proportions(), aes(x = 1:input$reps)) + 
       geom_line(aes(y = X1, colour = "blue")) +
       geom_line(aes(y = X2, colour = "purple")) +
       geom_line(aes(y = X3, colour = "green")) +
       geom_line(aes(y = X4, colour = "red")) +
       geom_line(aes(y = X5, colour = "yellow")) + 
       ggtitle("Relative frequencies of number of blue balls") + 
       xlab("reps") + ylab("freqs") + 
       scale_color_discrete(name = "number", labels = c("0", "1", "2", "3", "4"))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)


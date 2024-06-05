library(shiny)

ui <- fluidPage(
  sliderInput("n", label = NULL, 
              min = 0, max = 1000, 
              step = 5, value = 0,
              animate = animationOptions(
                interval = 1,
                loop = TRUE,
                playButton = T,
                pauseButton = NULL
              ))
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
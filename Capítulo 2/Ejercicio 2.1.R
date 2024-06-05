library(shiny)

ui <- fluidPage(
  textInput("name", label = NULL, placeholder = "Your name"),
  textOutput("greeting")
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
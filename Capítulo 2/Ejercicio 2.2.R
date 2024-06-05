library(shiny)

ui <- fluidPage(
  sliderInput("date", label = "When should we deliver?", 
              min = as.Date("2020-09-16","%Y-%m-%d"), max = as.Date("2020-09-23","%Y-%m-%d"), 
              value = as.Date("2020-09-17"))
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
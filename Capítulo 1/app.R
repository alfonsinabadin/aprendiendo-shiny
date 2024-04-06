library(shiny)

# ui: user interface, the HTML webpage that humans interact with

# fluidPage() es una capa para determinar las visuales básicas de la
# estructura

# selectInput() es una entrada que le permite al usuario elegir una opción de 
# la lista (choices)

# verbatimTextOutput() and tableOutput() son salidas de control que
# le dicen a Shiny dónde poner la salida renderizada.
# verbatimTextOutput() displays code and tableOutput() displays tables. 

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

# server: ¿Qué hace la app? Se define como una función

server <- function(input, output, session) {
  
  # define al dataset según lo que ingresa en el ui
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
  
  # este imprime la tabla summary del dataset que se indica en el input (ui)
  output$summary <- renderPrint({
    # Use a reactive expression by calling it like a function
    summary(dataset())
  })
  
  # este corre el código 'dataset' para el data que se indica en el input (ui)
  output$table <- renderTable({
    dataset()
  })
}

shinyApp(ui, server)

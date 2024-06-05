Capítulo 3 - Reactivo básico
================

La idea clave de la programación reactiva es especificar un gráfico de
dependencias para que cuando cambie una entrada, todas las salidas
relacionadas se actualicen automáticamente. Esto hace que el flujo de
una aplicación sea considerablemente más simple, pero lleva un tiempo
entender cómo encaja todo.

## Función server

Todas las Shiny Apps tienen la función `server()`

``` r
library(shiny)

ui <- fluidPage(
  # front end interface
)

server <- function(input, output, session) {
  # back end logic
}

shinyApp(ui, server)
```

La función `server()` tiene tres argumentos: *input*, *output* y
*session*.

### Input

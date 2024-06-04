Capítulo 1 - Tu primera Shiny App
================

## Introducción

Vamos a crear una Shiny App simple. Una Shiny App tiene dos componentes
clave: la **interfaz de usuario (*ui*)** y la **función de servidos
(*server*)**.

Primero que nada necesitamos:

``` r
install.packages("shiny")
library(shiny)
```

Una Shiny App sencilla se puede construir en un archivo `App.R` que
contenga el siguiente código

``` r
## Llama a cargar el paquete shiny.library(shiny)
library(shiny)

## Define la interfaz de usuario, la página web HTML con la que interactúan los humanos. En este caso, es una página que contiene las palabras "¡Hola, mundo!".
ui <- fluidPage(
  "Hello, world!"
)

## Especifica el comportamiento de nuestra app definiendo una función. Actualmente está vacío, por lo que nuestra aplicación no hace nada, pero volveremos a revisarlo en breve.server
server <- function(input, output, session) {
}

## Se ejecuta para construir e iniciar una aplicación Shiny desde la interfaz de usuario y el servidor.shinyApp(ui, server)
shinyApp(ui, server)
```

### Adición de contorles de interfaz de usuario

Utilizando la siguiente interfaz agregamos a la App un desplegable que
permite ver los datos del paquete `datasets`.

``` r
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)
```

En este ejemplo se usan cuatro funciones nuevas:

- `fluidPage()` establece la estructura visual básica de la página.

- `selectInput()` es un control de entrada que permite al usuario
  interactuar con la aplicación proporcionando un valor. En este caso,
  es un cuadro de selección (`choices`) con la etiqueta “Conjunto de
  datos” y le permite elegir uno de los conjuntos de datos integrados
  que vienen con R.

- `verbatimTextOutput()` y `tableOutput()` son controles de salida que
  le dicen a Shiny dónde colocar la salida renderizada. Muestra el
  código (`summary`) y muestra las tablas (`"table"`).

### Adición de comportamiento

Utilizando el siguiente código para el server se le indica a la App cómo
mostrar la información que se le pide en el ui.

``` r
server <- function(input, output, session) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}
```

En este ejemplo:

- Se define al dataset según lo que ingresa en el ui con la función
  `get()` y se imprime la tabla summary del dataset que se indica en el
  input con la función `summary()` (porque ya está definido dataset
  arriba).

- Se imprime el dataset indicado en el input (ui) con la función
  `renderTable()`.

## Ejercicios

1.  Cree una aplicación que salude al usuario por su nombre. Todavía no
    conoces todas las funciones que necesitas para hacer esto, así que
    he incluido algunas líneas de código a continuación. Piensa en qué
    líneas usarás y luego cópialas y pégalas en el lugar correcto en una
    aplicación Shiny.

2.  Supongamos que tu amigo quiere diseñar una aplicación que permita al
    usuario establecer un número () entre 1 y 50, y muestre el resultado
    de multiplicar este número por 5. Este es su primer intento:x

3.  Amplíe la aplicación del ejercicio anterior para permitir que el
    usuario establezca el valor del multiplicador, , de modo que la
    aplicación produzca el valor de . El resultado final debería verse
    así:.yx \* y

4.  Tome la siguiente aplicación, que agrega algunas funciones
    adicionales a la última aplicación descrita en el último ejercicio.
    ¿Qué hay de nuevo? ¿Cómo podría reducir la cantidad de código
    duplicado en la aplicación mediante el uso de una expresión
    reactiva?

5.  La siguiente aplicación es muy similar a una que has visto
    anteriormente en el capítulo: seleccionas un conjunto de datos de un
    paquete (esta vez estamos usando el paquete ggplot2) y la aplicación
    imprime un resumen y un gráfico de los datos. También sigue las
    buenas prácticas y hace uso de expresiones reactivas para evitar la
    redundancia del código. Sin embargo, hay tres errores en el código
    que se proporciona a continuación. ¿Puedes encontrarlos y
    arreglarlos?

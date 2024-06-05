Capítulo 2 - UI básico
================

## Inputs

Como vimos, usamos funciones como `sliderInput()`, `selectInput()`,
`textInput()`, y `numericInput()` para insertar entradas en la
espicificación del UI.

### Estructura común

Todas las funciones de input tienen un mismo argumento inicial:
`inputId`. Este es el identificador utilizado para conectar el *front
end* con el *back end*: si pones un `inputID` llamado *“name”*, la
función en el server va a acceder a él como `input$name`.

El inputId tiene dos restricciones:

- Tiene que ser un string simple que contenga sólo letras.

- Debe ser único.

La mayoría de las funciones de input tienen un segundo argumento:
`label`. Este se usa para crear una etiqueta legible para el control.
Shiny no pone restricciones en este string.

Los input tienen un tercer parámetro típico: `value`. Este permite un
valor por defecto para el input.

### Texto libre

Colecta un string pequeño con `textInput()`, contraseñas con
`passwordInput()` y párrafos con `textAreaInput()`.

``` r
ui <- fluidPage(
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3)
)
```

![](img1.png)

Si uno se quiere asegurar de que el texto tiene ciertas propiedades, se
puede usar una función de `validate()`, que se verá más adelante.

### Números

Colecta valores numéricos, en una caja de texto con `numericInput()` o
con un slider con `sliderInput()`. Si se le pone un un vector de dos
valores en `value` al slider, se selecciona un mínimo y máximo en la
selección.

``` r
ui <- fluidPage(
  numericInput("num", "Number one", value = 0, min = 0, max = 100),
  sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
  sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100)
)
```

![](img2.png)

### Fechas

Colecta un día único con `dateInput()` o un rango entre dos días con
`dateRangeInput()`. Estos proveen un selector en calendario muy
conveniente y tienen argumentos adicionales muy útiles como
`datesdisabled` (fechas desabilitadadas) y `daysofweekdisabled` (días de
la semana desabilitados) que permite restringir el conjunto de inputs
válidos.

``` r
ui <- fluidPage(
  dateInput("dob", "When were you born?"),
  dateRangeInput("holiday", "When do you want to go on vacation next?")
)
```

![](img3.png)

### Opciones limitadas

Permite que el usuario elija entre un conjunto preespecificado de
opciones: con `selectInput()` o `radioButtons()`.

``` r
animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(
  selectInput("state", "What's your favourite state?", state.name),
  radioButtons("animal", "What's your favourite animal?", animals)
)
```

![](img4.png)

Lo bueno de los *radio buttons* es que permite usar caracteres no
numéricos. Lo malo es que es preferible en listas cortas.

``` r
ui <- fluidPage(
  radioButtons("rb", "Choose one:",
    choiceNames = list(
      icon("angry"),
      icon("smile"),
      icon("sad-tear")
    ),
    choiceValues = list("angry", "happy", "sad")
  )
)
```

![](img5.png)

Lo bueno de las listas desplegables es que ocupan menos espacio y que
puede utilizarse para selección múltiple.

``` r
ui <- fluidPage(
  selectInput(
    "state", "What's your favourite state?", state.name,
    multiple = TRUE
  )
)
```

![](img6.png)

### Importar archivos

Permite al usuario importar un archivo

``` r
ui <- fluidPage(
  fileInput("upload", NULL)
)
```

![](img7.png) \### Botones de acción

Permite al usuario hacer una acción con las funciones `actionButton()` o
`actionLink()`.

``` r
ui <- fluidPage(
  actionButton("click", "Click me!"),
  actionButton("drink", "Drink me!", icon = icon("cocktail"))
)
```

![](img8.png)

## Ejercicios

1.  Lograr este ui. Buscar la documentación de `textInput()`.

![](img9.png)

2.  Lograr este ui. Buscar la documentación de `sliderInput()`.

![](img10.png)

3.  Crear un slider para seleccionar valores entre 0 y 100 donde el
    intervalo entre cada selección es 5. Después, agregar una animación
    en el input para que cuando el usuario presione el botón *play* el
    slider se mueva por el rango automático.

4.  Si se tiene una lista larga, una técnica práctica es crear
    subtítulos que separen la lista en partes. Leer la documentación de
    `selectInput()` para saber cómo.

## Outputs

Al igual que las entradas, las salidas toman un ID único como primer
argumento. Hay tres tipos principales de salida, que corresponden a las
tres cosas que normalmente se incluyen en un informe: texto, tablas y
gráficos.

### Texto

Muestra una salida de texto en la consola con `textOutput()` y
`verbatimTextOutput()`.

``` r
## Defino el output de texto plano "text" y de texto en código "code"
ui <- fluidPage(
  textOutput("text"),
  verbatimTextOutput("code")
)

## Defino el texto con renderText() y el códgio con el renderPrint
server <- function(input, output, session) {
  output$text <- renderText({ 
    "Hello friend!" 
  })
  output$code <- renderPrint({ 
    summary(1:10) 
  })
}
```

- `renderText()` combina el resultado en una sola cadena, y generalmente
  se empareja con `textOutput()`
- `renderPrint()` imprime el resultado, como si estuvieras en una
  consola R, y suele estar emparejado con `verbatimTextOutput()`

### Tablas

Hay dos opciones para mostrar marcos de datos en tablas:

- `tableOutput()` y `renderTable()` renderiza una tabla estática de
  datos, mostrando todos los datos a la vez. Es más útil para resúmenes
  pequeños y fijos.

- `dataTableOutput()` y `renderDataTable()` renderiza una tabla
  dinámica, que muestra un número fijo de filas junto con controles para
  cambiar qué filas son visibles.

``` r
ui <- fluidPage(
  tableOutput("static"),
  dataTableOutput("dynamic")
)
server <- function(input, output, session) {
  output$static <- renderTable(head(mtcars))
  output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
}
```

### Gráficos

Se puede mostrar cualquier tipo de gráfico R (base, ggplot2 o de otro
tipo) con `plotOutput()` y `renderPlot()`.

``` r
ui <- fluidPage(
  plotOutput("plot", width = "400px")
)
server <- function(input, output, session) {
  output$plot <- renderPlot(plot(1:5), res = 96)
}
```

### Descargas

Puede permitir que el usuario descargue un archivo con `downloadLink()`
y `downloadButton()`.

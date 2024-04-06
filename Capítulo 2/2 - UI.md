2 - User Interface
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
`passwordInput()` y párravos con `textAreaInput()`.

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

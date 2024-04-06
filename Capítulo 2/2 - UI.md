---
title: "2 - User Interface"
format: gfm
---

## Inputs

Como vimos, usamos funciones como `sliderInput()`, `selectInput()`, `textInput()`, y `numericInput()` para insertar entradas en la espicificación del UI.

### Estructura común

Todas las funciones de input tienen un mismo argumento inicial: `inputId`. Este es el identificador utilizado para conectar el _front end_ con el _back end_: si pones un `inputID` llamado _"name"_, la función en el server va a acceder a él como `input$name`.

El inputId tiene dos restricciones:

- Tiene que ser un string simple que contenga sólo letras.

- Debe ser único.

La mayoría de las funciones de input tienen un segundo argumento: `label`. Este se usa para crear una etiqueta legible para el control. Shiny no pone restricciones en este string. 

Los input tienen un tercer parámetro típico: `value`. Este permite un valor por defecto para el input.

### Texto libre

Colecta un string pequeño con `textInput()`, contraseñas con `passwordInput()` y párravos con `textAreaInput()`.

```{r results='hide', eval=FALSE, warning=FALSE, message=FALSE}
ui <- fluidPage(
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3)
)
```

Si uno se quiere asegurar de que el texto tiene ciertas propiedades, se puede usar una función de `validate()`, que se verá más adelante.

If you want to ensure that the text has certain properties you can use validate(), which we’ll come back to in Chapter 8.

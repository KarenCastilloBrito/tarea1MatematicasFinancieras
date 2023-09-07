switchPersonal <- function(accion) {
  
  mensaje <- switch(accion,
                    saludo = "¡Hola! ¿Cómo estás?",
                    despedida = "¡Hasta luego! ¡Cuida de ti!",
                    pregunta = "¿Tienes alguna duda?",
                    afirmacion = "¡Estoy de acuerdo contigo!",
                    negacion = "No creo que eso sea correcto.",
                    "Lo siento, no reconozco esa acción."
  )
  
  return(mensaje)
}

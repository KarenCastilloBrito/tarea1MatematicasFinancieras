# Se crea (se programa) la función:
VFfuncion2 <- function(umbral, nIter) {
  
  # Creamos los objetos con los datos de entrada del problema:
  VA <- 1 # Valor actual de un peso
  i <- 1 # Tasa de interés anualizada de 100% (i=1)
  VF0 <- 1 # El valor inicial del VF en la iteración
  DeltaVF <- Inf # Asigno un valor inicial del incremento del VF en cada iteración
  n <- 0 # Valor inicial de n en las iteraciones
  
  # Operador while:
  while (n < nIter) { # Modificamos la condición de parada para cumplir con las dos condiciones
    
    # Actualizo el valor de n para la próxima iteración:
    n <- n + 1
    
    # Calculo el valor futuro:
    VF <- VA * (1 + (1 / n))^n
    
    # Actualizamos el incremento del valor futuro de esta iteración con el de la iteración anterior (VF0):
    DeltaVF <- VF - VF0
    
    # Actualizo el valor futuro de esta iteración como el valor futuro "de la iteración anterior" para futuras iteraciones:
    VF0 <- VF
    
    # Verificamos si debemos detenernos debido al umbral:
    if (abs(DeltaVF) < umbral) {
      break # Si la diferencia es menor al umbral, salimos del bucle
    }
  }
  
  # Creamos el objeto tipo lista de salida:
  respuesta <- list(
    VF = VF,
    DeltaVF = DeltaVF,
    N = n
  )
  
  # Mensaje de salida adecuado para indicar la razón de la detención del algoritmo:
  if (n == nIter) {
    mensaje <- paste0("El algoritmo se detuvo después de ", n, " iteraciones ",
                      "al cumplir el número de iteraciones en nIter. VF =", VF)
  } else {
    mensaje <- paste0("El algoritmo se detuvo después de ", n, " iteraciones ",
                      "al llegar al umbral de diferencia de valores futuros. VF =", VF)
  }
  
  # Se imprime el mensaje de salida:
  print(mensaje)
  
  # Se regresa el objeto de salida al environment para que esté disponible allí:
  return(respuesta)
}

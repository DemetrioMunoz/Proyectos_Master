# Leer los datos del fichero human_data.txt:
# Carga de datos
data_script <- read.table(data, header = TRUE)

# Representar mediante un histograma la distribución de las frecuencias de longitudes de las secuencias.
# Histograma de las secuencias
# Creamos el histograma utilizando ggplot2
sequence_lengths <- nchar(data_script$sequence)
histogram <- ggplot(data.frame(Length = sequence_lengths), aes(x = Length)) +
  geom_histogram(binwidth = 100, fill = "lightblue", color = "black") +
  labs(title = "Distribución de las frecuencias de longitudes de las secuencias",
       x = "Longitud de Secuencia",
       y = "Frecuencia") +
  scale_x_continuous(breaks = seq(0, max(sequence_lengths), by = 1000)) +
  theme_classic()
print(histogram)

# Transformar las secuencias de los genes en vectores numéricos usando la función de conteo de 
# hexámeros desarrollada anteriormente. Obtener la matriz de conteos de hexámeros.
# Implementación de la función para el conteo de hexámeros
sequences_data <- c(data_script$sequence) # Vector que contiene las secuencias.

# Creamos el objeto "kmers_count" que contiene la matriz de ocurrencia de los hexámeros.
kmers_count <- kmers_count_function(sequences_data, K)
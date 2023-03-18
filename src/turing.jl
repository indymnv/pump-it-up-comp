using DataFrames
using Plots
using Turing

df = DataFrame(CSV.File("./data/cleaned_data.csv"))

histogram(df.Tiempo_respuesta)


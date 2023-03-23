using DataFrames
using Plots
using Turing
using CSV

df = DataFrame(CSV.File("./data/cleaned_data.csv"))

histogram(df.Tiempo_respuesta)


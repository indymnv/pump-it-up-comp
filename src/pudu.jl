using DataFrames
using CSV


df = DataFrame(CSV.File("./data/cleaned_data.csv"))

function data_summary(df::DataFrame)
    println("Number of rows: " , nrow(df))
    println("Number of Columns: " , ncol(df))
end


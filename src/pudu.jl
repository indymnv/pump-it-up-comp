using DataFrames
using CSV
using Dates

df = DataFrame(CSV.File("./data/cleaned_data.csv"))

function data_summary(df::DataFrame)
    println("Number of rows: " , nrow(df))
    println("Number of Columns: " , ncol(df))
end

function column_type_frequency(df::DataFrame)
	
end

function count_elements(df::DataFrame)
    numeric_count = 0
    date_count = 0
    factor_count = 0
    
    for col in names(df)
        if eltype(df[!, col]) <: Number
            numeric_count += count(!ismissing, df[!, col])
        #elseif eltype(df[!, col]) <: Dates.AbstractDate
        #    date_count += count(!ismissing, df[!, col])
        #elseif eltype(df[!, col]) <: CategoricalValue || eltype(df[!, col]) <: String
        #    factor_count += count(!ismissing, df[!, col])
        end
    end
    
    return (numeric_count = numeric_count, date_count = date_count, factor_count = factor_count)
end

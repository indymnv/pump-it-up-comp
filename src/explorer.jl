using Tidier
using Plots; unicodeplots()
using Statistics
using CSV

label = DataFrame(CSV.File("data/0bf8bc6e-30d0-4c50-956a-603fc693d966.csv"))
sub = DataFrame(CSV.File("data/SubmissionFormat.csv"))
train = DataFrame(CSV.File("data/4910797b-ee55-40a7-8668-10efd5c1b960.csv"))
test = DataFrame(CSV.File("data/702ddfc5-68cd-4d1d-a0de-f5f566f76d91.csv"))

describe(test)

@chain train begin
	@select(amount_tsh)
	@summarize(sum = sum(amount_tsh))
end

plot(train.amount_tsh)

plot(train.funder)

#Let's count founders
#
@chain train begin
	@group_by(funder)
	@summarize(n = nrow())
	@arrange(desc(n))
end

@chain train begin
	@summarize(n =missing())
end

@chain train, label begin
	@left_join(train, label)
	@group_by(train.funder)
	
end
scatter(train.latitude, train.longitude)
scatter!(test.latitude, test.longitude)

using Mimi

samplesize = 10
emissionyear = 2010

include(joinpath(dirname(@__FILE__), "defmcs.jl"))
include(joinpath(dirname(@__FILE__), "../marginaldamage3.jl"))

base, marginal = getmarginalmodels(emissionyear = emissionyear)

# Set up output directories
output = joinpath(dirname(@__FILE__), "../../output/", "SCC $(Dates.format(now(), "yyyy-mm-dd HH-MM-SS"))")
mkdir(output)
mkdir("$output/trials")
mkdir("$output/results")

# Generate trials
generate_trials!(mcs, samplesize; filename = joinpath(@__DIR__, "$output/trials/fund_mc_trials_$samplesize.csv"))

# Run monte carlo trials
run_mcs(mcs, [base, marginal]; output_dir = "$output/results")

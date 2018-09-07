﻿using Mimi

@defcomp emissions begin
    regions = Index()

    mitigationcost = Variable(index=[time,regions])
    ch4cost = Variable(index=[time,regions])
    ch4costindollar = Variable(index=[time,regions])
    n2ocost = Variable(index=[time,regions])
    ryg = Variable(index=[time,regions])
    energint = Variable(index=[time,regions])
    emissint = Variable(index=[time,regions])
    emission = Variable(index=[time,regions])
    emissionwithforestry = Variable(index=[time,regions])
    so2WithSeeiAndScei = Variable(index=[time, regions])
    so2 = Variable(index=[time, regions])
    sf6 = Variable(index=[time,regions])
    reei = Variable(index=[time,regions])
    rcei = Variable(index=[time,regions])
    energuse = Variable(index=[time,regions])
    seei = Variable(index=[time,regions])
    scei = Variable(index=[time,regions])
    ch4 = Variable(index=[time,regions])
    n2o = Variable(index=[time,regions])
    n2ored = Variable(index=[time,regions])
    taxpar = Variable(index=[time,regions])
    co2red = Variable(index=[time,regions])
    know = Variable(index=[time,regions])
    perm = Variable(index=[time,regions])
    cumaeei = Variable(index=[time,regions])
    ch4red = Variable(index=[time,regions])

    minint = Variable(index=[time])
    globknow = Variable(index=[time])

    mco2 = Variable(index=[time])
    globch4 = Variable(index=[time])
    globn2o = Variable(index=[time])
    globsf6 = Variable(index=[time])
    globso2 = Variable(index=[time])

    cumglobco2 = Variable(index=[time])
    cumglobch4 = Variable(index=[time])
    cumglobn2o = Variable(index=[time])
    cumglobsf6 = Variable(index=[time])
    cumglobso2 = Variable(index=[time])

    taxmp = Parameter(index=[regions], default = [0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001, 0.9999616400000001])
    sf60 = Parameter(index=[regions], default = [1.869, 0.2265, 0.8088, 0.7522, 0.0319, 0.0017, 0.0955, 0.3524, 0.0297, 0.0796, 0.2653, 0.2166, 0.0671, 0.0524, 0.0603, 0.0])
    gdp90 = Parameter(index=[regions], default = [6343.0, 532.5, 8285.4, 5100.7, 359.5, 338.1, 915.1, 447.3, 296.0, 1078.0, 351.5, 456.2, 511.4, 137.3, 275.1, 37.2])
    pop90 = Parameter(index=[regions], default = [254.1, 27.8, 376.6, 166.4, 20.2, 124.3, 289.6, 189.2, 106.3, 300.2, 1131.7, 444.1, 1184.1, 117.8, 494.4, 39.9])
    ch4par1 = Parameter(index=[regions], default = [5.43256043589814e-6, 7.68530879698685e-6, 1.82159147893377e-6, 4.1924934439543e-7, 1.24810383170778e-5, 3.12903754911232e-5, 8.50815797488168e-5, 1.26153024592417e-5, 1.29696311337233e-5, 4.07027497242303e-6, 2.51086035410295e-5, 1.94201377873521e-5, 3.18332250729888e-5, 1.94201377873521e-5, 1.94201377873521e-5, 1.94201377873521e-5])
    ch4par2 = Parameter(index=[regions], default = [10.2819, 12.4901, 14.273, 17.4298, 18.1757, 11.1699, 10.208, 22.3821, 16.7743, 82.2365, 35.4515, 27.154, 19.9252, 27.154, 27.154, 27.154])
    n2opar1 = Parameter(index=[regions], default = [1.36433993005131e-8, 1.62109321212318e-8, 1.9746491637233e-8, 9.5431711601192e-9, 4.61848087896872e-9, 8.35408586182888e-8, 1.94317016287215e-8, 1.94317016287215e-8, 2.00369052760037e-8, 1.94317016287215e-8, 1.70952516549728e-7, 4.72053279674305e-18, 1.42080789640573e-7, 1.94317016287215e-8, 1.94317016287215e-8, 1.94317016287215e-8])
    n2opar2 = Parameter(index=[regions], default = [39.60689, 65.32902, 19.17755, 7.4647, 212.39648, 33.53457, 23.25449, 23.25449, 108.39115, 23.25449, 57.43782, 23.25449, 12.32164, 23.25449, 23.25449, 23.25449])
    emissint0 = Parameter(index=[regions], default = [0.358995, 0.425061, 0.176085, 0.033033, 0.162981, 0.731094, 0.907452, 0.104013, 0.239694, 0.176904, 0.229047, 0.119301, 0.380153936842105, 0.320502, 0.217308, 0.473109])
    so20 = Parameter(index=[regions], default = [1.6924, 0.1204, 2.0556, 0.0897, 0.0152, 0.2585, 1.3184, 0.0311, 0.055, 0.2071, 0.4361, 0.1586, 1.3663, 0.0416, 0.2097, 0.0152 ])

    forestemm = Parameter(index=[time,regions])
    aeei = Parameter(index=[time,regions])
    acei = Parameter(index=[time,regions])
    ch4em = Parameter(index=[time,regions])     # from file, but too big to set default here
    n2oem = Parameter(index=[time,regions])     # from file, but too big to set default here
    currtax = Parameter(index=[time,regions])   # from file, but too big to set default here
    currtaxch4 = Parameter(index=[time,regions])# from file, but too big to set default here
    currtaxn2o = Parameter(index=[time,regions])# from file, but too big to set default here
    pgrowth = Parameter(index=[time,regions])
    ypcgrowth = Parameter(index=[time,regions])
    income = Parameter(index=[time,regions])
    population = Parameter(index=[time,regions])

    so2pop = Parameter(default = 0.33)
    so2inc = Parameter(default = -0.45)
    so2carb = Parameter(default = 1.02)
    sf6gdp = Parameter(default = 0.00022628870292887)
    sf6ypc = Parameter(default = -2.46698744769874e-6)
    knowpar = Parameter(default = 0.9)
    knowgpar = Parameter(default = 0.1)
    gwpch4 = Parameter(default = 0.077)
    gwpn2o = Parameter(default = 0.361666666666667)

    taxconstant = Parameter(default = 0.784)
    taxemint = Parameter(default = 0.084)
    taxthreshold = Parameter(default = 100)
    taxdepreciation = Parameter(default = 0.1)
    maxcostfall = Parameter(default = 10)

    ch4add = Parameter(default = 0.)
    n2oadd = Parameter(default = 0.)
    sf6add = Parameter(default = 0.)
    
    function run_timestep(p, v, d, t)

        if is_first(t)
            for r in d.regions
                v.energint[t, r] = 1
                v.energuse[t, r] = p.income[t,r]
                v.emissint[t, r] = p.emissint0[r]
                v.so2[t, r] = p.so20[r]
                v.emission[t, r] = v.emissint[t, r] / v.energuse[t, r]
                v.ch4cost[t, r] = 0
                v.n2ocost[t, r] = 0
                v.ryg[t, r] = 0
                v.reei[t, r] = 0
                v.rcei[t, r] = 0
                v.seei[t, r] = 0
                v.scei[t, r] = 0
                v.co2red[t, r] = 0
                v.know[t, r] = 1
                v.ch4red[t, r] = 0
                v.n2ored[t, r] = 0
                v.mitigationcost[t, r] = 0
            end

            v.globknow[t] = 1
            v.cumglobco2[t] = 0.0
            v.cumglobch4[t] = 0.0
            v.cumglobn2o[t] = 0.0
            v.cumglobsf6[t] = 0.0
            v.cumglobso2[t] = 0.0

            # SocioEconomicState.minint[t]=Inf
            minint = Inf
            for r in d.regions
                if v.emission[t, r] / p.income[t, r] < minint
                    minint = v.emission[t, r] / p.income[t, r]
                end
            end
            # v.minint[t] = minint
            v.minint[t] = 0
        else
            # Calculate emission and carbon intensity
            for r in d.regions
                v.energint[t, r] = (1.0 - 0.01 * p.aeei[t, r] - v.reei[t - 1, r]) * v.energint[t - 1, r]
                v.emissint[t, r] = (1.0 - 0.01 * p.acei[t, r] - v.rcei[t - 1, r]) * v.emissint[t - 1, r]
            end

            # Calculate so2 emissions
            for r in d.regions
                v.so2[t, r] = v.so2[t - 1, r] * 
                                (1 + 0.01 * p.pgrowth[t - 1, r]) ^ (p.so2pop) * 
                                (1 + 0.01 * p.ypcgrowth[t - 1, r]) ^ (p.so2inc) * 
                                (1 - 0.01 * p.aeei[t, r] - v.reei[t - 1, r] - 0.01 * p.acei[t, r] - v.rcei[t - 1, r]) ^ (p.so2carb)
                v.so2WithSeeiAndScei[t, r] = v.so2[t, r] * (1 - v.seei[t - 1, r] - v.scei[t - 1, r])
            end

            # Calculate sf6 emissions
            for r in d.regions
                v.sf6[t, r] = (p.sf60[r] + p.sf6gdp * (p.income[t, r] - p.gdp90[r]) + p.sf6ypc * (p.income[t - 1, r] / p.population[t - 1, r] - p.gdp90[r] / p.pop90[r])) * (gettime(t) <= 2010 ? 1 + (gettime(t) - 1990) / 40.0 : 1.0 + (60.0 - 40.0) / 40.0) * (gettime(t) > 2010 ? 0.99^(gettime(t) - 2010) : 1.0)
            end

            # Check for unrealistic values
            for r in d.regions
                if v.sf6[t, r] < 0.0
                    v.sf6[t, r] = 0
                end
            end

            # Calculate energy use
            for r in d.regions
                v.energuse[t, r] = (1 - v.seei[t - 1, r]) * v.energint[t, r] * p.income[t, r]
            end

            # Calculate co2 emissions
            for r in d.regions
                v.emission[t, r] = (1 - v.scei[t - 1, r]) * v.emissint[t, r] * v.energuse[t, r]
                v.emissionwithforestry[t, r] = v.emission[t, r] + p.forestemm[t, r]
            end

            # Calculate ch4 emissions
            for r in d.regions
                v.ch4[t, r] = p.ch4em[t, r] * (1 - v.ch4red[t - 1, r])
            end

            # Calculate n2o emissions
            for r in d.regions
                v.n2o[t, r] = p.n2oem[t, r] * (1 - v.n2ored[t - 1, r])
            end


            # TODO RT check
            for r in d.regions
                if (v.emission[t, r] / p.income[t, r] - v.minint[t - 1] <= 0)
                    v.taxpar[t, r] = p.taxconstant
                else
                    v.taxpar[t, r] = p.taxconstant - p.taxemint * sqrt(v.emission[t, r] / p.income[t, r] - v.minint[t - 1])
                end
            end

            for r in d.regions
                v.co2red[t, r] = p.currtax[t, r] * v.emission[t, r] * v.know[t - 1, r] * v.globknow[t - 1] / 2 / v.taxpar[t, r] / p.income[t, r] / 1000

                if (v.co2red[t, r] < 0)
                    v.co2red[t, r] = 0
                elseif (v.co2red[t, r] > 0.99)
                    v.co2red[t, r] = 0.99
                end
            end

            for r in d.regions
                v.ryg[t, r] = v.taxpar[t, r] * v.co2red[t, r]^2 / v.know[t - 1, r] / v.globknow[t - 1]
            end

            # TODO RT check
            for r in d.regions
                v.perm[t, r] = 1.0 - 1.0 / p.taxthreshold * p.currtax[t, r] / (1 + 1.0 / p.taxthreshold * p.currtax[t, r])
            end

            for r in d.regions
                v.reei[t, r] = v.perm[t, r] * 0.5 * v.co2red[t, r]
            end

            # TODO RT check
            for r in d.regions
                if (p.currtax[t, r] < p.taxthreshold)
                    v.rcei[t, r] = v.perm[t, r] * 0.5 * v.co2red[t, r]^2
                else
                    v.rcei[t, r] = v.perm[t, r] * 0.5 * v.co2red[t, r]
                end
            end

            # TODO RT check
            # TODO RT what is the 1.7?
            for r in d.regions
                v.seei[t, r] = (1.0 - p.taxdepreciation) * v.seei[t - 1, r] + (1.0 - v.perm[t, r]) * 0.5 * v.co2red[t, r] * 1.7
            end

            for r in d.regions
                if (p.currtax[t, r] < 100)
                    v.scei[t, r] = 0.9 * v.scei[t - 1, r] + (1 - v.perm[t, r]) * 0.5 * v.co2red[t, r]^2
                else
                    v.scei[t, r] = 0.9 * v.scei[t - 1, r] + (1 - v.perm[t, r]) * 0.5 * v.co2red[t, r] * 1.7
                end
            end

            # TODO RT check
            for r in d.regions
                v.know[t, r] = v.know[t - 1, r] * sqrt(1 + p.knowpar * v.co2red[t, r])

                if (v.know[t, r] > sqrt(p.maxcostfall))
                    v.know[t, r] = sqrt(p.maxcostfall)
                end
            end

            v.globknow[t] = v.globknow[t - 1]
            for r in d.regions
                v.globknow[t] = v.globknow[t] * sqrt(1 + p.knowgpar * v.co2red[t, r])
            end

            if (v.globknow[t] > 3.16)
                v.globknow[t] = 3.16
            end

            for r in d.regions
                v.ch4red[t, r] = p.currtaxch4[t, r] * p.ch4em[t, r] / 2 / p.ch4par1[r] / p.ch4par2[r] / p.ch4par2[r] / p.income[t, r] / 1000

                if (v.ch4red[t, r] < 0)
                    v.ch4red[t, r] = 0
                elseif (v.ch4red[t, r] > 0.99)
                    v.ch4red[t, r] = 0.99
                end
            end

            for r in d.regions
                v.n2ored[t, r] = p.gwpn2o * p.currtaxn2o[t, r] * p.n2oem[t, r] / 2 / p.n2opar1[r] / p.n2opar2[r] / p.n2opar2[r] / p.income[t, r] / 1000

                if (v.n2ored[t, r] < 0)
                    v.n2ored[t, r] = 0
                elseif (v.n2ored[t, r] > 0.99)
                    v.n2ored[t, r] = 0.99
                end
            end

            for r in d.regions
                v.ch4cost[t, r] = p.ch4par1[r] * p.ch4par2[r]^2 * v.ch4red[t, r]^2
                v.ch4costindollar[t, r] = v.ch4cost[t, r] * p.income[t, r]
            end

            for r in d.regions
                v.n2ocost[t, r] = p.n2opar1[r] * p.n2opar2[r]^2 * v.n2ored[t, r]^2
            end

            minint = Inf
            for r in d.regions
                if (v.emission[t, r] / p.income[t, r] < minint)
                    minint = v.emission[t, r] / p.income[t, r]
                end
            end
            v.minint[t] = minint

            for r in d.regions
                if gettime(t) > 2000
                    v.cumaeei[t, r] = v.cumaeei[t - 1, r] * (1.0 - 0.01 * p.aeei[t, r] - v.reei[t, r] + v.seei[t - 1, r] - v.seei[t, r])
                else
                    v.cumaeei[t, r] = 1.0
                end
            end

            for r in d.regions
                #v.mitigationcost[t, r] = (p.taxmp[r] * v.ryg[t, r] /*+ v.ch4cost[t, r]*/ + v.n2ocost[t, r]) * p.income[t, r]
                v.mitigationcost[t, r] = (p.taxmp[r] * v.ryg[t, r] + v.n2ocost[t, r]) * p.income[t, r]
            end

            globco2 = 0.
            globch4 = 0.
            globn2o = 0.
            globsf6 = 0.
            globso2 = 34.4

            for r in d.regions
                globco2 = globco2 + v.emissionwithforestry[t, r]
                globch4 = globch4 + v.ch4[t, r]
                globn2o = globn2o + v.n2o[t, r]
                globsf6 = globsf6 + v.sf6[t, r]
                globso2 = globso2 + v.so2WithSeeiAndScei[t, r]
            end

            v.mco2[t] = globco2
            v.globch4[t] = max(0.0, globch4 + (gettime(t) > 2000 ? p.ch4add * (gettime(t) - 2000) : 0.0))
            v.globn2o[t] = max(0.0, globn2o + (gettime(t) > 2000 ? p.n2oadd * (gettime(t) - 2000) : 0.0))
            v.globsf6[t] = max(0.0, globsf6 + (gettime(t) > 2000 ? p.sf6add * (gettime(t) - 2000) : 0.0))
            v.globso2[t] = globso2

            v.cumglobco2[t] = v.cumglobco2[t - 1] + v.mco2[t]
            v.cumglobch4[t] = v.cumglobch4[t - 1] + v.globch4[t]
            v.cumglobn2o[t] = v.cumglobn2o[t - 1] + v.globn2o[t]
            v.cumglobsf6[t] = v.cumglobsf6[t - 1] + v.globsf6[t]
            v.cumglobso2[t] = v.cumglobso2[t - 1] + v.globso2[t]
        end
    end
end

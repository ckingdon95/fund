﻿using Mimi

@defcomp climatedynamics begin
    # Total radiative forcing
    radforc = Parameter(index=[time])

    # Average global temperature
    temp = Variable(index=[time])

    # lifetempconst
    lifetempconst = Parameter(default = -31.8978379263215)

    # lifetemplin
    lifetemplin = Parameter(default = 32.7266970287432)

    # lifetempqd
    lifetempqd = Parameter(default = -0.00993)

    # Climate sensitivity
    climatesensitivity = Parameter(default = 2.999999803762826)

    function run_timestep(p, v, d, t)
        
        if is_first(t)
            v.temp[t] = 0.20
        else
            LifeTemp = max(p.lifetempconst + p.lifetemplin * p.climatesensitivity + p.lifetempqd * p.climatesensitivity^2.0, 1.0)

            delaytemp = 1.0 / LifeTemp

            temps = p.climatesensitivity / 5.35 / log(2.0)

            # Calculate temperature
            dtemp = delaytemp * temps * p.radforc[t] - delaytemp * v.temp[t - 1]

            v.temp[t] = v.temp[t - 1] + dtemp
        end
    end
end

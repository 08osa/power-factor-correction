# Power Factor Correction (Power Systems term project)

A three-phase Y-connected motor is fed from a 207.85 V (line-to-line) source through a line impedance of 2 + 4j ohm; the motor impedance is 30 + 40j ohm.

The project:
1. computes the circuit's power factor;
2. sizes a parallel **R-C branch** that raises the power factor to **0.95** with minimum input current;
3. sizes a parallel R-C branch that raises the power factor to 0.95 while keeping the original motor current;
4. discusses delta vs. wye connection of the capacitors.

`q3_power_factor_correction.m` sweeps the branch resistance R symbolically in MATLAB (Symbolic Math Toolbox) and tabulates the results.

The written report is not published here (it contains personal data of the team).

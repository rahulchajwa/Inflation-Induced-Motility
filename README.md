# Inflation-Induced-Motility
These codes are used in the manuscript bioRxiv 2022.08.19.504465; doi: https://doi.org/10.1101/2022.08.19.504465 to get Figure 4 e & f

criticality.m is used to numerically integrate ODE equation 4 in the manuscript, to calculate the critical radius to escape the "gravity trap" for a range of cytoplasmic densities, yielding Fig. 4f (compared with the analytical solution red-curve given in the manuscript)
![phase1](https://github.com/user-attachments/assets/542e36b9-c7bc-43aa-8ac0-ad16c2b9641f)


slingshot_oscillation.m is used to numerically integrate the ODE equation 4 to get the trajectories of the cell in the vertical ocean column over multiple cell cycles, giving Figure 4e for three different cytoplasmic densities.
![bouncing-new](https://github.com/user-attachments/assets/9cfb0029-0ece-4d95-ab3b-f985e145b248)

In both the codes we use the experimentally observed pycnocline in the cruise HOT317 -- sea water density as a function of depth.

The codes are written in MATLAB and uses function ODE45, based on the Runge Kutta method.

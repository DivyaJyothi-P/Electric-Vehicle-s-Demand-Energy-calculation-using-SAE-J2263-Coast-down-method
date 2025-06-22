# Electric-Vehicle-s-Demand-Energy-calculation-using-SAE-J2263-Coast-down-method
This project estimates the **vehicle demand energy**, **road load power** and **kinematic power** using the **SAE J2263 coast down method**. The analysis is performed for multiple standard drive cycles,including:
-FTP(Federal Test procedure)
-Highway Drive Cycle
-USO6
-SCO3
##Project Highlights
-Used **SAE J2263 coast down coefficients** to model realistic vehicle road load 
-Calculated:
-Total tractive force
-Road load power(rolling+aerodynamic+fixed resistance)
-Kinematic power(related to vehicle acceleration)
-Analyzed energy variation across different drive cycles
-Plotted and compared the results to understand the behavior
-Compared the results with Excel calculation
## Tools Used
-MATLAB R2025a
-Coast down constants(A,B,c)
-Microsoft Excel
-FTP,Highway,USO6,SCO3 Drive Cycle data
## File Details
|'poject_part2_16_03_25.m'| MATLAB script for calculating force,energy and power
|'project_part_2_ppt.pptx'| Description about the project and results
|'FTP_DATA.xlsx'| FET Drive cycle data
|'HEFET_DATA.xlsx'| Highway Drive cycle data
|'sco3.xlsx'| SCO3 Drive cycle data
|'US06.xlsx'| USO6 Drive cycle data
|'proj_part2_VDE _FINAL.xlsx'| Excel calculation of force,energy and power
## Cost Down Equation
The vehicle road load force is calculated using the coast down formula :
**F=A+B.V+C.V^2**
where:
-A=rolling resistance
-B=friction
-C=Aerodynamic drag
-V=Vehicle velocity
## Vehicle Demand Energy Equation
The vehicle demand energy is calculated using this Equation
**VDE=∑[(TWC.ai+A+B.V+C.V^2 )*Distancei]**
where:
-TWC =Test weight class
-a=acceleration
-A=rolling resistance
-B=friction
-C=Aerodynamic drag
-V=Vehicle velocity
## Author
Divya Jyothi P
Electrical and Electronics Engineer seeking job opportunities in the Electric Vehicle industry


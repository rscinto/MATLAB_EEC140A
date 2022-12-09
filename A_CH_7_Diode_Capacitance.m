%%Exercise 7.2
clc
%% WORKING, Forgot to add pico Farads
E = 8.854187817*10^(-14);
q = 1.6*10^(-19);
K_s = 10;
A = 1*10^(-2);

Voltage = [-1, -2, -3, -4, -5];
Capacitance = [420e-12, 344e-12, 298e-12, 266e-12, 243e-12]; %pF

format shortG

Capacitance = Capacitance.^(-1);
Capacitance = Capacitance.^(2);

[c,r2,eqn] = lsqcurvefit_approx(Voltage,Capacitance)
real_eqn = str2sym(eqn)
Coeffs = coeffs(real_eqn)
denominator = Coeffs(2); %Factor next to x
numerator = Coeffs(1);   %Isolated term
%V_bi = numerator/denominator %not sure if working

%% Using basic slope formula
y2 = Capacitance(2);
y1 = Capacitance(1);

x2 = Voltage(2);
x1 = Voltage(1);
cprintf('_green','Correct Slope and N_d \n')
m = (y2-y1)/(x2-x1)
N_D = 2/(q*K_s*E*A^(2)*abs(m))


plot(Voltage, Capacitance, '*-') 
cprintf('_green','-----------------------------')
clear

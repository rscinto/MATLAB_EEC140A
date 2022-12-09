
clc
cprintf('_green','Schottky Diode with metal interface \n')
% WORKING PROGRAM
E = 8.854187817*10^(-14);
q = 1.6*10^(-19);

K_s = 11.7; %Si
E_G = 1.12; %Si
N_i = 10^10; %Si
Chi = 4.03; %Si

%Chi = 4.0 %Ge
%Chi = 4.07 %GaAs

%% dopants
N_D = 10^15;
N_A = 10^16;

T = 300;
%V_a = 0;

Phi_M = 5.10;
%Phi_M = 4.65;
Phi_B = Phi_M - Chi



%% For Values where V_A is used


V_a = 0;
cprintf('_green','Voltage applied = %f V  \n', V_a)

v_bi_func = E_G/2 - (0.0259)*log(N_D/N_i)
v_bi_func = (Phi_B - (E_G - Fermi(N_D, N_A,N_i,E_G)))
C = unitsratio("micron","cm");

W = ((((2*K_s*E)/(q*N_D))*(v_bi_func-V_a)))^(1/2)

W_microns = W*C

E_max = abs((q*N_D*W)/(K_s*E))

%% Same values, just with no V_a
cprintf('_green','Voltage applied is 0V \n')
V_a = 0

Vbi = (Phi_B - (E_G - Fermi(N_D, N_A,N_i,E_G)))

W_V_A_zero = ((((2*K_s*E)/(q*N_D))*(Vbi-V_a)))^(1/2)

W_microns = W_V_A_zero*C

E_max_W_V_A_zero = abs((q*N_D*W_V_A_zero)/(K_s*E))


cprintf('_green','-----------------------------')
clear







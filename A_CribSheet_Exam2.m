%% Working Program
clc
cprintf('_green','PN Diode\n')
%format longG
format SHORT G  

D_p = 12; %Si
D_n = 36; %Si

    %c_n = 10; %constants of proportionality  WRONG
    %c_p = 10;

   %N_T = 10; %Number of R-G Centers WRONG
    %Tau_n = 1/(c_n*N_T);
    %Tau_p = 1/(c_p*N_T);

Tau_n = 5*10^-7; %minority carrier lifetimes good guesses
Tau_p = 5*10^-7; %seconds
Tau_o = 10^-6; %seconds
%Tau_p = 10^-4; % TEST seconds

%A = 1*10^(-2);
A = 1; % this is 1 cm squared

K = 11.7;     %Si
K_s = 11.7; %Si

%% Dopants
N_a = 10^16;  % holes
N_d = 10^15;  % electrons 
N_i = 10^10; %Si
%N_i = 2*10^6; %GaAs

T = 300;      %K

E_g_Si = 1.12;
q = 1.6*10^(-19);
E = 8.854187817*10^(-14);
k = 8.617*10^-5; %boltzmans const
V_applied = 0.0;

%% working capacitance, Voltages and width
cprintf('_green','Begin working values \n')
C = unitsratio("micron","cm");

v_built_in = V_bi(N_a, N_d,N_i)

X_n = ((2*K*E*N_a*v_built_in)/(q*N_d*(N_d+N_a)))^(1/2);
X_p = ((2*K*E*N_d*v_built_in)/(q*N_a*(N_d+N_a)))^(1/2);

Width = X_n + X_p;
Width_microns = Width*C
X_n_microns = X_n*C
X_p_microns = X_p*C
Capacitance_J = (K*E*A)/Width
Capacitance_J_nanoF = Capacitance_J*10^11

cprintf('_green','V_A = %f V \n \n', V_applied)
V_difference = v_built_in - V_applied;
X_n = ((2*K*E*N_a*V_difference)/(q*N_d*(N_d+N_a)))^(1/2)
X_p = ((2*K*E*N_d*V_difference)/(q*N_a*(N_d+N_a)))^(1/2)
Width_v_applied = X_n +  X_p;

%Width_v_applied = sqrt(((2*K*E*(v_built_in - V_applied))/(q*N_d)));
Width_v_applied_microns = Width_v_applied*C

Capacitance_J = (K*E*A)/Width_v_applied; %nano farads
Capacitance_J_nanoF = Capacitance_J*10^9

%% for current
mu_n = 1400; %Si 
mu_p = 12;   %cm^2 Electron/hole Mobility

%D_p = 12; % Si 
%D_p = 20; % Si TEST
%D_p = D_p/4; % Si TEST
%D_n = 36; % diffustion constants



L_p =  sqrt(D_p*Tau_p); %diffustion length
L_n = sqrt(D_n*Tau_n);

V_applied = 0;
cprintf('_green','Total Ideal current at V_A: %f\n\n', V_applied)
%q=1;
I = q*A*N_i^2*((D_n/(L_n*N_a))+(D_p/(L_p*N_d)))*(exp((q*V_applied)/(k*T))-1)...
    +((q*A*N_i*Width)/(2*Tau_o))*(exp((q*V_applied)/(k*T))-1)

%% Electric field critical
V_breakDown = 320;
cprintf('_green','Electric Field break down at V_A = %f \n\n', V_breakDown)
%use graph page 263


E_max = abs((q*N_d*X_n)/(K_s*E))


E_field_critical = sqrt((2*q*N_a*N_d)/(K*E*(N_a+N_d))*V_breakDown)

%% EQN 6.29 
cprintf('_green','Current \n\n')
I_o = (A*q*D_p*N_i^2)/(L_p*N_d); %P+/n Acceptor rich device

%I_withEverything = I_o*(exp((V_applied)*(0.0259^(-1)))-1)
cprintf('_green','Reverse Saturation Current\n\n')
I_o = I_o + (A*q*D_n*N_i^2)/(L_n*N_a)  % n+/p device, Donor rich

cprintf('_green','Ideal Diode Current with V_a: %f \n\n', V_applied)
I_withEverything = I_o*(exp((V_applied)*(0.0259^(-1)))-1)
I_withEverything_and_RG = I_o*(exp((V_applied)*(0.0259^(-1)))-1)...
+((q*A*N_i*Width)/(2*Tau_o))*(exp((q*V_applied)/(k*T))-1)



cprintf('_green','-----------------------------')
























clear
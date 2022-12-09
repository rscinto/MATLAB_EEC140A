%% Working Program
clc
%% Dopants
N_a = 10^17;
N_d = 10^14;
N_i = 10^10; %Si
%N_i = 2*10^6; %GaAs

T = 300;      %K
K = 11.8;     %Si
E_g_Si = 1.12;
q = 1.6*10^(-19);
E = 8.854187817*10^(-14);
k = 8.617*10^-5; %boltzmans const

format short

%% voltage greater than -
cprintf('_green','Voltage applied greater than 0V \n')
V_bias = 0;
%V_bias = -10;
%V_bias = 0;

%Working V_BI They both work
Vbi_var = V_bi(N_a, N_d, N_i)
C = unitsratio("micron","cm");

Vbi_var = (0.0259)*log((N_a*N_d)/(N_i^2))

xn = x_n_long(N_d, Vbi_var, V_bias, K);

xp = x_p_long(N_a, N_d, Vbi_var, V_bias, K);

W_simple_sum = xn+xp;

%W = W_V_A(N_a, N_d, V_bias, Vbi_var, K)
W = (((2*K*E)/(q)) * ((1)/(N_d)) * (Vbi_var - V_bias)  )^(1/2)

cprintf('_green','Correct E field max at Vbias')
E = abs_E_max(N_d, K, xn)

%E = E_5_21(N_a, N_d, K, xn, 0)

xn_microns = C*xn
xp_microns = C*xp
cprintf('_green','Correct depletion width at Vbias')
W_microns = C*W
N_a;
N_d;



%% WRT Temp
T = 300;      %K
cprintf('_green','With respect to Temperature \n')
C = unitsratio("micron","cm");

Vbi_var = ((k*T)/1)*log((N_a*N_d)/(N_i^2))

xn = x_n_long(N_d, Vbi_var, V_bias, K);

xp = x_p_long(N_a, N_d, Vbi_var, V_bias, K);

W = W_V_A(N_a, N_d, V_bias, Vbi_var, K);


E = abs_E_max(N_d, K, xn)

%E = E_5_21(N_a, N_d, K, xn, 0)

xn_microns = C*xn
xp_microns = C*xp
W_microns = C*W
N_a;
N_d;

%% Applied Voltage
cprintf('_green','Find Applied Voltage\n')
%Number of electrons on on p-side at -x_p
n_x_p = 10^10;
%number of electrons on the far left on the p-side beyond the junction
n_p_o = 10^7;

equiv = k*T/1;
%V_A = 0.029*log(n_x_p/n_p_o)
%%% WORKING
V_A = (equiv)*log(n_x_p/n_p_o)

cprintf('_green','-----------------------------')
clear
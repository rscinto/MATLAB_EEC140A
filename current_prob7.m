E = 8.854187817*10^(-14);
q = 1.6*10^(-19);
k = 8.617*10^-5; %boltzmans const

T = 300;

K_s = 11.7; 
E_G = 1.12; %Si

N_A = 10^16;
N_D = 10^16;
N_i = 10^10;

D_n = 25;
D_p = 10;

V_A = -100;

tau_n_p = 5*10^-7;

L_n = sqrt(tau_n_p*D_n);
L_p = sqrt(tau_n_p*D_p);


A = 0.01; %maybe quare this



I_o = q*A*( (D_n*N_i^2)/(L_n*N_A) + (D_p*N_i^2)/(L_p*N_D)   )

q = 1.6*10^(-19);

I = I_o*(exp((q*V_A)/(k*T)) - 1)

I = I_o*(exp(((0.0259^-1)*V_A)) - 1)
q=1;


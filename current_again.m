
%% working status UKNOWN

%% CONSTANTS
q = 1.6*10^(-19);   %number of elcectrons per couloumb
E = 8.854187817*10^(-14);%permitivity free space
k = 8.617*10^(-5);

%% Knobs 
N_a = 10^16;        %Number of hole dopants
N_d = 10^16;         %Number of electron dopants
N_i = 10^10;        %Intrinsic carriers
T = 300;            %K
K = 11.7;           %Si
E_g_Si = 1.12;      %band gap Si
A = 1;  %area
V_A = -5000; %Voltage applied

mu_n = 1400; %Si 
mu_p = 12;   %cm^2 Electron/hole Mobility

D_p = 10; % Si 
%D_p = 20; % Si TEST
%D_p = D_p/4; % Si TEST
D_n = 25; % diffustion constants
%D_n = 36; % 

    %c_n = 10; %constants of proportionality  WRONG
    %c_p = 10;

   %N_T = 10; %Number of R-G Centers WRONG
    %Tau_n = 1/(c_n*N_T);
    %Tau_p = 1/(c_p*N_T);

Tau_n = 5*10^-7; %minority carrier lifetimes good guesses
Tau_p = 5*10^-7; %seconds
%Tau_p = 10^-4; % TEST seconds

L_p =  sqrt(D_p*Tau_p) %diffustion length
L_n = sqrt(D_n*Tau_n)





%% Results
cprintf('_green','---------YIELD--------------')
if N_a > N_d %P+/n Acceptor rich device
    I_o = A*q*((D_p*N_i^2)/(L_p*N_d)) 
else % n+/p device, Donor rich
    I_o = A*q*((D_n*N_i^2)/(L_n*N_a)) 
end

I = I_o*(exp((V_A)*(0.0259^(-1)))-1)


I_o = A*q*((D_p*N_i^2)/(L_p*N_d)) %P+/n Acceptor rich device
I_o = I_o + A*q*((D_n*N_i^2)/(L_n*N_a))  % n+/p device, Donor rich
I_withEverything = I_o*(exp((V_A)*(0.0259^(-1)))-1)

j = I_withEverything/0.01

cprintf('_green','------------YIELD BOt-----------------')
cprintf('_green','---------YIELD 2--------------')


q = 1.6*10^(-19);
I_o = ((D_p/L_p)*(N_i^2/N_d)) %P+/n Acceptor rich device
val = ((D_n/L_n)*(N_i^2/N_a))
I_o = 1*A*(I_o + val) % n+/p device, Donor rich

I = I_o*(exp((q*V_A)*((k*T)^(-1)))-1)

J = I/0.01



cprintf('_green','------------YIELD BOt 2-----------------')






clc
%% working status UKNOWN

%% CONSTANTS
q = 1.6*10^(-19);   %number of elcectrons per couloumb
E = 8.854187817*10^(-14);%permitivity free space
k = 8.617*10^(-5);

%% Knobs 
N_a = 10^20;        %Number of hole dopants
N_d = 10^10;         %Number of electron dopants
N_i = 10^10;        %Intrinsic carriers
T = 300;            %K
K = 11.8;           %Si
E_g_Si = 1.12;      %band gap Si
A = 1.0e-4;  %area
V_A = 0.2; %Voltage applied

mu_n = 1400; %Si 
mu_p = 12;   %cm^2 Electron/hole Mobility

D_p = 12; % Si 
%D_p = 20; % Si TEST
%D_p = D_p/4; % Si TEST
D_n = 36; % diffustion constants
%D_n = 36; % 

    %c_n = 10; %constants of proportionality  WRONG
    %c_p = 10;

   %N_T = 10; %Number of R-G Centers WRONG
    %Tau_n = 1/(c_n*N_T);
    %Tau_p = 1/(c_p*N_T);

Tau_n = 10^-6; %minority carrier lifetimes good guesses
Tau_p = 10^-6; %seconds
%Tau_p = 10^-4; % TEST seconds

L_p =  sqrt(D_p*Tau_p) %diffustion length
L_n = sqrt(D_n*Tau_n)





%% Results
if N_a > N_d %P+/n Acceptor rich device
    I_o = (A*q*D_p*N_i^2)/(L_p*N_d) 
else % n+/p device, Donor rich
    I_o = (A*q*D_n*N_i^2)/(L_n*N_a) 
end

I = I_o*(exp((V_A)*(0.0259^(-1)))-1)


I_o = (A*q*D_p*N_i^2)/(L_p*N_d); %P+/n Acceptor rich device
I_o = I_o + (A*q*D_n*N_i^2)/(L_n*N_a);  % n+/p device, Donor rich
I_withEverything = I_o*(exp((V_A)*(0.0259^(-1)))-1)


















%% Graphing Fun
close
N_d1 = 10^8;         %Number of electron dopants
N_a1 = 10^12;
len = 1;




Voltage_axis = linspace(-1,1,1000);

I_o = (A*q*D_p*N_i^2)/(L_p*N_d);
I_o = I_o + (A*q*D_n*N_i^2)/(L_n*N_a1); 
Current_axis = I_o*(exp((Voltage_axis)*(0.0259^(-1)))-1);
plot(Voltage_axis,Current_axis,"-",'Color','b','LineWidth',len)

hold on






N_d2 = 10^16;          %Number of electron dopants
N_a2 = 10^4;



I_o = (A*q*D_p*N_i^2)/(L_p*N_d2);
I_o = I_o + (A*q*D_n*N_i^2)/(L_n*N_a2); 
Current_axis = I_o*(exp((Voltage_axis)*(0.0259^(-1)))-1);
plot(Voltage_axis,Current_axis,"--",'Color','g','LineWidth',len)








N_d3 = 10^17;          %Number of electron dopants
N_a3 = 10^3;



I_o = (A*q*D_p*N_i^2)/(L_p*N_d3);
I_o = I_o + (A*q*D_n*N_i^2)/(L_n*N_a3); 
Current_axis = I_o*(exp((Voltage_axis)*(0.0259^(-1)))-1);
plot(Voltage_axis,Current_axis,"--",'Color','r','LineWidth',len)









N_d4 = 10^17.5;         %Number of electron dopants
N_a4 = 10^2.5;

I_o = (A*q*D_p*N_i^2)/(L_p*N_d4);
I_o = I_o + (A*q*D_n*N_i^2)/(L_n*N_a4); 
Current_axis = I_o*(exp((Voltage_axis)*(0.0259^(-1)))-1);
plot(Voltage_axis,Current_axis,"-",'Color','magenta','LineWidth',len)

str_1 = sprintf('ND = %g',N_d1);
str_2 = sprintf('ND = %g',N_d2);
str_3 = sprintf('ND = %g',N_d3);
str_4 = sprintf('ND = %g',N_d4);


plot(0,0,'x', 'Color', 'black', MarkerSize=15)
xlim([-0.5 0.2])
ylim([-0.1 0.14])
xlabel("Volts (V)")
ylabel("Current (I)")

legend(str_1,str_2,str_3,str_4)
legend('Location','northwest')
grid on

clear
cprintf('_green','-----------------------------')

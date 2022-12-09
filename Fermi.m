function F = Fermi(N_D,N_A,N_i,E_G)

%E_G = 1.12; %Si
%N_i = 10^10; %Si
%N_D = 10^15;
%N_A = 10^5;


if (N_D > N_A)
    F = 0.0259*log(N_D/N_i) + E_G/2 ;%EF_N_plus
else
    F = -(0.0259*log(N_A/N_i) - E_G/2) ;%EF_P_plus

end
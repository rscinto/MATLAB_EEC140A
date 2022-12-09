function E = abs_E_max(donors, K, x_n)

E = 8.854187817*10^(-14);
q = 1.6*10^(-19);
%q = 1;

E = abs((q*donors*x_n)/(K*E));

end
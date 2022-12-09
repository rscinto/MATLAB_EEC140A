function len = x_n_long(donors, V_bi, V_A, K)
E = 8.854187817*10^(-14);
q = 1.6*10^(-19);

len = (((2*K*E*(V_bi - V_A))/(q*donors)))^(1/2);

end

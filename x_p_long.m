function len = x_p_long(acceptors, donors, V_bi, V_A, K)
E = 8.854187817*10^(-14);
q = 1.6*10^(-19);

len = (((2*K*E*donors*(V_bi - V_A))/(q*acceptors*(acceptors+donors))))^(1/2);

end
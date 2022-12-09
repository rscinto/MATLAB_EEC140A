function W = W_V_A(acceptors, donors, V_A, V_bi, K)

E = 8.854187817*10^(-14);
q = 1.6*10^(-19);

W = (((2*K*E)/(1)) * ((acceptors+donors)/(acceptors*donors)) * (V_bi - V_A)  )^(1/2);

end
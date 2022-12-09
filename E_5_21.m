function E = E_5_21(acceptors, donors,K, x_n, x)

E = 8.854187817*10^(-14);
q = -1.6*10^(-19);


E = -(x_n - x) * ((donors*q)/(K*E));

end
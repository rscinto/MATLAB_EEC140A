function V = V_bi(acceptors, donors, n_i)

q = 1;
k = 8.617 * 10 ^(-5);
  
V = (0.0259)*log((acceptors*donors)/(n_i^2));

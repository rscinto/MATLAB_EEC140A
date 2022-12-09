clc
%% Working status unknown

%% Knobs and Constants
T = 300;
k = 8.167e-5;
E = 8.854187817*10^(-14);
q = -1.6*10^(-19);
KS = 11.8; %dielectric constant Si
N_i = 1.0e10;
E_g = 1.12; %Band gap Si

%% Control Constants
xleft = -3.5e-4;
xright = -xleft;
%NA = input('Enter p-side doping: , NA =');
%ND = input('Enter n-side doping: , ND =');
NA = 5*10^15
ND = 10^14

%% Computations
vbi = k*T*log((ND*NA)/(N_i^2))
V_A = 20;
xN = x_n_long(ND, vbi, V_A, KS)
xP = x_p_long(NA, ND, vbi, V_A, KS)

%xN = sqrt(2*KS*E/q*NA*vbi/(ND*(NA+ND)))
%xP = sqrt(2*KS*E/q*ND*vbi/(NA*(NA+ND)))

W = xN + xP
x = linspace(xleft,xright,200);
Vx1 = (vbi-q*ND.*(xN-x).^2/(2*KS*E).*(x<=xN)).*(x>=0);
Vx2 = 0.5*q*NA.*(xP+x).^2/(KS*E).*(x>=-xP & x<0);
Vx = Vx1 + Vx2;
VMAX = 3;
EF = Vx(1)+VMAX/2-k*T*log(NA/N_i);

%% plotting
close
plot(x, -Vx+E_g/2+VMAX/2);

axis([xleft xright -1 VMAX]);
axis('off'); hold on
plot(x, -Vx-E_g/2+VMAX/2);
plot(x, -Vx+VMAX/2,'black');
plot([xleft xright], [EF EF], 'black');
plot([0 0], [0.15 VMAX-0.5], 'black--');

text(xleft*1.08,(-Vx(1)+E_g/2+VMAX/2-0.5),'Ec');
text(xright*1.02,(-Vx(200)+E_g/2+VMAX/2-0.5),'Ec');

text(xleft*1.08,(-Vx(1)-E_g/2+VMAX/2-0.5),'Ev');
text(xright*1.02,(-Vx(200)-E_g/2+VMAX/2-0.5),'Ev');

text(xleft*1.08,(-Vx(1)+VMAX/2-0.5),'Ei');
text(xright*1.02, EF-0.5,'EF');

set(gcs,'DefaultTextUnits','normalized')
text(0.18, 0, 'P-side');
text(0.47,0,'x=0');
text(0.75, 0, 'n-side');
set(gcs,'DefaultTextUnits','data')
hold off
clear
cprintf('_green','-----------------------------')

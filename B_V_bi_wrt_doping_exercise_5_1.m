clc
%Vbi calculation in doped PN Junction

%Constants
EG = 1.12; %Si
kT =  0.0259; %eV
ni = 10^10; %intrinsic

%10^14/cm^3 <= NA || ND <= 10^17/cm^3
ND = logspace(14,20);
Vbi = EG/2 + kT.*log(ND./ni);

%plotting
close
semilogx(ND,Vbi); grid
axis([1.0e14 1.0e17 0.75 1])
xlabel('NA or ND (cm-3)')
ylabel('Vbi(volts)')
text(1e16,0.8,'Si, 300K')
text(1e16, 0.78,'p+/n and n+/p diodes')
clear
cprintf('_green','-----------------------------')

clc
% find E fermi given the doping of Na
% find E fermi instrinsic from Si
% temperature range is 200 - 500 K
% plot Ef - Ei as a function of temperature
E_g_Si = 1.12; %eV
E_F_Si = E_g_Si / 2;
m_0 = 9.1093 *10^-31; %kg
m_star_n = 1.18 * m_0; % electron effective mass
m_star_p = 0.81 * m_0; % hole effective mass
T = 200:0.1:500;
k = 8.617*10^-5;
N_A = 10^14; %/cm^3 
N_D = 10^14; %/cm^3

n_i_Si = (9.15e19.*(T./300).^2.*exp(-0.5928./(k*T)));
p_type = -k.*T.*reallog(N_A./n_i_Si);
n_type = k.*T.*reallog(N_D./n_i_Si);

plot(T, n_type, 'color', 'b')
hold on

plot(T, p_type,'color', 'r')
hold on

N_A = 10^15; %/cm^3 
p_type = -k.*T.*reallog(N_A./n_i_Si);
plot(T, p_type,'color', 'r', 'LineStyle','-.', 'HandleVisibility','off')
hold on

N_A = 10^16; %/cm^3 
p_type = -k.*T.*reallog(N_A./n_i_Si);
plot(T, p_type,'color', 'r', 'LineStyle','-.', 'HandleVisibility','off')
hold on

N_A = 10^17; %/cm^3 
p_type = -k.*T.*reallog(N_A./n_i_Si);
plot(T, p_type,'color', 'r', 'LineStyle','-.', 'HandleVisibility','off')
hold on

N_A = 10^18; %/cm^3 
p_type = -k.*T.*reallog(N_A./n_i_Si);
plot(T, p_type,'color', 'm', 'LineStyle','--')

legend('N-type', 'P-type(Low Dopant Level)', 'P-type(High Dopant Level)')
grid on
xlabel('Temperature (K)', 'Fontsize',16);
ylabel('E_{f} - E_{i}', 'Fontsize', 16);

clear
cprintf('_green','-----------------------------')
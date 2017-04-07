%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4
clc
clear
close all

figure
linex = [50 98 133 174 246];
liney = [1450 950 645 400 74];
p_line = polyfit(linex, liney, 1);
m_line = p_line(1);
b_line = p_line(2);
plot(linex, (m_line*linex)+b_line,'-.k','LineWidth',3);
hold on
plot(linex, liney,'+','MarkerFaceColor','k','MarkerSize', 3);
lin_txt = sprintf('Y = %0.6fX+%0.1f',m_line, b_line);
%text(lin_txt,'Color','b','TextColor','w');
grid on

figure
expx = [3.6 5.5 10.7 16.3 24.1 28 35];
expy = [1.407 1.871 4.081 9.455 30.46 54.68 156.26];
p_exp = polyfit(expx, log(expy), 1);
m_exp = p_exp(1);
b_exp = exp(p_exp(2));
plot(expx,exp(b_exp*(expx.^m_exp)), '-c','LineWidth',3);
hold on
plot(expx,expy,'s','MarkerFaceColor','c','MarkerSize',3);
grid on

figure
powx = [.4 3 8.5 11.3 16.6 20];
powy = [52.23 12.24 5.78 4.71 3.57 3.12];
p_pow = polyfit(log10(powx), log10(powy), 1);
m_pow = p_pow(1);
b_pow = 10^p_pow(2);
plot(powx, powy, 'V','MarkerFaceColor','b','MarkerSize',3);
hold on
plot(powx,(m_pow*(powx.^b_pow)),'--b','LineWidth',3);
grid on
clc
clear
close all

%enter data provided
d = [1 3 6 10]; %distance d [m]
ra = [79 400 1100 2500]; %resistance [ohms]
rb = [150 840 2500 4900]; %resistance [ohms]
rc = [460 2500 6900 15000]; %resistance [ohms]

%plotting
figure('color', 'w')
plot(d, ra, 'ko', d, rb, 'rs', d, rc, 'bd');
grid

%determine power model parameters
rafit = polyfit(log10(d), log10(ra), 1);
rbfit = polyfit(log10(d), log10(rb), 1);
rcfit = polyfit(log10(d), log10(rc), 1);

%calculate trendlines
d_th = [1:10];

%b*x^m
rapf = 10^rafit(2)*d_th.^rafit(1);
rbpf = 10^rbfit(2)*d_th.^rbfit(1);
rcpf = 10^rcfit(2)*d_th.^rcfit(1);

%add trendlines to graph
hold on
plot(d_th, rapf, 'k-', d_th, rbpf, 'r:', d_th, rcpf, 'b.-');

%add text boxes to graph
te1 = sprintf('R_A = %0.2f d^{%0.1f}', 10^rafit(2), rafit(1));
te2 = sprintf('R_B= %0.2f d^{%0.1f}', 10^rbfit(2), rbfit(1));
te3 = sprintf('R_C = %0.2f d^{%0.1f}', 10^rcfit(2), rcfit(1));
text(7.6, 500, te1)
text(7.6, 5500, te2)
text(7.6, 8000, te3)

%are my experimental data points on, above, or below my trendline (underestimated or overestimated)

%(1) the experimental data x, y coordinates
%(2) take the ex value and calculate the corresponding y value on the trendline
%we then compare the experimental y data value with the trendline y value

x = d(3);
y_experimental = rb(3);
y_trendline = 10^rbfit(2)*x^rbfit(1);

if y_experimental > y_trendline
  fprintf('Experimental data point is above trendline\n');
elseif y_experimental < y_trendline
  fprintf('Experimental data point is below trendline\n');
else
  fprintf('Experimental data point is on the trend line\n');
end

%is a user-defined point between the lines ra and rb
x_in = input('Enter the x value: ');
y_in = input('Enter the y value: ');

y_trendline_ra = 10^rafit(2)*x_in^(rafit(1));
y_trendline_rb = 10^rbfit(2)*x_in^(rbfit(1));

if y_in <= y_trendline_rb && y_in >= y_trendline_ra
  fprintf('Experimental data point is on or between the two trend lines\n');
elseif y_in < y_trendline_ra
  fprintf('Experimental data point is below trendline ra\n');
else
  fprintf('Data point is above trendline rb\n');
end

hold on
plot(x_in, y_in, 'og', 'MarkerSize', 10);

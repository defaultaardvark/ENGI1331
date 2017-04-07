clc
clear
close all

v_range = [0 15];
f_range = [0 10000];
Test = [v_range(1) f_range(1)];
value_again = 1;

voltage = [];
frequency = [];
while value_again == 1;
  while Test(1) > v_range(1) || Test(1) < v_range(2)
    Test = input('Input Voltage [V] and Frequency [Hz]: ');
    tstcount = 1;
      while size(Test) ~= [1 2]
        if tstcount == 3
          error('Too many tries. Terminating.');
        else
          test_txt = sprintf('Dimensions not correct. Please try again: ');
          Test = input(test_txt);
          tstcount = tstcount + 1;
      end
      if Test(1) > v_range(1) || Test(1) < v_range(2)
        warning('Voltage outside of range. Restarting program.');
        %v_txt = sprintf('Voltage out of range. Input voltage between %0.0f and %0.0f: ',v_range(1),v_range(2));
        %v_Test = input(v_txt);
        %Test(1) = v_Test;
      end
    end
    while Test(2) < f_range(1) || Test(2) > f_range(2)
      f_txt = sprintf('Frequency out of range. Input frequency between %0.0f and %0.0f: ',f_range(1), f_range(2));
      f_test = input(f_txt);
    end
    Test(2) = f_test;
    voltage = [voltage Test(1)];
    frequency = [frequency Test(2)];
    value_again = menu('Input another value?','Yes','No');
  end
end

%% graph test
figure('Color','w');

za_h = [0 7500; 1 7500; 2 7500; 3 7500];
plot(za_h(:,1), za_h(:,2), '-m','LineWidth',3);
hold on

za_lin = [3 7500; 6 9000];
plot(za_lin(:,1), za_lin(:,2), '-m','LineWidth',3);
hold on

za_v = [6 6000; 6 9000];
plot(za_v(:,1), za_v(:,2), '-m','LineWidth',3);
hold on

za_pow = [0.15 1000; 3 4244; 6 6000];
za_fit = polyfit(log10(za_pow(:,1)), log10(za_pow(:,2)), 1);
m_pow = za_fit(1);
b_pow = 10^za_fit(2);
v_fit = [0:6];
f_fit = b_pow*v_fit.^m_pow;
plot(v_fit, f_fit, '-m','LineWidth',3);
hold on

zb_h = [12 7500; 15 7500];
plot(zb_h(:,1), zb_h(:,2), ':b','LineWidth',3);
hold on

zb_exp = [8 3000; 11 6000; 12 7500];
zb_fit = polyfit(zb_exp(:,1), log(zb_exp(:,2)), 1);
m_exp = zb_fit(1);
b_exp = exp(zb_fit(2));
v_exp = [8:12];
f_exp = b_exp*(exp(m_exp*v_exp));
plot(v_exp, f_exp, ':b','LineWidth',3);
hold on

zb_v = [8 0; 8 3000];
plot(zb_v(:,1), zb_v(:,2), ':b','LineWidth',3);

axis([0 15 0 10000])
set(gca, 'xtick', 0:1:15);
xlabel('Voltage (V) [V]');
ylabel('Frequency (f) [Hz]');
title('Voltage vs. Frequency');
grid on
hold on

a_text = sprintf('Zone A\nAccept');
b_text = sprintf('Zone B\nAccept');
text(1.5,6500, a_text, 'Color','m','FontSize',14);
text(10, 3000, b_text, 'Color','b','FontSize',14);
text(3, 2000, 'Reject','FontSize',14);
text(8, 9000, 'Reject','FontSize',14);

%% accept or Reject
for curr = 1:size(voltage,2)
  if voltage <=
  plot(voltage(curr),frequency(curr),'.r','MarkerSize',3);

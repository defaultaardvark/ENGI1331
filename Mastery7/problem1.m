%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30-4:00
%problem 1

clc
clear
close all

%graphing
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
v_fit = [0:0.1:6];
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
hold on

%Data entry and verification
v_fit = [0:6];
f_fit = b_pow*v_fit.^m_pow;

v_range = [0 15];
f_range = [0 10000];
value_again = 1;

entry = [];
voltage = [];
frequency = [];
status = [];
entrynum = 0;
ptcnt = 0; %point counter
while value_again == 1;
  zone = 0;
  Test = [v_range(1) f_range(1)];
  while Test(1) <= v_range(1) || Test(1) >= v_range(2)
    Test = input('Input Voltage [V] and Frequency [Hz]: ');
    tstcount = 1;
      while size(Test,2) ~= 2
        if tstcount == 3
          error('Too many tries. Terminating.');
        else
          test_txt = sprintf('Dimensions not correct. Please try again: ');
          Test = input(test_txt);
          tstcount = tstcount + 1;
        end
      if Test(1) <= v_range(1) || Test(1) >= v_range(2)
        warning('Voltage outside of range. Restarting input.');
      end
    end
    while Test(2) < f_range(1) || Test(2) > f_range(2)
      f_txt = sprintf('Frequency out of range. Input frequency between %0.0f and %0.0f: ',f_range(1), f_range(2));
      f_test = input(f_txt);
      Test(2) = f_test;
    end
  end
  ptcnt = ptcnt+1;

  %zone A check

  %section 1
  linrngy = 500*(3:6)+6000;
  linrngx = [3:6];
  for curr = 1:size(linrngy,2)
    if Test(1) == linrngx(curr)
      if Test(2) <= linrngy(curr) && Test(2) >= linrngy(1)
        zone = 1;
        plot(Test(1),Test(2),'.r','MarkerSize',50);
        ptcnts = num2str(ptcnt);
        text(Test(1),Test(2),ptcnts,'HorizontalAlignment','Center');
      end
    end
  end

  %section 2
  if Test(1) >= 0 && Test(1) <= 6
    if Test(2) <= 7500 && Test(2) >= 6000
      zone = 1;
      plot(Test(1),Test(2),'.r','MarkerSize',50);
      ptcnts = num2str(ptcnt);
      text(Test(1),Test(2),ptcnts,'HorizontalAlignment','Center');
    end
  end

  %section 3
  f_fitx = [0:size(f_fit,2)];
  for curr = 1:size(f_fit, 2)
    if Test(1) == f_fitx(curr)
      if Test(2) >= f_fit(curr) && Test(2) <= 6000
        zone = 1;
        plot(Test(1),Test(2),'.r','MarkerSize',50);
        ptcnts = num2str(ptcnt);
        text(Test(1),Test(2),ptcnts,'HorizontalAlignment','Center');
      end
    end
  end

  %zone B check

  %section 1
  if Test(1) >= 8 && Test(1) <= 15
    if Test(2) >= 0 && Test(2) <= 3000
      zone = 2;
      plot(Test(1),Test(2),'.r','MarkerSize',50);
      ptcnts = num2str(ptcnt);
      text(Test(1),Test(2),ptcnts,'HorizontalAlignment','Center');
    end
  end

  %section 2
  if Test(1) >= 12 && Test(1) <= 15
    if Test(2) >= 3000 && Test(2) <= 7500
      zone = 2;
      plot(Test(1),Test(2),'.r','MarkerSize',50);
      ptcnts = num2str(ptcnt);
      text(Test(1),Test(2),ptcnts,'HorizontalAlignment','Center');
    end
  end
  %section 3
  if Test(1) >= 8 && Test(1) <= 12
    for curr = 1:size(f_exp, 2)-1
      if Test(2) >= 3000 && Test(2) <= f_exp(curr)% && Test(2) <= f_exp(curr+1)
        zone = 2;
        plot(Test(1),Test(2),'.r','MarkerSize',50);
        ptcnts = num2str(ptcnt);
        text(Test(1),Test(2),ptcnts,'HorizontalAlignment','Center');
      end
    end
  end

  %defaults to reject zone
  if zone == 0
    reject = 0;
    plot(Test(1),Test(2),'.r','MarkerSize',50);
    ptcnts = num2str(ptcnt);
    text(Test(1),Test(2),ptcnts,'HorizontalAlignment','Center');
  end
  %Data storage and enter again?
  entrynum = entrynum + 1;
  entry = [entry entrynum];
  status = [status zone];
  voltage = [voltage Test(1)];
  frequency = [frequency Test(2)];
  value_again = menu('Input another value?','Yes','No');
  hold on
end

%output
fprintf('Entry # | Voltage [V] | Frequency [Hz] | Status\n');
for curr = 1:size(entry, 2)
  fprintf('\t%0.0f\t\t\t%0.0f\t\t\t%0.0f\t\t ',entry(curr),voltage(curr),frequency(curr));
  if status(curr) == 1
    fprintf('Accept Device in Zone A\n');
  elseif status(curr) == 2
    fprintf('Accept Device in Zone B\n');
  elseif status(curr) == 0
    fprintf('Reject Device\n');
  end
end

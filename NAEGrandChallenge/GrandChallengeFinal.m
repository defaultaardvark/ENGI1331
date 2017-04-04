clc
clear
close all

%Africa
Ghana = csvread('Ghana.csv');
Kenya = csvread('Kenya.csv');
SouthAfrica = csvread('South_Africa.csv');
%africa = [ghana kenya s_africa];

%Europe
France = csvread('France.csv');
Germany = csvread('Germany.csv');
Spain = csvread('Spain.csv');
UnitedKingdom = csvread('United_Kingdom.csv');
%europe = [france germany spain u_kingdom];

%latinAmerica
Argentina = csvread('Argentina.csv');
Ecuador = csvread('Ecuador.csv');
Mexico = csvread('Mexico.csv');
%latin = [argentina ecuador mexico];

%northAmerica
Canada = csvread('Canada.csv');
UnitedStates = csvread('United_States.csv');
%n_amer = [canada u_states];

%per region/continent averages per drug in large population areas

%plot average drug resistance and individual drug resistances over time
again = 1;
while again == 1
    %region = menu('Select Region','Africa','Europe','Latin America','North America'); %<-- needs to be changed to the nations, like what you did in your version. that was good

    nation = natchoose; %<--calls dialog box to receive String
    reg = eval(nation); %<--converts string to usable variable name (OMG IT ACTUALLY WORKS)

    %Asks the user if they would like to set a certain range of years
    spanchoose = menu('Data exists from 1999 to 2015. Would you like to define a year span?', 'Yes', 'No');
    if spanchoose == 1
        yrspan = input('Input year span between 1999 and 2015 in vector form, e.g. [2002 2010]: ');
        while yrspan(1) < 1999 || yrspan(2) > 2015 || yrspan(1) > yrspan(2)
            fprintf('Incorrect format for year span.');
            yrspan = input('Input year span between 1999 and 2015 in vector form, e.g. [2002 2010]: ');
        end
    else
        yrspan = [1999 2015];
    end
    
    %Determines the years that are associated with the graph.
    yr = [];
    yr_start = yrspan(1);
    for curr = 0:((yrspan(2) - yrspan(1))) %size(reg,1)
        yr_max = yr_start + curr;
        yr = [yr yr_max];
    end

    for i = 1:size(reg,1)
        for j = 1:size(reg,2)
            if rem(reg(i,j),1) ~= 0
                reg(i,j) = 101;
            end
        end
    end
%   if region == 1
    ind1 = (yrspan(2) - yrspan(1))+1;%size(reg,1); %<-- gets the # of rows in vector for later use
    indmask = find(reg((yrspan(1)-1998):(yrspan(2)-1998)) ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)
    mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
    yr_fil = yr(indmask);
    ind = ind1; %<-- allows for modifying the increment value (i don't think we need this though?)
    reg_avg = [];
    for curr = 1:size(reg(indmask<=ind),2)
        reg_avg = [reg_avg mean(reg(indmask(curr),:))]; %<-- builds vector of averages of data in each row
        ind = ind + 1;
    end
    
    reg_yr = yr(min(indmask(mask)):1:max(indmask(mask))); %<-- finds # of years of present data; in this case, only returns last two years.
      %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

    %Initializing the Scatter Plot
    ind = ind1;
    mask = indmask <= ind & indmask > ind-ind1;
    regrow = size(reg,2);
    figure(1);
    scatter(reg_yr, reg_avg);
    ylabel('Average of E.coli Resistance (%)');
    xlabel('Year');
    title(nation);
    grid;
    axis([yr_start yr_max 0 100]);
    
%     Outputs the average resistance per year
%     fprintf('Resistance averages per year for %s\n', nation);
%     fprintf('%0.0f\t\t', reg_avg);
%     fprintf('\n');
%     fprintf('%0.0f\t', reg_yr);
%     fprintf('\n');
    
    figure(2); %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
    drug = 1;
    reg_row = 1;
    col_ind = 0;
    %Cycle through different symbols for the plot
    mark = {'r+' 'go' 'b*'  'mx' 'ys' 'kd' 'r^' 'gp' 'bh' 'mo' 'y*' 'k.' 'rx' 'gs' 'bd' 'c^' 'mp' 'yh'};
    while drug <= size(reg,2) && reg_row <= size(indmask,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
        plot(yr,reg(yrspan(1)-1998:yrspan(2)-1998,drug),mark{drug});
        hold on
        drug = drug + 1;
%         col_ind = col_ind + 1;
%         [indrow indcol] = find(reg((yrspan(1)-1998):(yrspan(2)-1998)) ~= 0.1);
%         ind_fil = find(reg(:,indcol(col_ind))) ~= 0.1;
%         reg_fil = reg(indmask(reg_row)).*ind_fil;
%         %subplot(3,round(size(reg,2)/2),drug);
%         plot(reg_yr,reg_fil);
%         drug = drug + 1; %<-- next column?
%         reg_row = reg_row + 1;
%         plot_title = sprintf('Drug %0.0f', drug);
    end
    %Making the plot look nice
    axis([yr_start yr_max 0 100]);
    xlabel('Year');
    ylabel('Resistance To Antibiotics (%) [-]');
    grid;
    title('Resistance of Escherichia coli to Antibiotics');
    legend('Fluoroquinolones','Cephalosporins','Carabepanems','Aminopenicillins','Aminoglycocides','Piperacillin-tazobactam','Amoxicillin-clavulanate','Location','Best');
    %Asking the user if they wish to repeat the program
    again = menu('Would you like to repeat the program?','Yes','No');
    
end

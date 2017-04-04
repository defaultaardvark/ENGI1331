%% Ravi Namuduri, Carlos Marquez ENGI 1331 TTH 2:30-4 

clear
clc
close all

%Africa
ghana = csvread('Ghana.csv');
kenya = csvread('Kenya.csv');
s_africa = csvread('South_Africa.csv');
%africa = [ghana kenya s_africa];

%Europe
france = csvread('France.csv');
germany = csvread('Germany.csv');
spain = csvread('Spain.csv');
u_kingdom = csvread('United_Kingdom.csv');
%europe = [france germany spain u_kingdom];

%latinAmerica
argentina = csvread('Argentina.csv');
ecuador = csvread('Ecuador.csv');
mexico = csvread('Mexico.csv');
%latin = [argentina ecuador mexico];

%northAmerica
canada = csvread('Canada.csv');
u_states = csvread('United_States.csv');
%n_amer = [canada u_states];

%per region/continent averages per drug in large population areas

%plot average drug resistance and individual drug resistances over time
again = 1;
while again == 1

    yr = [];
    yr_start = 1999;
    for curr = 0:size(ghana,1)-1
      yr_max = yr_start + curr;
      yr = [yr yr_max];
    end

    %region = menu('Select Region','Africa','Europe','Latin America','North America');
    country = menu('Select Country','Ghana','Kenya','South Africa','France','Germany','Spain','United Kingdom','Argentina','Ecuador','Mexico','Canada','United States');
    if country == 1 
        ind1 = size(ghana,1); %<-- gets the # of rows in vector for later use
        indmask = find(ghana ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        ghana_avg = [];
        for curr = 1:size(ghana(indmask<=ind),1)
            ghana_avg = [ghana_avg mean(ghana(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        ghana_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(ghana,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(ghana,2),drug);
            plot(ghana_yr,ghana(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 2
        ind1 = size(kenya,1); %<-- gets the # of rows in vector for later use
        indmask = find(kenya ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        kenya_avg = [];
        for curr = 1:size(kenya(indmask<=ind),1)
            kenya_avg = [kenya_avg mean(kenya(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        kenya_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(kenya,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(kenya,2),drug);
            plot(kenya_yr,kenya(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end        
    elseif country == 3
        ind1 = size(s_africa,1); %<-- gets the # of rows in vector for later use
        indmask = find(s_africa ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        s_africa_avg = [];
        for curr = 1:size(s_africa(indmask<=ind),1)
            s_africa_avg = [s_africa_avg mean(s_africa(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        s_africa_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(s_africa,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(s_africa,2),drug);
            plot(s_africa_yr,s_africa(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 4
        ind1 = size(france,1); %<-- gets the # of rows in vector for later use
        indmask = find(france ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        france_avg = [];
        for curr = 1:size(france(indmask<=ind),1)
            france_avg = [france_avg mean(france(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        france_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(france,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(france,2),drug);
            plot(france_yr,france(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 5
        ind1 = size(germany,1); %<-- gets the # of rows in vector for later use
        indmask = find(germany ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        germany_avg = [];
        for curr = 1:size(germany(indmask<=ind),1)
            germany_avg = [germany_avg mean(germany(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        germany_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(germany,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(germany,2),drug);
            plot(germany_yr,germany(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 6
        ind1 = size(spain,1); %<-- gets the # of rows in vector for later use
        indmask = find(spain ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        spain_avg = [];
        for curr = 1:size(spain(indmask<=ind),1)
            spain_avg = [spain_avg mean(spain(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        spain_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(spain,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(spain,2),drug);
            plot(spain_yr,spain(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 7
        ind1 = size(u_kingdom,1); %<-- gets the # of rows in vector for later use
        indmask = find(u_kingdom ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        u_kingdom_avg = [];
        for curr = 1:size(u_kingdom(indmask<=ind),1)
            u_kingdom_avg = [u_kingdom_avg mean(u_kingdom(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        u_kingdom_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(u_kingdom,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(u_kingdom,2),drug);
            plot(u_kingdom_yr,u_kingdom(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 8
        ind1 = size(argentina,1); %<-- gets the # of rows in vector for later use
        indmask = find(argentina ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        argentina_avg = [];
        for curr = 1:size(argentina(indmask<=ind),1)
            argentina_avg = [argentina_avg mean(argentina(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        argentina_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(argentina,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(argentina,2),drug);
            plot(argentina_yr,argentina(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 9
        ind1 = size(ecuador,1); %<-- gets the # of rows in vector for later use
        indmask = find(ecuador ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        ecuador_avg = [];
        for curr = 1:size(ecuador(indmask<=ind),1)
            ecuadpr_avg = [ecuador_avg mean(ecuador(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        ecuador_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(ecuador,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(ecuador,2),drug);
            plot(ecuador_yr,ecuador(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 10
        ind1 = size(mexico,1); %<-- gets the # of rows in vector for later use
        indmask = find(mexico ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        mexico_avg = [];
        for curr = 1:size(mexico(indmask<=ind),1)
            mexico_avg = [mexico_avg mean(mexico(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        mexico_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(mexico,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(mexico,2),drug);
            plot(mexico_yr,mexico(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    elseif country == 11
        ind1 = size(canada,1); %<-- gets the # of rows in vector for later use
        indmask = find(canada ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        canada_avg = [];
        for curr = 1:size(canada(indmask<=ind),1)
            canada_avg = [canada_avg mean(canada(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        canada_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(canada,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(canada,2),drug);
            plot(canada_yr,canada(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end
    else
        ind1 = size(u_states,1); %<-- gets the # of rows in vector for later use
        indmask = find(u_states ~= 0.1); %<-- gets the indices of all values not 0.1 (indicating the presence of a value)

        mask = indmask <= ind1; %<-- mask to find all values in index vector greater than the # of rows; meant as increments, working only on the values in each column at a time
        ind = ind1; %<-- allows for modifying the increment value
        u_states_avg = [];
        for curr = 1:size(u_states(indmask<=ind),1)
            u_states_avg = [u_states_avg mean(u_states(indmask(mask(curr)),:))]; %<-- builds vector of averages of data in each row
            ind = ind + ind1;
        end
        u_states_yr = yr(min(indmask(mask)):length(yr)); %<-- finds # of years of present data; in this case, only returns last two years.
        %^Needs fixing because I think it can still fail if there are years after the last one that don't have data.

        ind = ind1;
        mask = indmask <= ind & indmask > ind-ind1;
        figure %<-- cool function that can create multiple graphs in the same window without overwriting each previous one
        drug = 1;
        while ind <= indmask(size(indmask,1)) && drug <= size(u_states,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
            subplot(1,size(u_states,2),drug);
            plot(u_states_yr,u_states(indmask(mask)));
            ind = ind+ind1; %<-- changes to next increment of column
            mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the current column
            if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
                ind = ind + ind1;
                mask = indmask <= ind & indmask > ind-ind1;
            end
            drug = drug + 1; %<-- next column?
        end        
    end
    again = menu('Would you like to analyze another data set?','Yes','No');
end

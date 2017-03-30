clc
clear
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
%while again == 1

yr = [];
yr_start = 1999;
for curr = 0:size(ghana,1)-1
  yr_max = yr_start + curr;
  yr = [yr yr_max];
end

region = menu('Select Region','Africa','Europe','Latin America','North America');

if region == 1
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
while ind < indmask(size(indmask,1)) && drug <= size(ghana,2) %<-- purpose of this loop is to create a new graph for every drug(column); almost there, but not quite. can't quite figure out what's going on.
    subplot(2,size(ghana,2),drug);
    plot(ghana_yr,ghana(indmask(mask)));
    ind = ind+ind1; %<-- changes to next increment of column
    mask = indmask <= ind & indmask > ind-ind1; %<-- creates mask with values in index matrix that belong in the curerent column
    if mask == 0 %<-- if there is a column with no data (no drug data), skips to next column and updates mask; may not be necessary with implementation of while loop. Try out removing it if you want
      ind = ind + ind1;
      mask = indmask <= ind & indmask > ind-ind1;
    end
    drug = drug + 1; %<-- next column?
  end
end

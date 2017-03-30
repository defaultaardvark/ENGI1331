clc
clear

vec = [77 3 4 5 4 0 9 66];

vec_max = 0;
for i = 1:length(vec)
  if i+1 > length(vec)
    break;
  elseif vec(i) > vec(i+1) && vec(i) > vec_max
    vec_max = vec(i);
  elseif vec(i+1) > vec(i) && vec(i+1) > vec_max
    vec_max = vec(i+1);
  else
  end
end
disp(vec_max);

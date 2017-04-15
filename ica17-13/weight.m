function[lbf] = weight(v,sg,g)
d = sg*1000; %kg/m^3
m = v*d;
f = m*g;
lbf = f/4.448;
end

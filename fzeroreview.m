fzero(Fname, x0, [], p1, p2,...)

fzero(@(x) Fname(x, c, b, a), x0 (or [xL xR]));

fminbnd() %find a local minimum of a function of one variable
x = fminbnd(@Fname, xL, xR);
x = fminbnd(@(x) Fname(x), xL, xR);
%can only be a function of one variable

%to find maximum of a function, take the negative of the input function
  %truly finds the minimum of the negative of the function. Finds the location of the "maximum" of the function within the range
x = fminbnd(@(x) -Fname(x), xL, xR);

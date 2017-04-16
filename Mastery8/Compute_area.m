function [area2, area3, larea2, larea3, rarea2, rarea3, intf2, intf3, left, right] = Compute_area(a,b,c,m,n,z,w,inc)

%lh, rh, mp, area, le, re
z1 = roots([a,b,c]); %finds zeros of the parabola
x1rng = z1(2)-z1(1);

%t = [1:x1rng];
f2int1 = fzero(@(t) fn1(t,a,b,c)-fn2(t,m,n), 1);
f2int2 = fzero(@(t) fn1(t,a,b,c)-fn2(t,m,n), ceil(x1rng)-1);
f3int1 = fzero(@(t) fn1(t,a,b,c)-fn3(t,z,w), 1);
f3int2 = fzero(@(t) fn1(t,a,b,c)-fn3(t,z,w), ceil(x1rng)-1);

rec2_w = (f2int2-f2int1)/inc; %<Riemann sum rectangle width fn2
rec3_w = (f3int2-f3int1)/inc; %<Riemann sum rectangle width fn2

%howtf does plotting functions work. I keep getting errors for these but there's no explanation
% figure
% axis([0 ceil(x1rng) 0 8])
% fplot(@(x) fn1(x,a,b,c),[0:x1rng])
% hold on
% fplot(@(t) fn2(t,m,n),[0:ceil(x1rng)])
% hold on
% fplot(@(t) fn3(t,z,w),[0:ceil(x1rng)])


%integral of functions
intf2 = integral(@(t) fn2(t,m,n), f2int1, f2int2);
intf3 = integral(@(t) fn3(t,z,w), f3int1, f3int2);

%midpoint sums
area2 = 0;
area3 = 0;
for i = 1:inc
  recf2 = rec2_w*fn2(f2int1+((i*rec2_w)-(rec2_w/2)),m,n);
  recf3 = rec3_w*fn3(f3int1+((i*rec3_w)-(rec3_w/2)),z,w);
  area2 = area2 + recf2;
  area3 = area3 + recf3;
end

%left hand sums
larea2 = 0;
larea3 = 0;
for i = 1:inc
  lrecf2 = rec2_w*fn2(f2int1+((i-1)*rec2_w),m,n);
  lrecf3 = rec3_w*fn3(f3int1+((i-1)*rec3_w),z,w);
  larea2 = larea2 + lrecf2;
  larea3 = larea3 + lrecf3;
end

%right hand sums
rarea2 = 0;
rarea3 = 0;
for i = 1:inc
  rrecf2 = rec2_w*fn2(f2int1+(i*rec2_w),m,n);
  rrecf3 = rec3_w*fn3(f3int1+(i*rec3_w),z,w);
  rarea2 = rarea2 + rrecf2;
  rarea3 = rarea3 + rrecf3;
end

%left side higher
if fn2(f2int1,m,n) > fn3(f3int1,z,w)
  left = 'Fn2';
elseif fn2(f2int1,m,n) < fn3(f3int1,z,w)
  left = 'Fn3';
elseif fn2(f2int1,m,n) == fn3(f3int1,z,w)
  left = 'Equal';
end
%right side higher
if fn2(f2int2,m,n) > fn3(f3int2,z,w)
  right = 'Fn2';
elseif fn2(f2int2,m,n) < fn3(f3int2,z,w)
  right = 'Fn3';
elseif fn2(f2int2,m,n) == fn3(f3int2,z,w)
  right = 'Equal';
end

end

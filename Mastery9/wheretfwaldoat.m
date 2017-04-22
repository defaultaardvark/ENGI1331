function [ref_red, back_red, xpos, ypos, xloc, yloc] = wheretfwaldoat(foundim, where_at)

%implicit loops (must replace)
ref_red = foundim(:,:,1);
ref_green = foundim(:,:,2);
ref_green = foundim(:,:,3);

back_red = where_at(:,:,1);
back_green = where_at(:,:,2);
back_blue = where_at(:,:,3);
%
image(where_at)
xpos = ceil((size(foundim, 1) - 1).*rand(1) + 1);
ypos = ceil((size(foundim, 2) - 1).*rand(1) + 1);

pixRed = foundim(xpos, ypos, 1);
pixGreen = foundim(xpos, ypos, 2);
pixBlue = foundim(xpos, ypos, 3);

%implicit loop (must replace)
[xloc yloc] = find(pixRed == back_red & pixGreen == back_green & pixBlue == back_blue);
%
for curr = 1:size(xloc, 1)
  pix1 = xloc(curr) - xpos;
  piy1 = yloc(curr) - ypos;
  if where_at(xloc(curr),yloc(curr),1) ~= ref_red(1,1) || where_at(xloc(curr),yloc(curr),2) ~= ref_green(1,1) || where_at(xloc(curr),yloc(curr), 3) ~= ref_blue(1,1)
  continue
  else
    for search = 1:((size(ref_red, 1)*size(ref_red, 2))/2)
      xpos = ceil((size(foundim, 1) - 1).*rand(1) + 1);
      ypos = ceil((size(foundim, 2) - 1).*rand(1) + 1);
      if back_red(pix1+xpos, piy1+ypos, 1) == ref_red(xpos, ypos, 1)...
       && back_green(pix1+xpos, piy1+ypos, 2) == ref_green(xpos, ypos, 2)...
       && back_blue(pix1+xpos, piy1+ypos, 3) == ref_blue(xpos, ypos, 3)
        image(where_at);
        hold on
      end
    end
  end
end

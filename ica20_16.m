clear
clc

again = 'no';
while strcmpi(again, 'no') == 1
  N = input('Input single number: ');
  if N ~= 0
    SEQ = [];
    curr = 1;
    while curr <= 99
    SEQ = [SEQ, (N*(curr/100))];
    curr = curr + 1;
    end
    SEQ
    again = input('Is this answer correct? ','s');
  else
    again = 'yes';
  end
end

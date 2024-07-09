function div = div(y,x)

% both y and x are vectors

div = y./x;
for i=1:length(x)
   if x(i)==0
       div(i)=0;
   end
end
return
function invd = invd(x)

% x is a vector

invd = 1./x;
for i=1:length(x)
   if x(i)==0
       invd(i)=0;
   end
end
invd = diag(invd);
return
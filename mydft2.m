function b = mydft2( a )
[h, w] = size(a);
b = zeros(h,w);

for i = 1:h
    b(i,:) = mydft(a(i,:));
end

for j = 1:w
    b(:,j) = mydft(b(:,j)) ;
end

end
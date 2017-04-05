function y = mydft(x)
N = length(x);
y = zeros (1,length(x));
for k = 0:N-1
    for n = 0:N-1
        y(k+1) = y(k+1) + x(n+1)*exp(-1i*pi*2*n*k/N);
    end
end

end

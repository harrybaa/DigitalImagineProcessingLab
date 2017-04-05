clear all;
s = 18;
dft_times = zeros(s,1);
myfft_times = zeros(s,1);

for i=1:s
X = single(rand(2^i,1)) + j * single(rand(2^i,1));
    t = cputime;
    myfft(X);
    myfft_times(i) = cputime - t;
fprintf( 1, 'size=%d\tmydft: %f\tmyfft: %f\n', 2^i, dft_times(i), myfft_times(i) );
end

plotX = 2.^[1:s];
plotNLOGN = plotX.*log(plotX);

plot(plotX,myfft_times, 'ro--' );
hold;
plot(plotX,plotNLOGN * max(myfft_times)/plotNLOGN(s),'g*:') 
legend('myfft','MlogM');
xlabel('M');
ylabel('cputime');
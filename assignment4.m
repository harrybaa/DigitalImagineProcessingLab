clear all;
s = 16;
fft_times = zeros(s,1);
myfft_times = zeros(s,1);

for i=1:s
X = single(rand(2^i,1)) + j * single(rand(2^i,1));
    t = cputime;
    fft(X);
    fft_times(i) = cputime - t;
    t = cputime;
    myfft(X);
    myfft_times(i) = cputime - t;
fprintf( 1, 'size=%d\tmydft: %f\tfft: %f\n', 2^i, fft_times(i), myfft_times(i) );
end
plot(2.^[1:s], fft_times, 'bx-' );
hold;
plot(2.^[1:s], myfft_times, 'ro--' );
plot(2.^[1:s],((2.^[1:s]).^2) * max(mydft_times) / ((2.^s).^2),'g*:') legend('fft','myfft','nlogn');
xlabel('M');
ylabel('cputime');
function y = myfft(x)
    N = length(x);
    if (log2(N) - round(log2(N)) ~= 0)
        error('Input vector length != 2^n');
    end
    if (~iscolumn(x))
        error('Input is not a column vector');
    end
    stages = log2(N)+1;
    tmp = zeros(N,stages);  
    tmp(:,1) = x(bitrevorder(1:N));
    for i = 2:stages
        Ns = 2^(i-1);
        Is = 2^(i-2);
        n = 0;
        for k = 1:N
           if (~bitand(k-1, (2^(i-2))))
               % calculate butterflys
               tf = exp(-1j*2*pi*n/Ns);
               % apply twiddle factor to lower element
               upper = tmp(k,i-1);
               lower = tf*tmp(k+Is,i-1);
               % upper element (even half)
               tmp(k,i) = upper + lower;
               % lower element (odd half)
               tmp(k+Is,i) = upper - lower;
               n = n + 1; 
           else
               n = 0;
           end
        end
    end
    y = tmp(:,stages);
    
end
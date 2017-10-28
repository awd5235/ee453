F = [0 0.3 0.4 0.65 0.7 1];     % Frequency cutoff vector
A = [0.2 0.2 0.8 0.8 0.3 0.3];  % amplitude cutoff vector
N = 80;                         % filter order 80
B = fir2(N,F,A);                % filter coeff vector of size 81
freqz(B,1);                   % Frequency response of filter B
title('Frequency Response of Digital FIR Filter');

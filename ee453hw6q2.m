% EE453 HW 6 Question 2
% Adam Dykhouse
% Use Parks-McClellan computer optimization method to design a
% digital FIR filter specified by the following frequency and amplitude
Fs = 16000;
f = [0 0.125 0.15 0.4125 0.4375 0.5625 0.5875 1];  % frequency cutoff pts
a = [1 1 0 0 0.5 0.5 0 0];                         % amplitude cutoff pts

% Part 1: Impulse and Magnitude Frequency Response of filter length 101
N = 100;                            % filter order of 100

b = firpm(N,f,a);                   % Find filter coefficients

figure(1)
freqz(b,1,Fs);               % Calculate Frequency Response
title('Frequency Response (L=101)');
grid on;

h = impz(b);                    % Find impulse response of filter b
figure(2);
stem(h);             % Plot impulse response
title('Impulse Response of Filter (L=101)');
xlabel('Samples');
ylabel('H[n]');
grid on;

% Part 2: Impulse and Magnitude Frequency Response of filter length 151
N = 150;                            % filter order of 100

b = firpm(N,f,a);                   % Find filter coefficients
figure(3)
freqz(b,1,Fs);               % Calculate Frequency Response
title('Frequency Response (L=151)');

h = impz(b);                    % Find impulse response of filter b
figure(4);
stem(h);             % Plot impulse response
title('Impulse Response of Filter (L=151)');
xlabel('Samples');
ylabel('H[n]');
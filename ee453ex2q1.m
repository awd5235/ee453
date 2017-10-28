% Adam Dykhouse
% EE453 Exam 2 Take Home Problem 2d
% Design a linear phase FIR bandpass filter.
Fs = 20000;                 % Sampling frequency
Wp = [3000 5000]*2/Fs;      % Normalized passband cutoff Frequencies

% Part A: FIR Bandpass of length 101 designed with Hanning window
N = 100;
B = fir1(N,Wp,hann(N+1));   % Determine filter coefficients
figure(1),freqz(B,1);       % Calculate and plot frequency response
title('Frequency Response: Von Hann Window L = 101');

% Part B: Hamming Window M = 67 (L = 135)
N = 134;
B = fir1(N,Wp);
figure(2),freqz(B,1);       % Calculate and plot frequency response
title('Frequency Response: Hamming Window L = 135');


% Part C: Kaiser Adjustable Window
F = [2500 3000 5000 7000];  % Start/stop band edge frequencies in Hz
A = [0 1 0];                % Desired amplitude response
DEV = [1 1 1]*.00031622766; % 35dB ripple/deviation
[N,Wn,BTA,FILTYPE] = kaiserord(F,A,DEV,Fs);  % Determine Kaiser parameters
B = fir1(N, Wn, FILTYPE, kaiser(N+1,BTA)); % Calculate filter coefficients
figure(3),freqz(B,1);
title('Frequency Response: Kaiser Window');
% Adam Dykhouse
% EE453 Homework 5 Problem 2
% Design digital IIR Bandpass filter using LP-Norm computer optimization
% algorithm

n = 1; % order of numerator from pervious question
d = 7; % order of denominator from previous question
f = [.30 .45 .65 .75]; % normalized cutoff frequencies for bandpass filter
edges = [.30 .75];     % normalized band edge frequencies
a = [0 1 1 0];         % desired amplitude at frequencies specified in f


[num,den] = iirlpnorm(n,d,f,edges,a);   % numerator and denominator coeffs
[H,W] = freqz(num,den);     % z-plane frequency response of BPF

plot((W/pi),abs(H));
title('LP Norm Digital Bandpass Filter');
xlabel('Normalized Frequency');
ylabel('|H(z)|');
grid on;
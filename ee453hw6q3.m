% EE453 Hw 6 Question 3
% Adam Dykhouse
% Design a length-64 discrete FIR differentiator. Plot
% the magnitude and phase response of the designed filter
% and the absolute error.
N = 64;
f = linspace(0,1,20);
b = firpm(N-1,f,f*pi,'differentiator');
[H,W] = freqz(b,1);

figure(1);
subplot(211),plot((W/pi),abs(H));   % Plot magnitude response
title('Magnitude Response');
xlabel('Normalized Frequency');
ylabel('|H(z)|');
grid on;

subplot(212),plot(W);   % Plot phase response
title('Phase Response');
xlabel('Normalized Frequency');
ylabel('Phase');
grid on;

figure(2);
plot(W/pi,(abs(H)-W));
title('Error');
xlabel('Normalized Frequency');
ylabel('Error');
grid on;
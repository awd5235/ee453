% Adam Dykhouse
% EE 453 section 1
% Homework 3 Question 2

B = [1 -1]; % Numerator coefficients of first order DC block filter
A = [1 0];  % Denominator coefficients of first order DC Block filter
[H,F] = freqz(B,A,8000);

figure
subplot(311);
plot(F, abs(H));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Response Magnitude');
grid on;

subplot(312);
plot(F, angle(H));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Response Phase');
grid on;

subplot(313);
plot(F, abs(H));
zplane(B,A);
title('pole/zero plot of H(Z)')
grid on;
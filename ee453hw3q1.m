% Adam Dykhouse
% EE 453 section 1
% Homework 3 Question 1
%----------------PROBLEM 1 PART D---------------------------------
a1 = [1 -1.548 1.632];   % Coefficients in denominator of H(z)
b1 = [1 0 -1];           % Coefficients in numerator of H(z)    
[H1,w1] = freqz(b1,a1);  % Compute the frequency response of digital filter

% plot frequency response
figure
subplot(211)
plot(w1,abs(H1))
xlabel('Frequency (Hz)')
ylabel('magnitude')
title('Frequency response magnitude')
grid on

subplot(212)
plot(w1,angle(H1))
xlabel('Frequency(Hz)')
ylabel('magnitude')
title('Frequency response phase')
grid on

% halve the bandwidth and replot
a2 = [1 -1.334 1.2683];   % Coefficients in denominator of H(z)
b2 = [1 0 -1];           % Coefficients in numerator of H(z)    
[H2,w2] = freqz(b2,a2);     % Compute the frequency response of digital filter

%plot frequency response
figure
subplot(211)
plot(w2,abs(H2))
xlabel('Frequency (Hz)')
ylabel('magnitude')
title('Frequency response magnitude')
grid on

subplot(212)
plot(w2,angle(H2))
xlabel('Frequency(Hz)')
ylabel('magnitude')
title('Frequency response phase')
grid on

% Adam Dykhouse
% EE453 Section 001
% Homework Two

%------------------------------------------------------------------------
%----------------------QUESTION 1----------------------------------------
% Consider finite-length discrete time signal                 
xn = [5 5 5 5 5 5 5 5];      % Signal
subplot(321), plot(xn);      % plot xn
title('x[n])');
ylabel('Amplitude');
xlabel('Samples (n)');


%--------------------Part C------------------
circshift(xn,2,1);
% N = 8
xk8 = fft(xn,8);
xk8m = abs(xk8);
subplot(322), stem(xk8m); 
title('|X(k)| for N=8');
ylabel('Amplitude');
xlabel('Frequency (k)');

% N = 64
xk64 = fft(xn,64);
xk64m = abs(xk64);
subplot(323), stem(xk64m); 
title('|X(k)| for N=64');
ylabel('Amplitude');
xlabel('Frequency (k)');

% N = 256
xk256 = fft(xn,256);
xk256m = abs(xk256);
subplot(324), stem(xk256m); 
title('|X(k)| for N=256');
ylabel('Amplitude');
xlabel('Frequency (k)');

%--------------------Part E------------------
yn = [5 5 5 5 5 5 5 5];
subplot(325), plot(yn);
title('y[n]');
ylabel('amplitude');
xlabel('samples (n)');

circshift(yn,5,1);
yk64 = fft(yn,64);
ykm64 = abs(yk64);
subplot(326),stem(yk64);
title('|Y(k)| for N = 64');
ylabel('amplitude');
xlabel('frequency (k)');


%------------------------------------------------------------------------
%----------------------QUESTION 4----------------------------------------

% From hw 1
Fs = 8000;
t = 0:1/Fs;.02;
x = cos(2*pi*1000*t) + cos(2*pi*800*t);
n = 0:length(x)-1;
subplot(211), plot(t,x);
title('x(t)');
ylabel('amplitude');
xlabel('time');
grid on;

subplot(212), stem(n,x)
title('x[n]');
ylabel('amplitude');
xlabel('samples');
grid on;

b = [1 -1.618 1];
a = [1 -1.4562 .81];
y = filter(b,a,x);
subplot(211),plot(t,y);
title('y(t)');
ylabel('amplitude');
xlabel('time');
grid on;

subplot(212),stem(y);
title('y[n]');
ylabel('amplitude');
xlabel('samples');
grid on;
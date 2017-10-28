Wp = 0.55*pi;
Ws = 0.3*pi;
Wc = (Wp+Ws)/2;
dw = Wp-Ws;
As = 42;

% Hamming
M = ceil(3.32*pi/dw);
N = 2*M;
b = fir1(N,(Wc/pi),'high',hamming(N+1));
[H,W] = freqz(b,1,512);

figure(1);
subplot(211);
stem(b);
title('Impulse Response Coefficients');
xlabel('Samples');
ylabel('h[n]');
grid on;

subplot(212);
plot(W/pi, 20*log10(abs(H)));
title('Digital FIR Highpass filter using Hamming window');
xlabel('W/pi');
ylabel('Gain (dB)');
grid on;

% Hann
M = ceil(3.11*pi/dw);
N = 2*M;
b = fir1(N,(Wc/pi),'high',hanning(N+1));
[H,W] = freqz(b,1,512);

figure(2);
subplot(211);
stem(b);
title('Impulse Response Coefficients');
xlabel('Samples');
ylabel('h[n]');
grid on;

subplot(212);
plot(W/pi, 20*log10(abs(H)));
title('Digital FIR Highpass filter using Hann window');
xlabel('W/pi');
ylabel('Gain (dB)');
grid on;

% Blackman
M = ceil(5.56*pi/dw);
N = 2*M;
b = fir1(N,(Wc/pi),'high',blackman(N+1));
[H,W] = freqz(b,1,512);

figure(3);
subplot(211);
stem(b);
title('Impulse Response Coefficients');
xlabel('Samples');
ylabel('h[n]');
grid on;

subplot(212);
plot(W/pi, 20*log10(abs(H)));
title('Digital FIR Highpass filter using Blackman window');
xlabel('W/pi');
ylabel('Gain (dB)');
grid on;

% Kaiser
ds = 10^(-As/20);
[N,Wn,beta,type] = kaiserord([(Ws/pi) (Wp/pi)],[1 0],[ds ds]);
N = N+1;
b = fir1(N,(Wc/pi),'high',kaiser(N+1,beta));
[H,W] = freqz(b,1,512);

figure(4);
subplot(211);
stem(b);
title('Impulse Response Coefficients');
xlabel('Samples');
ylabel('h[n]');
grid on;

subplot(212);
plot(W/pi, 20*log10(abs(H)));
title('Digital FIR Highpass filter using Kaiser window');
xlabel('W/pi');
ylabel('Gain (dB)');
grid on;
Fs = 8000;                            % Sample rate
Nfft = 64;                            % FFT block size
n = 0:1/Fs:999;                       % n consists of 1000 samples
xn = 22.5*sawtooth(2/9*pi*n)+22.5;                         % x[n]

% plot x[n]
subplot(211);
plot(n,xn);
xlabel('samples (n)');
ylabel('x[n]');
grid on;

hm = [10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10]; % h[n]
M = length(hm);       % length of h[n]
m = 0:M-1;            % variable n is taken, use m to plot h

%plot h[n]
subplot(212);
plot(m,hm);
xlabel('samples (n)');
ylabel('h[n]');
grid on;

clf;

k = 0:1:63;
H = fft(hm,64);                          % H(k)

% plot H(k)
plot(k,H);
xlabel('frequency k');
ylabel('H(k)');
grid on;


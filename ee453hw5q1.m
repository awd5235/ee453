% Adam Dykhouse
% EE453 Homework 5 Problem 1

% Determine order and frequency cutoff of analog LPF prototype
[N,Wn] = buttord(1,2.3617627,1,40,'s');
% Determine numerator and denominator coefficients of analog LPF prototype
[B,A] = butter(N,Wn,'s');
% Transform analog LPF to analog BPF. Determine num and denom coefficients
[BT,AT] = lp2bp(B,A,1.1805647,0.777771);
% Take bilinear z transform and determine num and denom coefficients.
[num,den] = bilinear(BT,AT,0.5);

%------------------------PART 1-------------------------------------
% Determine and plot complex z domain frequency response.
figure(1)
freqz(num,den);

%--------------------------PART 2----------------------------------
% Generate and plot IIR of digital BPF. Then approximate it as an FIR
% filter using the first 2M+1 coefficients and rectangular windowing. Do
% once for M=20 and once for M=40.
[I,T] = impz(num,den);          % generate IIR BPF

figure(2)
stem(T,I);     % plot IIR BPF
title('IIR of Bandpass Filter');
xlabel('T (samples)');
ylabel('Magnitude');
grid on;

Wp = [.45 .65];     % passband cutoff frequencies for BPF given in slides
% Generate and plot FIR bandpass approximation using rectangular window of
% size 2M+1 where M = 20
rFirSm = fir1(40,Wp,'Bandpass',rectwin(41));

figure(3)
freqz(rFirSm,1);
title('FIR of BPF using small rectangular window');
grid on;

% Generate and plot FIR bandpass approximation using rectangular window of
% size 2M+1 where M = 40
rFirLarg = fir1(80,Wp,'Bandpass',rectwin(81));

figure(4)
freqz(rFirLarg,1);
title('FIR of BPF using large rectangular window');
grid on;

%--------------------------PART 3----------------------------------
% Repeat part 2 with Hamming windows instead of rectangular windows

% Generate and plot FIR bandpass approximation using hamming window of
% size 2M+1 where M = 20
hFirSm = fir1(40,Wp,'Bandpass',hamming(41));

figure(5)
freqz(hFirSm,1);
title('FIR of BPF using small hamming window');
grid on;

% Generate and plot FIR bandpass approximation using hamming window of
% size 2M+1 where M = 40
hFirLarg = fir1(80,Wp,'Bandpass',hamming(81));

figure(6)
freqz(hFirLarg,1);
title('FIR of BPF using large hamming window');
grid on;

%--------------------------PART 4----------------------------------
% Repeat part 2 with Von Hann windows instead of rectangular windows

% Generate and plot FIR bandpass approximation using von hann window of
% size 2M+1 where M = 20

vFirSm = fir1(40,Wp,'Bandpass',hann(41));

figure(7)
freqz(vFirSm,1);
title('FIR of BPF using small von hann window');
grid on;

% Generate and plot FIR bandpass approximation using von hann window of
% size 2M+1 where M = 40
vFirLarg = fir1(80,Wp,'Bandpass',hann(81));

figure(8)
freqz(vFirLarg);
title('FIR of BPF using large von hann window');
grid on;


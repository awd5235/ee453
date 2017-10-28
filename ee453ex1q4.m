% ---------TAKE HOME PROBLEM 4----------------------
% Design ditigal butterworth lowpass filter with
% passband cutoff frequency .2pi, stopband cutoff frequency .6pi,
% 3dB passband ripple and 12dB stopband ripple
Wp = .2;
Ws = .6;
Rp = 3;
Rs = 12;

% Determine order and cutoff frequency
[N,Wn] = buttord(Wp, Ws, Rp, Rs);
display(N);     % N = 1
display(Wn);    % Wn = 0.2184

% Determine butterworth digital filter H(z)
[B,A] = butter(N,Wn);
display(B);     % B = [0.2632 0.2632]
display(A);     % A = [1 -0.4736]
[H,w] = freqz(B,A);

% plot magnitude response
subplot(211)
plot(w,20*log10(abs(H)));
xlabel('Frequency (rads)');
ylabel('Magnitude Response |H(z)|dB');
grid on;
% plot frequency response
subplot(212)
plot(w,phase(H));
xlabel('Frequency Response');
ylabel('Phase of H(z)');
grid on;

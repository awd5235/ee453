% Find order N and 3dB freq Wn of analog filter specified by
% wp, ws, rp, and rs. 's' denotes analog, so wp and ws are in rad/s
[N, Wn] = buttord(5, 15, 3, 30, 's');
display(N)
display(Wn)

% Butterworth analog LPF prototype. Returns zeroes, poles, and gain
% of N-th order butterworth analog LPF (N poles and no zeroes).
[z,p,k]=buttap(N);
display(z)
display(p)
display(k)

% Convert to transfer function form. 
% Return numerator and denominator coefficients of H(s) (Note: S-DOMAIN)
[num,den]=zp2tf(z,p,k);
display(num)
display(den)

% Complex Frequency response of analog filter (S-domain laplace transform)
[h,w] = freqs(num,den);

% Plot magnitude response
subplot(311)
plot(w,abs(h))
ylabel('Magnitude Response')
xlabel('Frequency (rad/s)')
grid on

% Plot phase response
subplot(312)
plot(w,phase(h))
ylabel('Phase Response')
xlabel('Frequency (rad/s)')
grid on

% Plot magnitude response in dB
subplot(313)
plot(w,20*log10(abs(h)))
ylabel('Magnitude Response (dB)')
xlabel('Frequency (rad/s)')
grid on


%-----------PART A---------------
num = 133.12;
den = [1 10.212 52.142 133.12];

[numd,dend] = bilinear(num,den,10);
[h,w] = freqz(numd,dend);

subplot(211)
plot(w,20*log10(abs(h)))
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
grid on

subplot(212)
plot(w,phase(h));
xlabel('Frequency (rad/s)');
ylabel('Phase');
grid on

%--------------PARTB--------------
[b,a] = butter(3,.5/pi);
display(b)
display(a)
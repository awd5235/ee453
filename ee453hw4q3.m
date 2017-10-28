oc=5;
b=1*oc^4;
a=[1 2.6131*oc 3.4142*(oc^2) 2.6131*(oc^3) 1*(oc^4)];
[bz,az] = impinvar(b,a,10);

subplot(211)
plot(w,20*log10(abs(h)));
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
grid on

subplot(212)
plot(w,phase(h));
xlabel('Frequency (rad/s)');
ylabel('Phase');
grid on
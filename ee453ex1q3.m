% setup sample rate and frequency vector
Fs = 8000;           % sample rate
w = 0:1/Fs:pi;       % frequency vector between 0 and pi

% given alpha = .6127 and beta = 0 calculated in the exam
% characterize transfer function of bandstop filter as a function of Z
% such that bandwidth is .15*pi and center frequency is .5*pi
b = [.8064 0 .8064]; % numerator coefficients
a = [1 0 .6127];     % denominator coefficients
Hbs = freqz(b,a,w);  % transfer function in terms of z

% plot magnitude response of Hbs(z)
subplot(221)
plot(w,abs(Hbs));
xlabel('Frequency (rads)');
ylabel('Magnitude Response |Hbs(z)|');
grid on;
% plot frequency response of Hbs(z)
subplot(222)
plot(w,angle(Hbs));
xlabel('Frequency Response (rads)');
ylabel('Phase of Hbs(z)');
grid on;

% Now, find frequency respinse of Hbsnew(z), a scaled version of
% Hbs(z). More specifically, Hnew(z) = Hbs(z^2). Notches should now occur
% at pi/4 and 3pi/4
bnew = [.8064 0 0 0 .8064]; % new numerator
anew = [1 0 0 0 .6127];     % new denominator
Hnew = freqz(bnew,anew,w);  % transfer function in terms of z

% plot magnitude response
subplot(223)
plot(w,abs(Hnew));
xlabel('Frequency (rads)');
ylabel('Magnitude Response |Hnew(z)|');
grid on;
% plot frequency response
subplot(224)
plot(w,angle(Hnew));
xlabel('Frequency Response');
ylabel('Phase of Hnew(z)');
grid on;
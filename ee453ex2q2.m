% Adam Dykhouse
% EE453 Exam 2 Take Home Problem 4e
% Design Arbitrary Magnitude FIR Filter
Fs = 16000;             % SAmpling Frequency
N = 250;                % Filter Order

% Part A: Design using firpm() function
F = [0 1000 1200 3300 3500 4500 4700 8000]*2/Fs; % Smaller Band 2
A = [1 1 0 0 1 1 0 0];  % Desired Amplitude Response at frequency points     
B = firpm(N,F,A);       % Calculate filter coefficients
figure(1),freqz(B,1);   % Plot Frequency Response
title('Design using firpm() (Smaller Band 2)');

% Part B: Design using firpm() function and adjusted frequency cutoff pts
F = [0 1000 1200 3100 3500 4500 4900 8000]*2/Fs; % Larger Band 2
B = firpm(N,F,A);       % Calculate filter coefficients
figure(2), freqz(B,1);  % Plot Frequency Response
title('Design using firpm() (Larger Band 2)');

% Part C: Design using fir2() (Frequency sampling method)
B = fir2(N,F,A);        % Calculate filter coefficients 
figure(3), freqz(B,1);  % Plot Response
title('Design using fir2()');

% Part D: Design using fir1()
F = [1000 3500 4500]*2/Fs;     % Band Edge Frequencies (normalized)
B = fir1(N,F,'DC-1');          % Calculate the filter coefficients
figure(4),freqz(B,1);          % Plot Response
title('Design using fir1()');
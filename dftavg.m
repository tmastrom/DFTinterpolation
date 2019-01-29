% 459 lab 1 Part 1-2
% apply DFT averaging 
% partition input signal into L subsets

load xn                 % load signal xn
x = xn(1:1792);         % make signal an even length

K = 128;                % length of each subset
L = 14;                 % number of subsets 

xm = reshape(x, 14, 128);   % create K x L matrix 

xk = 1;                % initialize a variable to store the dft sequence

for i = 1:K-1
    d = xm(:,i );       % ith row of matrix xm
    j = abs(fft(d));    % abs of fft sequence of ith row
    xk = xk + j;        % running total of fft rows
end

avg = xk/L;             % arithmetic average of the L sets of DFT sequences

f = linspace(0, 128/2,8);   % frequency vector
avg_sub = avg(1:L/2+1);

plot(f,avg_sub)         
title('DFT Averaging');
grid 
xlabel('frequency (Hz)')
ylabel('Magnitude')
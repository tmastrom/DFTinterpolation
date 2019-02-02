% 459 lab 1 Part 1
% construct different length subsets of noise corrupted signal 
% Apply DFT and observe the magnitude 

% dft function input parameters: 
% N = subset length
function [A] = dft(N) 

load xn                 % noise corrupted signal 

fs = 128;                % sampling frequency 
s = xn(1:N);            % length N subset of xn

x1 = abs(fft(s));       % magnitude of dft of the signal
x = x1(1:N/2+1);        % only need first half because a real valued signal

f = linspace(0, fs/2,N/2+1);    % frequency vector from 0:fs/2

plot(f,x)               % DFT magnitude plot
title(N);
grid 
xlabel('frequency (Hz)')
ylabel('Magnitude')


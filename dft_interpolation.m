% 459 lab 1 Part 2
% apply DFT-based interpolation
% zero insertion in frequency domain

load handel

N = 20000;
x = y(1:N);
x2 = x(1:2:N);      % produces a sequence with even length
x3 = x(1:3:N);      % produces a sequence with odd length
x4 = x(1:4:N);      % produces another sequence with even length 

% 
% Perfom the interpolation on the x2 sequence created above
%

K = 1;              % insert K zeros between each sequence value
p = length(x2);     % length of the sequence
p2 = p/2;

X2 = fft(x2);       % obtain the DFT sequence

% insert K zeros between each sequence value 
% apply equation 1.7b because the sequence is even length 
Xe = [X2(1:p2); X2(p2+1)/2; zeros(K*p-1, 1); X2(p2+1)/2; X2((p2+2):p)];


xe = ifft(Xe)*(K+1); % convert signal to time domain using IDFT 

plot(x(1:50),'k');
title('X2')
hold on;
plot(xe(1:50),'--k');
legend('original','interpolated')
xlabel('frequency (Hz)')
ylabel('amplitude')

% find the difference between the original and interpolated sequence
% compute the 2-norm (vector magnitude) 
norm2 = norm(x-xe)  % returns the norm to the console

%
% Perfom the interpolation on the x3 sequence created above
%

K3 = 2;
X3 = fft(x3);
m = length(x3);
m1 = (m+1)/2;

% insert K zeros between each sequence value 
% apply equation 1.7a because the sequence is odd length 
Xe3 = [X3(1:m1); zeros(K3*m, 1); X3((m1+1):m)];

xe3 = ifft(Xe3)*(K3+1);

figure 
plot(x(1:50),'k');
title('X3')
hold on;
plot(xe3(1:50),'--k');
legend('original','interpolated')
xlabel('frequency (Hz)')
ylabel('amplitude')

x(numel(xe3)) = 0;

norm3 = norm(x-xe3)

%
% Perfom the interpolation on the x4 sequence created above
%

K4 = 3;
q = length(x4);
q2 = q/2;

X4 = fft(x4);

Xe4 = [X4(1:q2); X4(q2+1)/2; zeros(K4*q-1, 1); X4(q2+1)/2; X4((q2+2):q)];

xe4 = ifft(Xe4)*(K4+1);

figure 
plot(x(1:50),'k');
title('X4')
hold on;
plot(xe4(1:50),'--k');
legend('original','interpolated')
xlabel('frequency (Hz)')
ylabel('amplitude')

xe4(numel(x)) = 0;

norm4 = norm(x-xe4)








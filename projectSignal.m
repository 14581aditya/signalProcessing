%Aditya Mishra 1001663720
clc
clear all
close all

[y,Fs] = audioread('noisyaudio.wav');%reading audio file
N = length(y);
figure(1), plot(y, 'black' );%This graph is just for reference.

%Part 1
%a DFT vs Frequency
X1 = fft(y, Fs);
f = linspace(-Fs/2, Fs/2 - Fs/N, N);%finding linspaces.
figure(2), plot(abs(X1), 'm'), axis([0 Fs 0 150]), title('Magnitude of X1[k]'); %This graph is just for reference
X2 = fftshift(X1).^2/Fs;
figure(3), plot(fix(-Fs/2):fix(Fs/2), abs(X2), 'b' ), title('magnitude (abs) of the DFT vs frequency'), xlabel('Frequency (Hz)'), ylabel('Magnitude of DFT');%part1d

%b Log plot
X2log = 20 .* log10(X2);
figure(4), plot(fix(-Fs/2):fix(Fs/2), X2log, 'b'), title('normalized log plot of the DFT,'), xlabel('Frequency (Hz)'), ylabel('Magnitude of DFT (db)');%part1e

%Part 2
Os = 1.571;
Op = 1.257;
Ks = 31887;
Kp = 0.26;
n = ceil(1/20.*(log(Ks/Kp)/log(Os/Op)));
Fc = Op/(Kp .^ (1/(2 * n)));
H = 20.*log10(sqrt(1./(1+(f/Fc).^(2.*n))));
figure(5), plot(f, H), title('logarithmic gain of the frequency respons'),  xlabel('Frequency (Hz)'), ylabel('Magnitude of DFT (db)');

%Part 3.
Wn = 2070/(Fs/2);
[b, a] = butter(21, Wn);
butter_filter = filter(b,a,y);
X3 = fft(butter_filter, Fs);
X3_shifted = fftshift(X3).^2/Fs;
figure(6), plot(fix(-Fs/2):fix(Fs/2), abs(X3_shifted), 'b' ), title('magnitude (abs) of the DFT vs frequency'), xlabel('Frequency (Hz)'), ylabel('Magnitude of DFT');%part 3c

%please remove the % sign and hear it seperately
%sound(y); part 3e
%sound(butter_filter); part 3e
audiowrite('filterdaudio.wav',butter_filter,Fs); %3f





%Signal Analyzer
%Brian McRee
%9/30/2013
%The following code is open-source and is published on GitHub under the
%   user "LegallyKF5RCL", LegallyKF5RCL/MatlabProject1

clc;
clear all;

%Variables
Fs = 8129;
WavFile = 'chirp.wav';

%get input
[InputData] = wavread(WavFile);

%find/calculate important parameters
WavLength = length(InputData);      %amount of data samples
FreqDomain = zeros([WavLength,1]);           %create array for frequancy domain

for i = 1:WavLength                                     %add in the proper frequency values
    FreqDomain(i) = ((i - 1)/(WavLength - 1)) * Fs;     %equation given in the assignment pdf
end



%play the data from the .wav file
wavplay(InputData,Fs);

%perform a fourier transform on the data
FTransform = fft(InputData);

%plot(FreqDomain, FTransform);
FTCentered = fftshift(FTransform);
plot((FreqDomain * 2) - Fs, FTCentered);
figure;

%find the magnitudes and phase angles of the fourier transform
Magnitude = abs(FTransform);    
Phase = angle(FTransform);

%save the data
save('ChirpFT.txt', 'Magnitude', 'Phase', 'FreqDomain', '-ascii');

%plot the original signal in the time domain
WavTime = (WavLength-1)/Fs;
Time = 0:1/Fs:WavTime;
plot(Time, InputData);

disp('End of Script: SignalProcessor');   %display to user that processing is finished


%{  
    FUNCTION RESEARCH (hooray for F1)

    FFT
        y = fft(u,M)
        //where u = to the thing you want to transform

    FFTSHIFT
        Y = fftshift(X)
        //this function centers 

    INPUT
        evalResponse = input(prompt)
        //acquire user input

    SUBPLOT
        subplot(m,n,p)
        //creates axes in tiled positions

    WAVREAD
        y = wavread(filename)
        //reads a wav file

    WAVWRITE
        wavwrite(y,filename)
        //writes data stored in y to a wave file named filename

    WAVPLAY
        wavplay(y,Fs)
        //plays audio signal stored in vector y
        //Fs is the sample rate in HZ

    SAVE
        save(filename, variables, ..., format)
        //save workspace variables to a file

    LOAD
        S = load(filename,'-ascii')
        //forces load to treat the file as an ASCII file, regardless of the extension

    LINSPACE
        y = linspace(a,b,n)
        //y = linspace(a,b,n) generates a row vector y of n points linearly spaced between and including a and b. For n < 2, linspace returns b.
%}
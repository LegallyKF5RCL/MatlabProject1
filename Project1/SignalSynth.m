%Signal Synthesizer
%Brian McRee
%9/30/2013
%The following code is open-source and is published on GitHub under the
%   user "LegallyKF5RCL", LegallyKF5RCL/MatlabProject1

clc;
clear all;

Fs = 8129;                              %sampling frequency
InputData = load('ChirpFT.txt');        %data loaded from the file

%find length of data
WavLength = length(InputData)/3;

%separate the data types
MagData = InputData(1:WavLength,1);
PhaData = InputData((WavLength + 1):(2 * WavLength),1);
FreqDomain = InputData((WavLength * 2 + 1):(WavLength * 3),1);

%create zero matricies to cut down on execution time
PartSignal = zeros([WavLength,WavLength]);
TotalSignal = zeros([1,WavLength]);

%establish time parameters
WavTime = ((WavLength-1)/Fs);
Time = 0:(1/Fs):WavTime;

for k = 1:WavLength
    for n = 1:WavLength
        PartSignal(k,n) = MagData(k) * sin((FreqDomain(k) * 2 * pi * Time(n)) + PhaData(k));
    end
end

for m = 1:WavLength
   TotalSignal = TotalSignal + PartSignal(m,1:WavLength); 
end
    
wavwrite(TotalSignal, 'SynthChirp.wav');
wavplay(TotalSignal, Fs);

%plot the original signal in the time domain
plot(Time, TotalSignal(1,1:WavLength));



disp('End of Script: SignalSynth');   %display to user that processing is finished











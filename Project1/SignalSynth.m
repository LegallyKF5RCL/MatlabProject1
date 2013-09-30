%

clc;
clear all;

Fs = 8129;                              %sampling frequency
InputData = load('ChirpFT.txt');        %data loaded from the file
WavTime = (length(InputData)-1)/Fs;     %finds the length in time that the wav file is/was
Time = 0:1/Fs:WavTime;

%plot(Time, InputData);     &test plot

Magnitude = abs(InputData);
%plot(Time, Magnitude);
Phase = angle(InputData);
%plot(Time, Phase);

Signal = 0;

for n = 1:13129
    Signal = Signal + (Magnitude(n) * sin((Fs * 2 * pi * Time) + Phase(n)));
end
    
%wavwrite(InputData, 'SynthChirp.wav');
%wavplay(Signal, Fs);











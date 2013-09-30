%

clc;
clear all;

Fs = 8129;                              %sampling frequency
InputData = load('ChirpFT.txt');        %data loaded from the file
WavLength = length(InputData);
WavTime = (WavLength-1)/Fs;     %finds the length in time that the wav file is/was
Time = 0:1/Fs:WavTime;

%plot(Time, InputData);     &test plot

Magnitude = abs(InputData(1:WavLength/2));
%plot(Time, Magnitude);     %test plot
Phase = angle(InputData(WavLength/2 + 1:WavLength));
%plot(Time, Phase);         %test plot

Signal = 0;         %initialize Signal

for n = 1:WavLength/2
    Signal = Signal + (Magnitude(n) * sin((Fs * 2 * pi * Time) + Phase(n)));
end
    
wavwrite(Signal, 'SynthChirp.wav');
%wavplay(Signal, Fs);

disp('End of Script: SignalSynth');   %display to user that processing is finished











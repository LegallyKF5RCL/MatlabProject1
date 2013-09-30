clc;
clear all;

Fs = 1000;

A = 5;
f = 50;
phase = 0;

t = 0:1/Fs:1;

x=A*cos(2*pi*f*t + phase);

plot(t,x);
%figure;

FT_x = fft(x);

correct_FT_x = fftshift(FT_x);

%plot(FT_x, length(FT_x));
%figure;
%FT_x(2)        %this is indexing the array

mag = abs(FT_x);
ph = angle(FT_x);

FF = Fs/2 * linspace(0,1,Fs+1);

%plot(FF,mag);
%figure;
%plot(f,ph);























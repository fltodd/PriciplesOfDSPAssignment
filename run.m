%load('dsp_lab1_dat.mat');

M = 2^12;

Fs = 44100;
length = 2;
freq = 500;

disp(length*Fs/M);

dBmin = -60;
fMax = 1500;

signal = sin(linspace(0, 2*pi*freq*length, Fs*length)) + sin(linspace(0, 2*pi*freq*length*2, Fs*length));

rect = ones(1, M);
hannW = window(@hann, M);

%plot the example of spectral leakage & compare to hann window

%plot the effects of window size -> increased frequency resolution with
%both windows and decreased temporal resolution
%number of possible freq components proportional to the frameSize

%plot the effects of overlap -> temporal resolution, whilst allowing freq.
%resolution of lower window sizes -> may need a better example

t = linspace(0, length, Fs*length);

freq1 = 500;
freq2 = 1000;
f = linspace(freq1, freq2, length*Fs);
risingSine = sin(2*pi*cumsum(f)/Fs);
vcoSine = vco(sin(2*pi*0:1/Fs:length), [freq1 freq2], Fs);


figure
spect = spectrogramPSD(risingSine, Fs, hannW, fMax, dBmin, 0);

figure
spectrogramPSD(vcoSine, Fs, hannW, fMax, dBmin, 0.5);

figure
spectrogramPSD(vcoSine, Fs, hannW, fMax, dBmin, 0);

%if overlap too large -> unwanted freq. from prev/next segment ->
%incacurate time-domain representation




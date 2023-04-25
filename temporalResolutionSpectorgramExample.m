clearvars;

fs = 44100;
freq = 1000;
lengthSeconds = 0.2;
windowSize = 1024;

baseSine = sin(linspace(0, 2*pi*freq*lengthSeconds, fs*lengthSeconds));
harmSine = sin(linspace(0, 2*pi*2*freq*lengthSeconds*0.5, fs*lengthSeconds*0.5));
padding = zeros(1, (length(baseSine)-length(harmSine))/2 + 1);
signal = baseSine + cat(2, padding, harmSine, padding(1:length(padding)-2));

window = hannWindow(windowSize, windowSize);

figure
spectrogramPSD(signal, fs, window, freq*3, -60, 0, yScale='lin');

figure
spectrogramPSD(signal, fs, window, freq*3, -60, 0.5, yScale='lin');

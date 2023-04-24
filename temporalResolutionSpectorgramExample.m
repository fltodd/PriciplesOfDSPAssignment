fs = 44100;
freq = 100;
lengthSeconds = 2;

baseSine = sin(linspace(0, 2*pi*freq*lengthSeconds, fs*lengthSeconds));
harmSine = sin(linspace(0, 2*pi*2*freq*lengthSeconds*0.5, fs*lengthSeconds*0.5));
padding = zeros(1, (length(baseSine)-length(harmSine))/2 + 1);
signal = baseSine + cat(2, padding, harmSine, padding(1:length(padding)-2));

figure
spectrogramPSD(signal, fs, ones(1, 2048), freq*3, -80, 0, yScale='log');
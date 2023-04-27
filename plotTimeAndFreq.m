function plotTimeAndFreq(signal, timeIndex, fs, padding, varargin)

if length(signal) ~= length(timeIndex)
   error('signal and timeIndex arrays must be the same length'); 
end

%plot time domain representation
subplot(2, 1, 1)
stem(timeIndex, signal);
title('Time Domain');
xlabel('Sample');
ylabel('Amplitude');
axis tight
grid on

%get frequency domain centered around 0
signalFFT = fftshift(fft(signal, padding));

%create frequency axis
freqIndex = linspace(-fs/2, fs/2, length(signalFFT));

%convert to db then normalise (max = 0db)
db = 20*log10(abs(signalFFT));
db = db - max(db);

%plot frequency representation
subplot(2, 1, 2);
plot(freqIndex, db);
title('Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
axis tight
grid on

%parse optional input variable & change axis
p = inputParser;
addOptional(p, 'yAxisRange', NaN);
parse(p, varargin{:});
if ~isnan(p.Results.yAxisRange)
    axis(cat(2,[-fs/2 fs/2], p.Results.yAxisRange));
end
end


function plotTimeAndFreq(signal, timeIndex, fs, padding, varargin)

if length(signal) ~= length(timeIndex)
   error('signal and timeIndex arrays must be the same length'); 
end

subplot(2, 1, 1)
stem(timeIndex, signal);
title('Time Domain');
xlabel('Sample');
ylabel('Amplitude');
axis tight
grid on

signalFFT = fftshift(fft(signal, padding));
freqIndex = linspace(-fs/2, fs/2, length(signalFFT));

p = inputParser;
addOptional(p, 'yAxisRange', NaN);
parse(p, varargin{:});

subplot(2, 1, 2);
plot(freqIndex, 20*log10(abs(signalFFT)));
title('Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
axis tight
grid on
if ~isnan(p.Results.yAxisRange)
    axis(cat(2,[-fs/2 fs/2], p.Results.yAxisRange));
end


end


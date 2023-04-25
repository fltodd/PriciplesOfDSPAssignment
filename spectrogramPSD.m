function [spect] = spectrogramPSD(data, fs, window, fMax, dbmin, overlap, varargin)
%SPECTROGRAM Creates a spectrogram of a given 1d array up to fMax.
%   Inputs:
%       data: 1D array of data to be analyzed
%       fs: sampling frequency of data in Hz
%       window: analysis window (e.g. Hann window)
%       fMax: maximum frequency to display in Hz
%       dbmin: minimum dB value to display relative to the magitude of the
%       signal
%       overlap: overlap fraction between consecutive frames (0-1)
%       varargin: optional name-value pair arguments
%           yScale: 'log' for a logarithmic y-axis, 'lin' for a linear y-axis
%           colormap: color map of the spectrogram
%
%   Outputs:
%       spect: 2D array representing the spectrogram of the data (freq x
%       time)

%get frameSize from window, ensuring it is 1D rotated correctly
[h, w] = size(window);
if h == 1
    frameSize = w;
elseif w == 1
    frameSize = h;
    window = window';
else
    error('Window must be a one-dimensional array');
end

%ensure that the signal is longer than the window
Nin = length(data);
if Nin < frameSize
    error('Signal must be longer than the window');
end

%calculate stepSize from overlap
if overlap >= 0 && overlap < 1
    stepSize = round(frameSize * (1 - overlap));
else
    error('Overlap must be a value between 0 and 1');
end

NFrames = floor((Nin-frameSize)/stepSize);

spect = zeros(frameSize/2, NFrames);
t = linspace(0, Nin/fs, NFrames);
f = linspace(0, fs/2, frameSize/2);

for n = 1:NFrames
    %isolate frame and apply window
    frame = window.*data(((n-1)*stepSize+1):(n-1)*stepSize+frameSize);
    
    %take fourier transform of the frame
    frameFFT = fft(frame);
    
    %Convert to power spectral density in dB
    framePSD = 20*log10(abs(frameFFT.*frameFFT)/frameSize);
    
    %insert frame into full spectrogram
    spect(:, n) = framePSD(1:frameSize/2);
end

%format the data so that its is easier to view
spect = spect - max(spect); %set 0db as maximum
spect(spect<dbmin) = dbmin; %set anything lower that dBmin to dBmin

%parse optional graphing inputs
p = inputParser;
addOptional(p, 'yScale', 'lin'); %default is 'lin'
addOptional(p, 'colormap', 'jet'); %default is 'jet'
parse(p, varargin{:});

%plot graph
surf(t, f, spect) %3D plot
view(0,90) %rotate to view as 2d
shading interp %enable smooth shading

%format axis
xlabel('Time / Seconds')
ylabel('Frequency / Hertz')
axis([0 max(t) 0 fMax]);
set(gca,'YScale', p.Results.yScale);

%set colour bar
colormap(p.Results.colormap);
c = colorbar;
ylabel(c, 'Magnitude/dB')

%add info
subtitle("f_s: " + num2str(fs) + blanks(5) +... 
    "Window Size: " + num2str(frameSize) + blanks(5) +...
    "Overlap: " + num2str(overlap*100) + "%");
end


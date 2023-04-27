function [window] = zeroCenteredHann(numSamples,N)
%ZEROCENTEREDRECT This function generates a zero-centered Hann window of a 
%given window length and number of samples.
%   Inputs:
%       numSamples: total number of samples
%       N: number of samples in Hann Window
%   Outputs:
%       window: zero-centered Hann window

%Calculate Hann window
hann = 0.5- 0.5*cos((0:N-1)*2*pi/N);

%pad sides so that it is centered
padding = zeros(1, floor((numSamples-N)/2));
window = cat(2, padding, hann, padding);
end
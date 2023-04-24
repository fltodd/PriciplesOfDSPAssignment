function [window] = zeroCenteredHann(numSamples,windowLength)
%ZEROCENTEREDRECT Summary of this function goes here
%   Detailed explanation goes here
padding = zeros(1, (numSamples-windowLength)/2);
hann = sin((0:windowLength-1)*pi/windowLength).^2;
window = cat(2, padding, hann, padding);
end


function [window] = hannWindow(numSamples, windowLength)
%HANNWINDOW Summary of this function goes here
%   Detailed explanation goes here
if numSamples < windowLength
   error('numSamples must be larger or equal to than windowLength'); 
end

window = cat(2, sin((0:windowLength-1)*pi/windowLength).^2, zeros(1, numSamples-windowLength));
end


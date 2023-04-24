function [window] = rectangularWindow(numSamples, windowLength)
%RECTWINDOW Summary of this function goes here
%   Detailed explanation goes here
if numSamples < windowLength
   error('numSamples must be larger or equal to than windowLength'); 
end

window = cat(2, ones(1, windowLength), zeros(1, numSamples-windowLength));
end


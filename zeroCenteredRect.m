function [window] = zeroCenteredRect(numSamples,windowLength)
%ZEROCENTEREDRECT Summary of this function goes here
%   Detailed explanation goes here
padding = zeros(1, (numSamples-windowLength)/2);
rect = ones(1, windowLength);
window = cat(2, padding, rect, padding);
end


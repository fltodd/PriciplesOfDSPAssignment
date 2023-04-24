windowLength = 29;
seqLength = 51;
fs = 200;

%timeIndex = linspace(-seqLength/2, seqLength/2, seqLength);
timeIndex = (0:seqLength-1) - floor(seqLength/2);
rectWindow = zeroCenteredRect(seqLength, windowLength);
hannWindow = zeroCenteredHann(seqLength, windowLength);

yAxisRange = [-80 30];

figure
sgtitle(['Rectangular Window: ', '\fontsize{9}Window Length: ' num2str(windowLength), ' , Sequence Length: ', num2str(seqLength)]);
plotTimeAndFreq(rectWindow, timeIndex, fs, 100000, yAxisRange=yAxisRange);
saveas(gca, './exports/rectangularWindow.png');

figure
sgtitle(['Hann Window: ', '\fontsize{9}Window Length: ' num2str(windowLength), ' , Sequence Length: ', num2str(seqLength)]);
plotTimeAndFreq(hannWindow, timeIndex, fs, 100000, yAxisRange=yAxisRange);
saveas(gca, './exports/hannWindow.png');



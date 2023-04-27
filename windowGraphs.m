clearvars;

%initialize variables
N = 29; %window length
len = 51; %sequence length
fs = 44100;
padding = 1024;
yAxisRange = [-80 0];
infoString = ['\fontsize{9}Window Length: ', num2str(N), ' , Sequence Length: ', num2str(len), ', F_s: ', num2str(fs)];
timeIndex = (0:len-1) - floor(len/2);
rectWindow = zeroCenteredRect(len, N);
hannWindow = zeroCenteredHann(len, N);

%plot & export Rectangular Window
figure
sgtitle(['Rectangular Window: ', infoString]);
plotTimeAndFreq(rectWindow, timeIndex, fs, padding, yAxisRange=yAxisRange);
saveas(gca, './exports/rectWindow.png');

%plot & export Hann Window
figure
sgtitle(['Hann Window: ', infoString]);
plotTimeAndFreq(hannWindow, timeIndex, fs, padding, yAxisRange=yAxisRange);
saveas(gca, './exports/hannWindow.png');
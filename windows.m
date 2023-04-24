len = 1024;

hann = window(@hann, len);
hannFFT = fft(hann);
hannAbsFFT = abs(hannFFT(1:len/2));


rect = ones(len, 1);
rectFFT = fft(rect);
rectAbsFFT = abs(rectFFT(1:len/2));

figure

plot(hann);
title('Time Domain Representation');
hold on

plot(rect);

hold off

figure

plot(hannAbsFFT)
title('Freq. Domain Representation');
hold on

plot(rectAbsFFT)

hold off
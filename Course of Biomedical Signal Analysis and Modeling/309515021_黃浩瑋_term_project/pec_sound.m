% Program to display PCG, ECG and CAROTID data and play the PCG
% sampling rate fs = 1000 Hz per channel
clc
close all
clear all

% loading ascii file into an array
% give signal file number here as required
sig = load('pec42.dat');

% Separating pcg, ecg, and carotid signals
pcg = sig(:,1);
ecg = sig(:,2);
carotid = sig(:,3);
fs = 1000;
fc = 40;%截止頻率


%去頭去尾 第一題
pcg(1:1000)=[];
pcg(end-1000:end) = [];
ecg(1:1000)=[];
ecg(end-1000:end) = [];
carotid(1:1000)=[];
carotid(end-1000:end) = [];
time = [1:length(pcg)]/fs;

%第二題 先過濾波再降頻
[B,A] = butter(4,fc/(fs/2),'low'); 
ecg2 = filtfilt(B,A,ecg);
newecg = downsample(ecg2,5); % 將取樣頻率降低到200Hz
newfs = 200;
newtime = (1:length(newecg))/newfs; %新的取樣時間
[pks,locs,delay]=pan_tompkin(newecg,newfs,1);%找到QRS的鋒值

%第三題 取S1後300-350ms由第二題的S1位置開始運算取區間
temp = [];
for i = 1:length(locs)
    temp = [temp pcg(locs(i):locs(i)+324)];
end
cycle1 = temp(1:end,1);
temp2 = [];
for i = 1:size(temp,2) %計算每個的PSD
    N = length(temp(:,i));
    xdft = fft(temp(:,i));
    xdft = xdft(1:N/2+1);
    psdx = (1/(fs*N)) * abs(xdft).^2;
    psdx(2:end-1) = 2*psdx(2:end-1);
    freq = 0:fs/length(temp(:,i)):fs/2;
    temp2 = [temp2 psdx];
end
avgcycle2 = sum(temp2,2)/size(temp2,2);%平均PSD
figure;%第三題的圖
subplot(2,1,1)
plot(freq,10*log10(temp2(:,1)))
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title('PSD of the 1st segment')
subplot(2,1,2)
plot(freq,10*log10(avgcycle2))
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title('Averaged of PSD')
figure;%第二題的圖
subplot(2,1,1);
plot(time', pcg);
ylabel('PCG')
axis tight;
hold on
for i = 1:length(locs)
    plot(locs(i)/200,0,'r*') %劃出R值的相對位置在PCG signal上
    hold on
end
subplot(2,1,2);
plot(newtime', newecg);
ylabel('ECG')
axis tight;
hold on
for i = 1:length(locs)
    plot(locs(i)/200,pks(i),'o')
    hold on
end
%第四題 median frequency of PSD
figure('outerposition',get(0,'screensize'));
medfreq(avgcycle2,freq);
saveas(gcf,'pec43_medfreq','png');


% Some of the datafiles have artifacts at the beginning and/or ending 
% of the recording session: delete such portions in your program.
% A loud and strange sound could affect your perception of the 
% immediately following sounds.
pcgx = pcg(4000:16000);
pcgs = interp(pcgx, 8); %第五題
pcgs = pcgs - mean(pcgs);
pcgs = pcgs / max(pcgs);

figure;
plot(pcgs);
axis tight;
sound(pcgs, 8000);

% if the "sound" command in MATLAB does not work in the lab
% try the following:
filename = 'pec52.wav';
audiowrite(filename,pcgs,8000);
% listen to pcg52.au using xmms or any other audio tool available


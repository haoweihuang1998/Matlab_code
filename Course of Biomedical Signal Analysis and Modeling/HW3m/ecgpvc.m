
% MATLAB PROGRAM ecgpvc.m
clear all
close all
ecg = load ('ecgpvc.dat');
load('ecgpvcs.mat');
%plot 10 strips per figure, each strip with 2,000 samples = 10 seconds
%the total signal duration is 50,000 samples (250 seconds)  
%sampling rate fs = 200 Hz
figure;
slen = length(ecg); 
fs = 200;
t= [1:slen]/fs;


[qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(ecg,fs,1);
PT = qrs_i_raw;
newPT = [];
for i = 1 : length(PT)-1
    newPT = [newPT PT(i+1)-PT(i)]; %計算RR Values 
end
RR_AVG = mean(newPT); 

[qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(ecg,fs,1);
PT = qrs_i_raw;
FFAVG = [];
for i = 1 : length(PT)-1
    RR_RMS = rms(ecg(PT(i):PT(i+1)));
    RR_AVG = mean(ecg(PT(i):PT(i+1))); %第二題 RR AVG
    FF = RR_RMS/RR_AVG; % 第二題 FF
    FFAVG = [FFAVG FF];
end
FF_AVG = mean(FFAVG);



RR_RMS3 = rms(ecg(14752:14832));
RR_AVG3 = mean(ecg(14752:14832)); 
 FF = RR_RMS3/RR_AVG3;
[qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(ecg1,fs,1);
PT1 = qrs_i_raw;
newPT1 = [];
for i = 1 : length(PT1)-1
    newPT1 = [newPT1 PT1(i+1)-PT1(i)]; %計算RR Values 
end
RR_RMS1 = rms(newPT1);
RR_AVG1 = mean(newPT1); %第四題ECG1 RR AVG
FF1 = RR_RMS1/RR_AVG1; % 第四題ECG1 FF

[qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(ecg2,fs,1);
PT2 = qrs_i_raw;
newPT2 = [];
for i = 1 : length(PT2)-1
    newPT2 = [newPT2 PT2(i+1)-PT2(i)]; %計算RR Values 
end
RR_RMS2 = rms(newPT2);
RR_AVG2 = mean(newPT2); %第四題ECG2 RR AVG
FF2 = RR_RMS2/RR_AVG2; % 第四題ECG2 FF





% i=1;
% for k=1:10
% subplot(10,1,k);
% plot(ecg(i:i+1999));
% ecgfindpeak=pan_tompkin(ecg(i:i+1999),fs,1);
% axis tight;
% box off;
% axis off;
% i=i+2000;
% end;
% 
% figure;
% for k=1:10 
% subplot(10,1,k);
% plot(ecg(i:i+1999));
% axis tight; 
% box off; 
% axis off;
% i=i+2000;
% end;
% 
% figure;
% for k=1:5 
% subplot(10,1,k);
% plot(ecg(i:i+1999));
% axis tight; 
% box off; 
% axis off;
% i=i+2000;
% end;




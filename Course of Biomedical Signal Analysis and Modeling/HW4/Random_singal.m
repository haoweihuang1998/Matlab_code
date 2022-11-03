t = linspace(0,1,500)'; %隨機兩訊號
y1 = cos(4*pi*t);       %弦波
y2 = rand(size(t));     %像noise的訊號

y1 = (y1-mean(y1))/std(y1);  %
y2 = (y2-mean(y2))/std(y2);

% figure(1)
% clf
% subplot(2,1,1)
% nexttile
% plot(t,y1)
% title('Plot 1')
% 
% % Bottom plot
% nexttile
% plot(t,y2)
% title('Plot 2')

% %subplot(2,1,2)
% plot(y1,y2,'.');
% axis equal
% axis tight

A = 3*rand(2,2); %矩陣A

X = [y1,y2]*A; % X=As

figure
clf
subplot(2,1,1)
plot(X)
subplot(2,1,2)
plot(X(:,1),X(:,2),'.')
axis equal
axis tight
[coeff,latent,explained] = pcacov(X)



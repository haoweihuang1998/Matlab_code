X=imread('C:\Users\V13\Documents\MATLAB\Image\61.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
hnorm=imhist(X)./numel(X);  %正規畫直方圖
cdf=cumsum(hnorm);
x=linspace(0,1,256);
plot(x,cdf)
axis([0 1 0 1]);
set(gca,'xtick',0:.2:1)
set(gca,'ytick',0:.2:1)
xlabel('Input intensity values','fontsize',9)
ylabel('Output intensity values','fontsize',9)
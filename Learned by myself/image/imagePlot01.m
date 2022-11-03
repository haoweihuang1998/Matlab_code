X=imread('C:\Users\V13\Documents\MATLAB\Image\62.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
hc=imhist(X);
plot(hc,'g')
axis([0 255 0 15000])
set(gca,'xtick',[0:50:255])
set(gca,'ytick',[0:2000:15000])

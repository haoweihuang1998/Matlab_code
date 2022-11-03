X=imread('C:\Users\V13\Documents\MATLAB\Image\61.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
g=gscale(X,'minmax',0,0.787);    %method ¦³'full8','full16','minmax'
imshow(g)
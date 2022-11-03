X=imread('C:\Users\V13\Documents\MATLAB\Image\61.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
imshow(X);
figure,imhist(X)
ylim('auto')
g=histeq(X,256);
figure,imshow(g)
figure,imhist(g)
ylim('auto')
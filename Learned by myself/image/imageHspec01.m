X=imread('C:\Users\V13\Documents\MATLAB\Image\61.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
g=histeq(X,256);

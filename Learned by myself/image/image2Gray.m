X=imread('C:\Users\V13\Documents\MATLAB\Image\62.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
imshow(X)
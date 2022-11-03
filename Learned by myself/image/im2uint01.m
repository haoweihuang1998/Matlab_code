X=imread('C:\Users\V13\Documents\MATLAB\Image\61.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
%g=im2uint8(mat2gray(log(1+double(X))));
g=im2uint8(mat2gray(X));
imshow(g)
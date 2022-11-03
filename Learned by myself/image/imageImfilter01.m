X=imread('C:\Users\V13\Documents\MATLAB\Image\62.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
w=ones(2);
g=imfilter(X,w,'replicate');
imshow(g)
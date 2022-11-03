X=imread('C:\Users\V13\Documents\MATLAB\image\62.png')
if ndims(X)==3%
    X=rgb2gray(X);%
end%
f=padarray(X,[3 2],'replicate','post');
figure,imshow(X)
figure,imshow(f)
X=imread('C:\Users\V13\Documents\MATLAB\Image\21.jpg');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
w=fspecial('laplacian',0)
g1=imfilter(X,w,'replicate');
f2=tofloat(X);
g2=imfilter(f2,w,'replicate');
g=f2-g2;
figure,imshow(X)
figure,imshow(g1,[])
figure,imshow(g2,[])
figure,imshow(g)
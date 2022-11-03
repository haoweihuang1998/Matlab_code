X=imread('C:\Users\V13\Documents\MATLAB\Image\21.jpg');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
g1=adapthisteq(X);
g2=adapthisteq(X,'NumTiles',[25 25]);
g3=adapthisteq(X,'NumTiles',[25 25],'ClipLimit',0.05);
figure(1)
imshow(X);
figure(2)
imshow(g1);
figure(3)
imshow(g2);
figure(4)
imshow(g3);
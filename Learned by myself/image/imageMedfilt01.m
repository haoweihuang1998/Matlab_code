f=imread('C:\Users\V13\Documents\MATLAB\image\4.jpg');
if ndims(f)==3%
    f=rgb2gray(f);%
end%
fn=imnoise(f,'salt & pepper',0.2);
gm=medfilt2(fn);
gms=medfilt2(fn,'symmetric');
imshow(f)
figure,imshow(fn)
figure,imshow(gm)
figure,imshow(gms)
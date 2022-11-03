X=imread('C:\Users\V13\Documents\MATLAB\Image\62.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
w=ones(2)/2
gr=imfilter(X,w,'replicate');
figure,imshow(gr,[])
gs=imfilter(X,w,'symmetric');
figure,imshow(gs,[])
gc=imfilter(X,w,'circular');
figure,imshow(gc,[])
f8=im2uint8(X);
g8r=imfilter(f8,w,'replicate');
figure,imshow(g8r,[])
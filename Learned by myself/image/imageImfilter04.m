f=imread('4.jpg');
w4=fspecial('laplacian',0);
w8=[1 1 1;1 -8 1;1 1 1];
f=tofloat(f);
g4=f-imfilter(f,w4,'replicate');
g8=f-imfilter(f,w8,'replicate');
imshow(f)
figure,imshow(g4)
figure,imshow(g8)
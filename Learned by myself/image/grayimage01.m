X=imread('C:\Users\V13\Documents\MATLAB\Image\61.png');
if ndims(X)==3%
    X=rgb2gray(X);%
end%
%g=imadjust(X,[low_in high_in],[low_out high_out],gammma)
g1=imadjust(X,[0 1],[1 0]);
g2=imadjust(X,[0.5 0.75],[0 1]);
g3=imadjust(X,[],[],2);
g4=imadjust(X,stretchlim(X),[]);
g5=imadjust(X,stretchlim(X),[1 0]);
%subplot(2,2,1),subimage(g1);
%subplot(2,2,2),subimage(g2);
%subplot(2,2,3),subimage(g3);
figure(1);
imshow(g1);
figure(2);
imshow(g2);
figure(3);
imshow(g3);
figure(4);
imshow(g4);
figure(5);
imshow(g5);
clear M					% �M���q�v��Ưx�} M
% imshow(a)
n = 30;% ��� 30 �ӵe��
I=imread('C:\Users\V13\Documents\MATLAB\Image\21.jpg');
save I.mat
load I.mat
image(X);
colormap(map);	
scale = cos(linspace(0, 2*pi, n));
fprintf('����e����...\n');
for i = 1:n
	colormap(((i-1)*(1-map)+(n-i)*map)/(n-1));	% ���ܦ�L�x�}
	M(i) = getframe;			% ����e���A�æs�J�q�v��Ưx�} M  
end
fprintf('����q�v��...\n');
movie(M, -5);					% ����q�v 5 ��
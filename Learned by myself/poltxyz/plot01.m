x = linspace(-2, 0.7, 25);	% �b x �b [-2,2] ������ 25 �I  
y = linspace(-2, 0.8, 25);	% �b y �b [-2,2] ������ 25 �I  
[xx, yy] = meshgrid(x, y);
zz=exp(-xx.^2-yy.^2)*exp(-xx.^2-yy.^2);
mesh(xx,yy,zz)
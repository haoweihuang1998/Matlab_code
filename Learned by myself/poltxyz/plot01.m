x = linspace(-2, 0.7, 25);	% 在 x 軸 [-2,2] 之間取 25 點  
y = linspace(-2, 0.8, 25);	% 在 y 軸 [-2,2] 之間取 25 點  
[xx, yy] = meshgrid(x, y);
zz=exp(-xx.^2-yy.^2)*exp(-xx.^2-yy.^2);
mesh(xx,yy,zz)
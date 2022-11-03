[x, y] = meshgrid(-2:0.1:2);  
z = exp(-0.5*(x.^2)-0.5*(y.^2)); 
mesh(x, y, z); 
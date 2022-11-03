function mu =truncgaussmf(z,a,b,s)
mu=zeros(size(z));

c=a+2*(b-a);
range=(a<=z)&(z<=c);
mu(range)=exp(-(z(range)-b).^2/s^2);
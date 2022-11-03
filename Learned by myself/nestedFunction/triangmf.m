function mu = triangmf(z,a,b,c)
mu = zeros(size(z));

low_side=(a<=z)&(z<b);
high_side=(b<=z)&(z<c);

mu(low_side)=(z(low_side)-a)./(b-a);
mu(high_side)=1-(z(igjt_side)-b)./(c-b);
end
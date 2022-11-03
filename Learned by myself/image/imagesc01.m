temp=colormap(gray);
newMap=temp(1:6:end,:);
X=peaks;
colormap(newMap);
imagesc(X);
colorbar;
min(min(X))
max(max(X))
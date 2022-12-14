z = [0 2 1; 3 2 4; 4 4 4; 7 6 8];
mesh(z);
xlabel('X 軸 = column index');	% X 軸的說明文字
ylabel('Y 軸 = row index');	% Y 軸的說明文字
for i=1:size(z,1)
	for j=1:size(z,2)
		h=text(j, i, z(i,j), num2str(z(i, j)));		% 標示曲面高度
		set(h, 'hori', 'center', 'vertical', 'bottom', 'color', 'r');	% 改變位置及顏色
	end
end
%colormap(zeros(1,3));		% 以黑色呈現

clear
path=['C:/Users/V13/Documents/MATLAB/fly_test/fly47_FM_50_50000_1000.jpg'];

% outpath=['/Volumes/Transcend/data/Processedfly/20180828'];
% mkdir(outpath)

aa=dir(path);

   
 ffname={aa.name};
 icount=0;
 first=imread([path ffname{4}]);
% 
% x=[x(1),x(1), x(1)+width,x(1)+width, x(1)];
% y=[y(1), y(1)-height,y(1)-height,y(1),y(1)];
% 
% plot(x,y,'r','LineWidth',2)
% 
% close all
% clear first
% [row col z]=size(first);
for ii=4:length(ffname)-1
    
  a=(imread([path ffname{4}]));
b=(imread([path ffname{ii}]));
k=(imread([path ffname{ii+1}]));

c{ii-3}=(b-a);
nc{ii-3}=c{ii-3}(:,:,1)+c{ii-3}(:,:,2)+c{ii-3}(:,:,3);

d{ii-3}=(b-k);
nd{ii-3}=d{ii-3}(:,:,1)+d{ii-3}(:,:,2)+d{ii-3}(:,:,3);

% image(c{ii-3});


%plot(x,y,'r','LineWidth',2)

% newfilename=[outpath '/test-first-' int2str(ii-3)];
% saveas(gca,newfilename ,'bmp');
% image(d{ii-3});
% 
% newfilename=[outpath '/test-previous-' int2str(ii-3)];
% saveas(gca,newfilename ,'bmp');
% hold off;
% close (gcf);
end
width=400;
height=400;
 imshow(nc{1021});
 
 [x y]=ginput(1);
 
 test=imcrop(nc{1021},[x(1) y(1) width height]);
 imshow (test)
 close all;
 [row col]=size(test);
 

for ii=1:length(nc)
subdiff_first{ii}=imcrop(nc{ii},[x(1) y(1) width height]);

temp=(subdiff_first{ii});
for n=1:row
for jj=1:col
if(temp(n,jj)<250)
temp(n,jj)=0;
end
end
end

sum_subdiff_first(ii)=sum(sum(temp));
end
for ii=1:length(nd)
subdiff_neigh{ii}=imcrop(nd{ii},[x(1) y(1) width height]);

ttemp=(subdiff_neigh{ii});
for n=1:row
for jj=1:col
if(ttemp(n,jj)<200)
ttemp(n,jj)=0;
end
end
end

sum_subdiff_neigh(ii)=sum(sum(ttemp));
end

% imshow(c{1021})
% [nx ny]=ginput(1);
% nx=[nx(1),nx(1), nx(1)+width,nx(1)+width, nx(1)]
% ny=[ny(1), ny(1)-height,ny(1)-height,ny(1),ny(1)];
% close all
% 
% for ii=1:length(c)
% subdiff_first_b{ii}=imcrop(c{ii},[nx(1) ny(1) width height]);
% sum_subdiff_first_b(ii)=sum(sum(sum(subdiff_first_b{ii})));
% end
% 
% for ii=1:length(d)
% subdiff_neigh_b{ii}=imcrop(d{ii},[nx(1) ny(1) width height]);
% ttemp=(subdiff_neigh_b{ii});
% sum_subdiff_neigh_b(ii)=sum(sum(sum(ttemp)));
% end


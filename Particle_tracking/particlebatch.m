clc
clear
clf
imscale = imread('scale 100um_RGB_.tif');
imscale = imresize(imscale, 536/1608);
R2 = imscale(:,:,1); 
R2(511:519,469:513) = 0;
R2(R2<=191) = 0;
R2(R2>191) = 255;
% imshow(R2)
[m1,n1] = find(R2 == 255);
mix = [m1 n1];
ti = [];
for i = 1 : length(mix)
    if mix(i,1) == 523
        ti = [ti;i];
    end
end
mix(ti,:) = [];
pathname = dir('C:\Users\Admin\Downloads\MSD_PSM'); %讀檔
pathname(ismember( {pathname.name}, {'.', '..',})) = [];  %remove . and ..
dirFlags = [pathname.isdir];
% Extract only those that are directories.
subFolders = pathname(dirFlags);
begin = 620;
endd = 619;
for tt = 1 : length(subFolders)
    infiles = dir([subFolders(tt).name '\' '*.mp4']); 
    num = length(infiles);
    cd(subFolders(tt).name)
    videoname = [];
    disarray = [];
    volarray = [];
    for t2 = 1 : num
        imagex = VideoReader(infiles(t2).name);
        nframes = imagex.NumFrames;
        R1 = zeros(536,'uint8');
        ay = [];
        atemp = [];
        atemp1 = [];
        atemp2 = [];
        aclose = [];
        Vt = 20;
        centropoint = [];
        for i = 1 : 310
           if i == 1
               im = read(imagex,i);
%                imshow(im)
%                R = im(:,:,1); 
% %                imshow(R)
%                R(R<=Vt) = 0;
%                R(R>Vt) = 255;
% 
%                im(:,:,1) = R; 
%                im(:,:,2) = 0; 
%                im(:,:,3) = 0;
%                [m,n] = find(R == 255);
%                ay = [m n];
%                atemp2 = ay;
               im = rgb2gray(im);
               im(im<Vt)=0;
               im(im>Vt)=255;
               imshow(im)
               [L,num] = bwlabel(im,8);
               stats = regionprops(L,'Area','PixelList','Centroid','BoundingBox');
               cent = [];
               for kk = 1 : length(stats)
                   if stats(kk).Area >1
                       stats(kk).Centroid = round(stats(kk).Centroid);
                       cent = [cent;stats(kk).Centroid];
                   end
               end
               cent(:,[1,2]) = cent(:,[2,1]);
%                [m,n] = find(R == 255);
               ay = cent;
               atemp2 = ay;
           else
               im = read(imagex,i);
               im = rgb2gray(im);
               im(im<Vt)=0;
               im(im>Vt)=255;
               R = im;
%                imshow(im)
               if i==2
                   for j = 1 : size(atemp2,1)
                       if atemp2(j,1)+1 == 537
                           atemp2(j,1)= 536;
                           aclose = [aclose;j];
                       elseif atemp2(j,2)+1 == 537
                           atemp2(j,2)= 536;
                           aclose = [aclose;j];
                       elseif atemp2(j,1)-1 == 0
                           atemp2(j,1)= 1;
                           aclose = [aclose;j];
                       elseif atemp2(j,2)-1 == 0
                           atemp2(j,2)= 1;
                           aclose = [aclose;j];
                       elseif R(atemp2(j,1)+1,atemp2(j,2)+1) == 255 
                            atemp = [atemp;atemp2(j,1)+1 atemp2(j,2)+1];
                       elseif R(atemp2(j,1)+1,atemp2(j,2)) == 255
                           atemp = [atemp;atemp2(j,1)+1,atemp2(j,2)];
                       elseif R(atemp2(j,1)+1,atemp2(j,2)-1) == 255
                           atemp = [atemp;atemp2(j,1)+1,atemp2(j,2)-1];
                       elseif R(atemp2(j,1),atemp2(j,2)+1) == 255
                           atemp = [atemp;atemp2(j,1),atemp2(j,2)+1];
                       elseif R(atemp2(j,1),atemp2(j,2)-1) == 255
                           atemp = [atemp;atemp2(j,1),atemp2(j,2)-1];
                       elseif R(atemp2(j,1)-1,atemp2(j,2)+1) == 255
                           atemp = [atemp;atemp2(j,1)-1,atemp2(j,2)+1];
                       elseif R(atemp2(j,1)-1,atemp2(j,2)) == 255
                           atemp = [atemp;atemp2(j,1)-1 atemp2(j,2)];
                       elseif R(atemp2(j,1)-1,atemp2(j,2)-1) == 255
                           atemp = [atemp;atemp2(j,1)-1 atemp2(j,2)-1];
                       else
                           aclose = [aclose;j];
                       end
                   end
               else
                   for j = 1 : size(atemp2,1)
                       if atemp2(j,1)+1 == 537
                           atemp2(j,1)= 536;
                           aclose = [aclose;j];
                       elseif atemp2(j,2)+1 == 537
                           atemp2(j,2)= 536;
                           aclose = [aclose;j];
                       elseif atemp2(j,1)-1 == 0
                           atemp2(j,1)= 1;
                           aclose = [aclose;j];
                       elseif atemp2(j,2)-1 == 0
                           atemp2(j,2)= 1;
                           aclose = [aclose;j];
                       elseif R(atemp2(j,1)+1,atemp2(j,2)+1) == 255 && (atemp1(j,1)~=atemp2(j,1)+1 && atemp1(j,2)~=atemp2(j,2)+1)
                            atemp = [atemp;atemp2(j,1)+1 atemp2(j,2)+1];
                       elseif R(atemp2(j,1)+1,atemp2(j,2)) == 255 && (atemp1(j,1)~=atemp2(j,1)+1 && atemp1(j,2)~=atemp2(j,2))
                           atemp = [atemp;atemp2(j,1)+1 atemp2(j,2)];
                       elseif R(atemp2(j,1)+1,atemp2(j,2)-1) == 255 && (atemp1(j,1)~=atemp2(j,1)+1 && atemp1(j,2)~=atemp2(j,2)-1)
                           atemp = [atemp;atemp2(j,1)+1 atemp2(j,2)-1];
                       elseif R(atemp2(j,1),atemp2(j,2)+1) == 255 && (atemp1(j,1)~=atemp2(j,1) && atemp1(j,2)~=atemp2(j,2)+1)
                           atemp = [atemp;atemp2(j,1) atemp2(j,2)+1];
                       elseif R(atemp2(j,1),atemp2(j,2)-1) == 255 && (atemp1(j,1)~=atemp2(j,1) && atemp1(j,2)~=atemp2(j,2)-1)
                           atemp = [atemp;atemp2(j,1) atemp2(j,2)-1];
                       elseif R(atemp2(j,1)-1,atemp2(j,2)+1) == 255 && (atemp1(j,1)~=atemp2(j,1)-1 && atemp1(j,2)~=atemp2(j,2)+1)
                           atemp = [atemp;atemp2(j,1)-1 atemp2(j,2)+1];
                       elseif R(atemp2(j,1)-1,atemp2(j,2)) == 255 && (atemp1(j,1)~=atemp2(j,1)-1 && atemp1(j,2)~=atemp2(j,2))
                           atemp = [atemp;atemp2(j,1)-1 atemp2(j,2)];
                       elseif R(atemp2(j,1)-1,atemp2(j,2)-1) == 255 && (atemp1(j,1)~=atemp2(j,1)-1 && atemp1(j,2)~=atemp2(j,2)-1)
                           atemp = [atemp;atemp2(j,1)-1 atemp2(j,2)-1];
                       else
                           aclose = [aclose;j];
                       end
                   end
               end
               ay(aclose,:) = [];
           end
           if i > 1
               ay = [ay atemp];
               aclose = [];
               atemp2 = atemp;
               atemp1 = atemp2;
               atemp = [];
           end
        end
        centerar = [];
        for k2 = 1 : length(cent)
            for k3 = 1 :size(ay,1)
                if cent(k2,:) == ay(k3,1:2)
                    centerar = [centerar;ay(k3,:)];
                end
            end
        end
        msd = [];
        for d = 1 :10
            if d == 1
                centb = [centerar(:,2),centerar(:,1)*-1]; %MSD計算 %for 每秒計算
            else
                centb = [centerar(:,(d-1)*62),centerar(:,(d-1)*62-1)*-1]; 
            end
            centa = [centerar(:,(d)*62),centerar(:,(d)*62-1)*-1];
            centerar1 = centa-centb;
            ag = sqrt(centerar1(:,1).^2+centerar1(:,2).^2);
            msd = [msd ag]; %組合 %寫入各個點各時間 msd     
        end
        msdm = mean(msd)
        logmsdm = log10(msdm)
        loglog(msdm)
        xlswrite([infiles(t2).name '.xlsx'], logmsdm ,subFolders(tt).name,'A5');
        agm = mean(ag);
        [m2 n2]=find(ag<agm*0.5);
        ay(m2,:)=[];
        centerar1(m2,:)=[];
        for j = 1 : size(ay,1)
            for t3 = 1 :2 : begin
                R1(ay(j,t3),ay(j,t3+1)) = (t3+1)/2*255/310;
            end
        end
        celllen= [];
        for j = 1 : size(ay,1)
            slen = sqrt((ay(j,endd)-ay(j,1))^2+(ay(j,begin)-ay(j,2))^2);
            celllen = [celllen slen];
        end
        cd ..
        load mycolor
        cd(subFolders(tt).name)
%         map2 = colormap(summer);
%         map2(1,:,:) = 0;
        map2 = colormap(mycolor);
        R1 = ind2rgb(R1,map2);
%         figure(1)
%         imshow(R1);
%         c = colorbar;
%         caxis([0 10])
%         c.FontSize = 20;
%         ylabel(c, 'Time(s)')
        avglen = sum(celllen)/size(ay,1)*100/length(mix);
        figure(2)
        compass(centerar1(:,1)*100/length(mix),centerar1(:,2)*100/length(mix))
        set(gcf,'outerposition',get(0,'screensize'));
        saveas(gcf,[erase(infiles(t2).name,".mp4") '_Rose Diagram.tif']);
        R3 = zeros(536,'uint8');
        ay1 = ay(:,1:2);
        for j = 1 : size(ay1,1)
            R3(ay1(j,1),ay1(j,2)) = 255;
        end
        [L,num]=bwlabel(R3,8);
        loc = [];
        for i=1:size(ay1,1)
            loc = [loc;L(ay1(i,1),ay1(i,2))];
        end
        L2 = zeros(536,'double');
        ay2 = ay(:,endd:begin);
        for i=1:size(ay2,1)
           L2(ay2(i,1),ay2(i,2)) = loc(i); 
        end
        setlen = [];
        for j = 1 : num
            sum_x1=0;    sum_y1=0;    area1=0;
            for i=1:536
                for t=1:536
                    if L(i,t)== j
                        sum_x1=sum_x1+i;  
                        sum_y1=sum_y1+t;  
                        area1=area1+1;    
                    end
                end
            end
            L1X = fix(sum_x1/area1);
            L1Y = fix(sum_y1/area1);
            sum_x2=0;    sum_y2=0;    area2=0; 
            for i=1:536
                for t=1:536
                    if L2(i,t)==j    
                        sum_x2=sum_x2+i;  
                        sum_y2=sum_y2+t;   
                        area2=area2+1;    
                    end
                end
            end
            L2X = fix(sum_x2/area2);
            L2Y = fix(sum_y2/area2);
            slen = sqrt((L2X-L1X)^2+(L1Y-L2Y)^2);
            setlen = [setlen;slen];
        end
        setlen(isnan(setlen)) = [];
        avglen2 = sum(setlen)/length(setlen)*100/length(mix);
        imscale = imread('scale 100um_RGB_.tif');
        imscale = imresize(imscale, 536/1608);
        R4=[];
        R2 = imscale(:,:,1); 
        R2(R2<=240) = 0;
        R2(R2>240) = 255;
        imscale(:,:,1) = R2; 
        imscale(:,:,2) = R2; 
        imscale(:,:,3) = R2;
        R4(:,:,1)=R1(:,:,1)+im2double(imscale(:,:,1));
        R4(:,:,2)=R1(:,:,2)+im2double(imscale(:,:,2));
        R4(:,:,3)=R1(:,:,3)+im2double(imscale(:,:,3));
%         allR = R1+imscale;
        figure(1)
        imshow(R4)
        c = colorbar;
        caxis([0 10])
        c.FontSize = 20;
        ylabel(c, 'Time(s)')
        set(gcf,'outerposition',get(0,'screensize'));
        saveas(gcf,[erase(infiles(t2).name,".mp4") '_' num2str(avglen2) '(um).tif']);
        videoname = [videoname;{infiles(t2).name}];
        disarray = [disarray;avglen2];
    end
    A = {'filename' 'distance(um)' 'um/s'};
    B = [disarray volarray];
    xlswrite([subFolders(tt).name '.xlsx'],A,subFolders(tt).name,'A1');
    xlswrite([subFolders(tt).name '.xlsx'],B,subFolders(tt).name,'B2');
    xlswrite([subFolders(tt).name '.xlsx'],cellstr(videoname),subFolders(tt).name,'A2');
    %xlswrite([infiles(t2).name '.xlsx'], msdm ,subFolders(tt).name,'A5');
    cd ..
end
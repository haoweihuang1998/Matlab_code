clear student
student(1)=struct('name','Banny','scores',[85,80,92,78]);
student(2)=struct('name','Joey','scores',[80,85,90,88]);
student(3)=struct('name','Betty','scores',[88,82,90,80]);
scoreMat=cat(1,student.scores);
average1=mean(scoreMat);
fprintf('�|���p�ҥ��Z����:');disp(average1)
average2=mean(scoreMat');
fprintf('�T��ǥͤp�ҥ���:');disp(average2);
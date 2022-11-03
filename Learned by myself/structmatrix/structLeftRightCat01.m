clear student
student(1)=struct('name','Banny','scores',[85,80,92,78]);
student(2)=struct('name','Joey','scores',[80,85,90,88]);
student(3)=struct('name','Betty','scores',[88,82,90,80]);
scoreMat=cat(1,student.scores);
fprintf('成績左右並排:');disp([student.scores])
fprintf('姓名左右並排:');disp({student.name})
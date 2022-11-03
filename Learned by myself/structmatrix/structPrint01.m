clear student
student(1)=struct('name','¶À¯EÞ³','scores',[85,80]);
student(2)=struct('name','±i¶{±¶','scores',[80,85]);
student(3)=struct('name','§dªÃ¿²','scores',[88,82]);
student(2).scores(1)=100;
for i=1:length(student)
    fprintf('student %g:%s\n',i,student(i).name);
end
score3=student(2).scores(1)
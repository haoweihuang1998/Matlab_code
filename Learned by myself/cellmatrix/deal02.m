dirInfo=dir(matlabroot);
n=length(dirInfo);
[fileAndDir{1:n}]=deal(dirInfo.name);
dirs=fileAndDir([dirInfo.isdir])    
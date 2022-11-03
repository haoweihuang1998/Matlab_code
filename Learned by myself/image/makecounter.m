function countfcn = makecounter(initvalue)
currentCount=initvalue;
countfcn =@getCounter;
function count =getCounter
    currentCount=currentCount+1;
    count=currentCount;
end
end
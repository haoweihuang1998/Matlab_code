timer1=tic
n=100*(1:10);
for i=1:length(n)
    timer2=tic;
    z=inv(rand(n(i)));
    time(i)=toc(timer2);
end
fprintf('Overall time = %f sec\n',toc(timer1));
plot(n,time,'.-');
xlabel('Matrix dimensions');
ylabel('Elapsed time(in sec)');
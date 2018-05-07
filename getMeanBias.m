fn=5;
for i=1:fn
eval(['Flow = csvread(''Flow',num2str(i),'.csv'',1,0);']);
if(i==1)
Flowsum=zeros(size(Flow,1),size(Flow,2),fn);
end
Flowsum(:,:,i)=Flowsum(:,:,i)+Flow;
end
Flowaverage=mean(Flowsum,3)
Flowvar=var(Flowsum,0,3)
Flowstd=std(Flowsum,0,3)
Flowaverage=table(Flowaverage);
Flowvar=table(Flowvar);
Flowstd=table(Flowstd);
writetable(Flowaverage, 'Flowaverage.csv');
writetable(Flowvar, 'Flowvar.csv');
writetable(Flowstd, 'Flowstd.csv');


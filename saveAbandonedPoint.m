%function saveAbandonedPoint(Filename)
T=1;
for i=1:T
%    ofoLocation = csvread(Filename,0,2);
    ofoLocation = csvread('20180420-000548-ofo.csv',0,2);
%    eval(['ofoLocation = csvread(''TEST (',num2str(i),').csv'',0,2);']);
    m=abandonnPoint(ofoLocation);
%    eval(['dlmwrite(''TESTout (',num2str(i),').csv'',m,''precision'',''%.6f'',''roffset'',0,''coffset'',2);']);

   dlmwrite('5.csv',m,'precision','%.6f','roffset',0,'coffset',2);

end
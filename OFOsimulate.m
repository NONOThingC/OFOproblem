clear all;
clf;clc;
D=1; %循环几天
T=9; %一天中分时段次数
N=12;%有N个地方
S=[11,12,39,19,27,10,6,15,12,16,9,14;zeros(T-1,N)];
    a=round(normrnd(10,10,N,N));
%    Flow=[0,2,4,1,0,3,0,4,1,0,0,1;
% 0,0,2,2,0,3,0,1,0,1,2,0;
% 4,3,0,3,3,4,0,6,1,3,0,5;
% 1,0,5,0,3,2,1,2,2,1,0,1;
% 0,1,2,4,0,1,0,2,0,1,0,1;
% 2,1,0,2,1,0,0,5,1,3,0,0;
% 0,1,0,0,0,0,0,1,1,0,0,0;
% 1,4,7,4,2,3,0,0,4,0,0,2;
% 2,1,2,3,0,2,1,5,0,3,1,0;
% 2,0,3,1,2,5,0,2,1,0,2,0;
% 0,0,2,1,0,0,0,1,0,0,0,0;
% 0,1,4,1,0,0,1,1,1,0,0,0;
% ];

%magic(N)-diag(diag(magic(N))); %暂时代替流量,改这个参数就非常重要
%[0 10 10 10 10;
%    10 0]
day=1;
tempS1=[];

FlowBias = csvread('Flowstd.csv',1,0);
ShrinkFactor = csvread('ShrinkFactor.csv',1,0);
for j=1:D
  %偏差，要改直接改tempB，normrnd前两个参数是正太分布中值和标准差

    for i=1:T

    eval(['Flow = csvread(''Flow',num2str(i),'.csv'',1,0);']);
    tempB=fix(normrnd(0,FlowBias,N,N));
    Bias=tempB-diag(diag(tempB));
        if(i==T)
            tempS1=S(1,:); %存储初始值
           % S(T+1,:)=S(1,:);
            S(1,:)=(S(i,:)+sum(Flow)-sum(Flow')+sum(Bias)- sum(Bias'));
        else
            S(i+1,:)=(S(i,:)+sum(Flow)-sum(Flow')+sum(Bias)- sum(Bias'));
            a=find(S<0);
            S(a)=0;%将小于0部分置0
        end

        
        fprintf('Day %d:\n',i);
        fprintf('%f\n\n', S(i,:));
        
        day=day+1;
        
        
    end
    tempT=linspace(1,T,T);
    tempTT=tempT';
    %最后地点单独处理
    figure(j);
    hold on;
    a=[];
    tempST=[];

   %太晚了，用民工方法先画下这个东西
   tempST=S(1,:);
   S(1,:)=tempS1;
    for i=1:N
        s=['第' int2str(i) '地点'];
        a(i)=plot(tempTT,S(:,i),'DisplayName',s);
    end
    xlabel('时刻');
    ylabel('车次数');
    legend('show');
   S(1,:)=tempST;
   hold off;
end
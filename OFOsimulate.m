clear 
clf;clc;
D=1; %ѭ������
T=9; %һ���з�ʱ�δ���
N=12;%��N���ط�
%S=[11,12,39,19,27,10,6,15,12,16,9,14;zeros(T-1,N)];
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

%magic(N)-diag(diag(magic(N))); %��ʱ��������,����������ͷǳ���Ҫ
%[0 10 10 10 10;
%    10 0]
day=1;
tempS1=[];

FlowBias = csvread('Flowstd.csv',1,0);
ShrinkFactor = csvread('ShrinkFactor.csv',1,0);
for j=1:D
  %ƫ�Ҫ��ֱ�Ӹ�tempB��normrndǰ������������̫�ֲ���ֵ�ͱ�׼��
    S=[11,12,39,19,27,10,6,15,12,16,9,14;zeros(T-1,N)];
    for i=1:T

    eval(['Flow = csvread(''Flow',num2str(i),'.csv'',1,0);']);
    tempB=fix(normrnd(0,0,N,N));
    Bias=tempB-diag(diag(tempB));
        if(i==T)
            tempS1=S(1,:); %�洢��ʼֵ
           % S(T+1,:)=S(1,:);

        else
            S(i+1,:)=(S(i,:)+sum(Flow)-sum(Flow')+sum(Bias)- sum(Bias'));

        end
        a=find(S<0);
        S(a)=0;%��С��0������0
        
        fprintf('Day %d:\n',i);
        fprintf('%f\n\n', S(i,:));
        
        day=day+1;
        
        
    end
    tempT=linspace(1,T+1,T+1);
    tempTT=tempT';
    %���ص㵥������
    figure(j);
    hold on;
    a=[];
    tempST=[tempS1;S(2:end,:);S(1,:)];
    
    
   %̫���ˣ����񹤷����Ȼ����������


    for i=9:N
        s=['��' int2str(i) '�ص�'];
        a(i)=plot(tempTT,tempST(:,i),'DisplayName',s);
    end
    xlabel('ʱ��');
    ylabel('������');
    legend('show');

   hold off;
end
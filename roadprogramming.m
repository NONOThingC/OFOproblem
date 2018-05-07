clear all;
clc;clf;
digits(10);
CP=[
    %class one 1_3
    103.929376,30.756401; %��ҵ��103.929376,30.756401
    %class two 4_5
    103.926421,30.755045; %����103.926421,30.755045
    %class three 6_8
    103.923808,30.752224; %������103.923808,30.752224
    %class four 9_10
    103.92486,30.74364; %����103.92486,30.74364
    %class five 11_12
    103.929042,30.742255; %�϶���103.929042,30.742255
    %class six 13
    103.932261,30.748747; %����¥
    %class seven 14_15
    103.929139,30.749987; %ͼ���
    %class eight 16_18
    103.932727,30.7512; %Ʒѧ¥
    %class nine 19_20
    103.933909,30.755672;%����103.933909,30.755672
    %class ten 21
    103.934521,30.752819;%ѧ��103.934521,30.752819
    %class eleven 22
    103.931265,30.754437;%�Ͼ�103.931265,30.754437
    %class twelve 23
    103.936853,30.750462; %�ۺ�ѵ����103.936853,30.750462
    ]; %central of point
CPDIS=[];%��γ�Ⱦ���
d=[];%��γ��ת��Ϊ����
%�򾭹����������������㱻��Ϊ(ax, ay)��(bx, by)
%CP=CP.*10^6;
%C = sin(MLatA)*sin(MLatB)*cos(MLonA-MLonB) + cos(MLatA)*cos(MLatB)
%Distance = R*Arccos(C)*Pi/180

for i=1:size(CP,1)
    a=[CP(i,1)*ones(size(CP,1),1),CP(i,2)*ones(size(CP,1),1)];
    ax=a(:,1);
    ay=90-a(:,2);
    bx=CP(:,1); %x���ȣ�yγ��
    by=90-CP(:,2);
    CPDIS(i,:)=sqrt(sum(((CP-a).^2)'));
    C = sin(ay).*sin(by).*cos(ax-bx) + cos(ay).*cos(by);
    d(i,:) = 6371.004.*acos(C).*pi./180;
%    d(i,:)=111.12.*cos(1./(sin(ay).*sin(by)+cos(ay).*cos(by).*cos(ay-ax)))
%    d=111.12*cos(1./(sin��Asin��Bʮcos��Acos��Bcos(��B����A)])
end
d=round(d.*10^3);
%CPDIS=CPDIS./10^6; 
%CPDIS=center point distanceΪ�����ĵ���룬ֱ�����ô˾��󼴿�
%
%
%
FlowBias = csvread('Flowstd.csv',1,0);
D=1; %ѭ������
T=9; %һ���з�ʱ�δ���
N=12;%��N���ط�
S=[11,12,39,19,27,10,6,15,12,16,9,14;zeros(T,N)];

people=0;
ShrinkFactor = csvread('ShrinkFactor.csv',1,0);
for i=1:T
    
    eval(['Flow = csvread(''Flow',num2str(i),'.csv'',1,0);']);
    tempB=fix(normrnd(0,FlowBias,N,N));
    Bias=tempB-diag(diag(tempB));
    if(i~=1)
    S(i+1,:)=(S(i,:)+(sum(Flow)-sum(Flow')).*(7/23)*ShrinkFactor(i)+sum(Bias)- sum(Bias'));
    else
    S(i+1,:)=(S(i,:)+sum(Flow)-sum(Flow')+sum(Bias)- sum(Bias')); 
    end
%    S(i+1,:)=(S(i,:)+sum(Flow)-sum(Flow')+sum(Bias)- sum(Bias')); 
    a=find(S<0);
    S(a)=0;%��С��0������0
end
    tempT=linspace(1,T+1,T+1);
    tempTT=tempT';
    %���ص㵥������
    figure(1);
    hold on;
    a=[];
    for i=1:N
        s=['��' int2str(i) '�ص�'];
        a(i)=plot(tempTT,S(:,i),'DisplayName',s);
    end
    xlabel('ʱ��');
    ylabel('������');
    legend('show');
    hold off;
%%%

%%%
FlowBias = csvread('Flowvar.csv',1,0);
noprogrammingS=S;
for i=1:T
    
    eval(['Flow = csvread(''Flow',num2str(i),'.csv'',1,0);']);
    Bias=FlowBias./100;
    noprogrammingS(i+1,:)=round((noprogrammingS(i,:)+sum(Flow)-sum(Flow')-sqrt(sum(Bias)+ sum(Bias'))));
end
    tempT=linspace(1,T+1,T+1);
    tempTT=tempT';
    %���ص㵥������
    figure(2);
    hold on;
    a=[];
    for i=1:N
        s=['��' int2str(i) '�ص�'];
        a(i)=plot(tempTT,noprogrammingS(:,i),'DisplayName',s);
    end
    xlabel('ʱ��');
    ylabel('������');
    legend('show');
    hold off;
programmingS=noprogrammingS;
X=[];
for i=1:T
    
    eval(['Flow = csvread(''Flow',num2str(i),'.csv'',1,0);']);

    X=opt(CPDIS,noprogrammingS(i+1,:));
    programmingFlow=X;
    Xtable=table(X);
    eval(['writetable(Xtable, ''X',num2str(i),'.csv'');']);
    programmingS(i+1,:)=round((programmingS(i+1,:)+sum(programmingFlow)-sum(programmingFlow')));
    tempeople=how_many_staffs(CPDIS,X,10,10,1800,30);
    if tempeople>people
        people=tempeople;
    end
end
    tempT=linspace(1,T+1,T+1);
    tempTT=tempT';
    %���ص㵥������
    figure(3);
    hold on;
    a=[];
    for i=1:N
        s=['��' int2str(i) '�ص�'];
        a(i)=plot(tempTT,programmingS(:,i),'DisplayName',s);
    end
    axis([1 10 -30 70]);
    xlabel('ʱ��');
    ylabel('������');
    legend('show');
    hold off;
    fprintf('the number of needed people %d:\n',people);

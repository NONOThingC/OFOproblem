clear all;
clf;clc;
D=1; %ѭ������
T=10; %һ���з�ʱ�δ���
N=12;%��N���ط�
%saveAbandonedPoint('20180419-232441-ofo.csv');
drawPictureStyle=['g+','bo','c*','m.','yx','ks','yd','g^','bv','c>','mp','yh'];
np=150; %����ͳ�Ƴ��ĳ���������д������size(ofoLocation,1)
CP=[
 
%class one 1_3
103.929064,30.755164; %�����103.929064,30.755164
103.928554,30.756851; %УҽԺ103.928554,30.756851
103.929376,30.756401; %��ҵ��103.929376,30.756401
%class two 4_5
103.926421,30.755045; %����103.926421,30.755045
103.928244,30.754122; %������ͷ103.928244,30.754122
%class three 6_8
103.92451,30.750878; %����¥103.92451,30.750878
103.925883,30.751933; %�о���¥103.925883,30.751933
103.923808,30.752224; %������103.923808,30.752224
%class four 9_10
%[60,19,126,58,53,16,28,28,38,82,11,31]
103.926968,30.746148; %��¥103.926968,30.746148
103.92486,30.74364; %����103.92486,30.74364
%class five 11_12
103.929042,30.742255; %�϶���103.929042,30.742255
103.932165,30.744852; %��������103.932165,30.744852
%class six 13
103.932261,30.748747; %����¥
%class seven 14_15
103.929139,30.749987; %ͼ���
103.92935,30.743672; %ͼ���103.92935,30.743672
%class eight 16_18
103.932727,30.7512; %Ʒѧ¥
103.930624,30.750905; %����ʵ���¥103.930624,30.750905
103.930603,30.75249; %�繤¥103.930603,30.75249
%class nine 19_20
103.933909,30.755672;%����103.933909,30.755672
103.933475,30.756018; %����2 103.933475,30.756018
%class ten 21
103.934521,30.752819;%ѧ��103.934521,30.752819
%class eleven 22
103.931265,30.754437;%�Ͼ�103.931265,30.754437
%class twelve 23
103.936853,30.750462; %�ۺ�ѵ����103.936853,30.750462    
]; %central of point


index=[zeros(np,T)];
Flow=[zeros(N,N)];
S=[zeros(T,N)];
for i=1:T
    
    figure(i);
    hold on;
%    ofoLocation = csvread('5.csv',0,2);
%    eval(['ofoLocation = csvread(''',num2str(i),'.csv'',0,2);']);
%    %��testout
	eval(['ofoLocation = csvread(''FINAL (',num2str(i),').csv'',0,2);']);
%    np=size(ofoLocation,1);
    for j=1:np
    a=decideClassIndex([ofoLocation(j,2),ofoLocation(j,1)],CP);
    index(j,i)=a;
    S(i,a)=S(i,a)+1;
    plot(ofoLocation(j,2),ofoLocation(j,1),drawPictureStyle([2*a-1,2*a]))
    if(i~=1)
        if(index(j,i)~=index(j,i-1))
            Flow(index(j,i-1),index(j,i))=Flow(index(j,i-1),index(j,i))+1;
        end
    end
    end
    title('���ӿƴ�С�Ƴ��ֲ�ͼ');
    hold off;
end
if(size(S,1)>3)
 tempT=linspace(1,T,T);
tempTT=tempT';
a=[];

figure(1000)
hold on;
for m=1:N
%        figure(1000+m)

        s=['��' int2str(m) '�ص�'];
        a(m)=plot(tempTT,S(:,m),'DisplayName',s)
end
    xlabel('ʱ��');
    ylabel('������');
    legend('show');
hold off;
end

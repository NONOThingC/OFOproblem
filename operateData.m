clear all;
filen=10; %�ļ���
ShrinkFactor=zeros(1,filen-1);
for q=1:filen-1
    %% �����ı��ļ��е����ݡ�
    % ���ڴ������ı��ļ��������ݵĽű�:
    %
    %    F:\matlabtest\OFOproblem\test\20180416\20180419-165832-ofo.csv
    %
    % Ҫ��������չ������ѡ�����ݻ������ı��ļ��������ɺ���������ű���
    
    % �� MATLAB �Զ������� 2018/04/20 14:54:19
    
    %% ��ʼ��������
%    filename = 'F:\matlabtest\OFOproblem\test\20180416\20180419-165832-ofo.csv';
    delimiter = ',';
%    filename1 = 'F:\matlabtest\OFOproblem\test\20180416\20180419-165832-ofo.csv';
    eval(['filename = ''F:\matlabtest\OFOproblem\test\20180416\FINAL (',num2str(q),').csv'';']);
    eval(['filename1 = ''F:\matlabtest\OFOproblem\test\20180416\FINAL (',num2str(q+1),').csv'';']);
    
    %% ÿ���ı��еĸ�ʽ:
    %   ��1: �ı� (%s)
    %	��2: �ı� (%s)
    %   ��3: ˫����ֵ (%f)
    %	��4: ˫����ֵ (%f)
    % �й���ϸ��Ϣ������� TEXTSCAN �ĵ���
    formatSpec = '%s%s%f%f%[^\n\r]';
    %% ���ı��ļ���
    fileID = fopen(filename,'r');
    fileID1 = fopen(filename1,'r');
    %% ���ݸ�ʽ��ȡ�����С�
    % �õ��û������ɴ˴������õ��ļ��Ľṹ����������ļ����ִ����볢��ͨ�����빤���������ɴ��롣
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
    dataArray1 = textscan(fileID1, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
    %% �ر��ı��ļ���
    fclose(fileID);
    fclose(fileID1);
    %% ���޷���������ݽ��еĺ���
    % �ڵ��������δӦ���޷���������ݵĹ�����˲�����������롣Ҫ�����������޷���������ݵĴ��룬�����ļ���ѡ���޷������Ԫ����Ȼ���������ɽű���
    
    %% ����������������б�������
    VarName1 = dataArray{:, 1};
    LVRX8k = dataArray{:, 2};
    VarName3 = dataArray{:, 3};
    VarName4 = dataArray{:, 4};
    
    VarName11 = dataArray1{:, 1};
    LVRX8k1 = dataArray1{:, 2};
    VarName31 = dataArray1{:, 3};
    VarName41 = dataArray1{:, 4};
    ShrinkFactor(q)=size(VarName3,1)+size(VarName31,1);
    %% �����ʱ����
    clearvars filename delimiter formatSpec fileID dataArray dataArray1 fileID1 filename1 ans;
    %ɾȥ�ظ��Ĳ�����
    [LVRX8k,nosamerow1,~]=unique(LVRX8k);
    VarName1= VarName1(nosamerow1);
    VarName3 = VarName3(nosamerow1);
    VarName4 = VarName4(nosamerow1);
    [LVRX8k1,nosamerow2,~]=unique(LVRX8k1);
    VarName11= VarName11(nosamerow2);
    VarName31 = VarName31(nosamerow2);
    VarName41 = VarName41(nosamerow2);
    %����ͬԪ�ز��������ű���
    [samecharcell,samerow1,samerow2]=intersect(LVRX8k,LVRX8k1);
    ShrinkFactor(q)=ShrinkFactor(q)/size(samecharcell,1);
    data1=table(VarName1(samerow1,:),LVRX8k(samerow1,:),VarName3(samerow1,:),VarName4(samerow1,:));
    data2=table(VarName11(samerow2,:),LVRX8k1(samerow2,:),VarName31(samerow2,:),VarName41(samerow2,:));
    %writetable(data1, 'tmp1.csv');
    %writetable(data2, 'tmp2.csv');
    eval(['writetable(data1, ''tmp',num2str(q),'.csv'');']);
    eval(['writetable(data2, ''tmpd',num2str(q),'.csv'');']);
    
    
end
    ShrinkFactor=table(ShrinkFactor);
   writetable(ShrinkFactor, 'ShrinkFactor.csv'); 



T=2; %һ���з�ʱ�δ���
N=12;%��N���ط�
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




for h=1:filen-1
    index=[zeros(np,T)];
    Flow=[zeros(N,N)];
    S=[zeros(T,N)];
  
    for i=1:2
     ofoLocation=[];     
        
        %    ofoLocation = csvread('5.csv',0,2);
        %    eval(['ofoLocation = csvread(''',num2str(i),'.csv'',0,2);']);
        %    %��testout
        if(i==1)
            eval(['ofoLocation = csvread(''tmp',num2str(h),'.csv'',1,2);']);
            %    np=size(ofoLocation,1);
        end
        if(i==2)
            eval(['ofoLocation = csvread(''tmpd',num2str(h),'.csv'',1,2);']);
        end
        np=size(ofoLocation,1);
        for j=1:np
            a=decideClassIndex([ofoLocation(j,2),ofoLocation(j,1)],CP);
            index(j,i)=a;
            S(i,a)=S(i,a)+1;
            
            if(i~=1)
                if(index(j,i)~=index(j,i-1))
                    Flow(index(j,i-1),index(j,i))=Flow(index(j,i-1),index(j,i))+1;
                end
            end
        end
        
    end
    dataFLow=table(Flow);
    dataS=table(S);
    eval(['writetable(dataFLow, ''Flow',num2str(h),'.csv'');']);
    eval(['writetable(dataS, ''S',num2str(h),'.csv'');']);
end
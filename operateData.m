clear all;
filen=10; %文件数
ShrinkFactor=zeros(1,filen-1);
for q=1:filen-1
    %% 导入文本文件中的数据。
    % 用于从以下文本文件导入数据的脚本:
    %
    %    F:\matlabtest\OFOproblem\test\20180416\20180419-165832-ofo.csv
    %
    % 要将代码扩展到其他选定数据或其他文本文件，请生成函数来代替脚本。
    
    % 由 MATLAB 自动生成于 2018/04/20 14:54:19
    
    %% 初始化变量。
%    filename = 'F:\matlabtest\OFOproblem\test\20180416\20180419-165832-ofo.csv';
    delimiter = ',';
%    filename1 = 'F:\matlabtest\OFOproblem\test\20180416\20180419-165832-ofo.csv';
    eval(['filename = ''F:\matlabtest\OFOproblem\test\20180416\FINAL (',num2str(q),').csv'';']);
    eval(['filename1 = ''F:\matlabtest\OFOproblem\test\20180416\FINAL (',num2str(q+1),').csv'';']);
    
    %% 每个文本行的格式:
    %   列1: 文本 (%s)
    %	列2: 文本 (%s)
    %   列3: 双精度值 (%f)
    %	列4: 双精度值 (%f)
    % 有关详细信息，请参阅 TEXTSCAN 文档。
    formatSpec = '%s%s%f%f%[^\n\r]';
    %% 打开文本文件。
    fileID = fopen(filename,'r');
    fileID1 = fopen(filename1,'r');
    %% 根据格式读取数据列。
    % 该调用基于生成此代码所用的文件的结构。如果其他文件出现错误，请尝试通过导入工具重新生成代码。
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
    dataArray1 = textscan(fileID1, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
    %% 关闭文本文件。
    fclose(fileID);
    fclose(fileID1);
    %% 对无法导入的数据进行的后处理。
    % 在导入过程中未应用无法导入的数据的规则，因此不包括后处理代码。要生成适用于无法导入的数据的代码，请在文件中选择无法导入的元胞，然后重新生成脚本。
    
    %% 将导入的数组分配给列变量名称
    VarName1 = dataArray{:, 1};
    LVRX8k = dataArray{:, 2};
    VarName3 = dataArray{:, 3};
    VarName4 = dataArray{:, 4};
    
    VarName11 = dataArray1{:, 1};
    LVRX8k1 = dataArray1{:, 2};
    VarName31 = dataArray1{:, 3};
    VarName41 = dataArray1{:, 4};
    ShrinkFactor(q)=size(VarName3,1)+size(VarName31,1);
    %% 清除临时变量
    clearvars filename delimiter formatSpec fileID dataArray dataArray1 fileID1 filename1 ans;
    %删去重复的并排序
    [LVRX8k,nosamerow1,~]=unique(LVRX8k);
    VarName1= VarName1(nosamerow1);
    VarName3 = VarName3(nosamerow1);
    VarName4 = VarName4(nosamerow1);
    [LVRX8k1,nosamerow2,~]=unique(LVRX8k1);
    VarName11= VarName11(nosamerow2);
    VarName31 = VarName31(nosamerow2);
    VarName41 = VarName41(nosamerow2);
    %找相同元素并整理到两张表里
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



T=2; %一天中分时段次数
N=12;%有N个地方
np=150; %最终统计出的车数最后最好写在这里size(ofoLocation,1)
CP=[
    
%class one 1_3
103.929064,30.755164; %活动中心103.929064,30.755164
103.928554,30.756851; %校医院103.928554,30.756851
103.929376,30.756401; %商业街103.929376,30.756401
%class two 4_5
103.926421,30.755045; %西门103.926421,30.755045
103.928244,30.754122; %西门桥头103.928244,30.754122
%class three 6_8
103.92451,30.750878; %创新楼103.92451,30.750878
103.925883,30.751933; %研究生楼103.925883,30.751933
103.923808,30.752224; %西二门103.923808,30.752224
%class four 9_10
%[60,19,126,58,53,16,28,28,38,82,11,31]
103.926968,30.746148; %主楼103.926968,30.746148
103.92486,30.74364; %南门103.92486,30.74364
%class five 11_12
103.929042,30.742255; %南二门103.929042,30.742255
103.932165,30.744852; %创新中心103.932165,30.744852
%class six 13
103.932261,30.748747; %立人楼
%class seven 14_15
103.929139,30.749987; %图书馆
103.92935,30.743672; %图书馆103.92935,30.743672
%class eight 16_18
103.932727,30.7512; %品学楼
103.930624,30.750905; %基础实验大楼103.930624,30.750905
103.930603,30.75249; %电工楼103.930603,30.75249
%class nine 19_20
103.933909,30.755672;%朝阳103.933909,30.755672
103.933475,30.756018; %朝阳2 103.933475,30.756018
%class ten 21
103.934521,30.752819;%学子103.934521,30.752819
%class eleven 22
103.931265,30.754437;%紫荆103.931265,30.754437
%class twelve 23
103.936853,30.750462; %综合训练场103.936853,30.750462
]; %central of point




for h=1:filen-1
    index=[zeros(np,T)];
    Flow=[zeros(N,N)];
    S=[zeros(T,N)];
  
    for i=1:2
     ofoLocation=[];     
        
        %    ofoLocation = csvread('5.csv',0,2);
        %    eval(['ofoLocation = csvread(''',num2str(i),'.csv'',0,2);']);
        %    %无testout
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
function D=opt(W,F)
%F�ǰ�˳����ĵص�ʣ��(f)ij��W�����ž������

size_F=length(F);%F�Ĵ�С
[size_W,~]=size(W);%W�Ĵ�С
D=zeros(size_W);

%�㼯����
S1=find(F>0);
S2=find(F<0);
size_S1=length(S1);
size_S2=length(S2);
if size_S2==0||size_S1==0
    
else
%linprog�Ĳ�����ʼ��
C=zeros(1,size_S1*size_S2);
LB=C;
UB=ones(1,size_S1*size_S2)*inf;
A=zeros(size_S1+size_S2,size_S1*size_S2);
b=zeros(1,size_S1+size_S2);

count=1;
for i=1:size_S2
    for k=1:size_S1
        C(count)=W(k,i);
        count=count+1;
    end
end

for k=1:size_S2
    A(1,1+(k-1)*size_S1)=1;
end
b(1)=F(S1(1));
for i=2:size_S1
    A(i,:)=[0 A(i-1,1:size_S1*size_S2-1)];
    b(i)=F(S1(i));
end

for i=(size_S1+1):(size_S1+size_S2)
    k=i-size_S1;
    A(i,((k-1)*size_S1+1):(k*size_S1))=-ones(1,size_S1);
    b(i)=F(S2(k));
end
options = optimoptions('intlinprog','IntegerTolerance',1e-6);
targetD=intlinprog(C,ones(1,length(C))',A,b,[],[],LB,UB);

count=1;
for i=1:size_S2
    for k=1:size_S1
        D(S1(k),S2(i))=targetD(count);
        count=count+1;
    end
end
end
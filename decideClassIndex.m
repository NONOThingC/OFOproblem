function classindex = decideClassIndex(point,CP)
%ÿ�ζ��뵥������Ҫ 103��30����
classindex=0;
[~,tempindex]=min(sum((point-CP)'.^2));
if(tempindex<4)
    classindex=1;
elseif(tempindex<6)
    classindex=2;
elseif(tempindex<9)
    classindex=3;
elseif(tempindex<11)
    classindex=4;
elseif(tempindex<13)
    classindex=5;
elseif(tempindex<14)
    classindex=6;
elseif(tempindex<16)
    classindex=7;
elseif(tempindex<19)
    classindex=8;
elseif(tempindex<21)
    classindex=9;
elseif(tempindex<22)
    classindex=10;
elseif(tempindex<23)
    classindex=11;
elseif(tempindex<24)
    classindex=12;
end
end


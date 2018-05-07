function beta=how_many_staffs(W,D,theta,v,t,gama)
%WºÍDÍ¬ÐÍ
[m,n]=size(D);
C=0;
for i=1:m
    for j=1:n
        C=C+ceil(D(i,j)/theta)*W(i,j)*2;
    end
end
beta=ceil((C+v*gama*sum(sum(D)))/(v*t));

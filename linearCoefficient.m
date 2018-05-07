function [k,b] = linearCoefficient(a1,a2)

k = (a1(:,2)-a2(:,2))/(a1(:,1)-a2(:,1));
b = a1(:,2) - k*a1(:,1);

end

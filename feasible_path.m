function [Y P]=feasible_path(x,Z)

j=1;
for i=1:size(Z)
    if(Z(i)<=500&&Z(i)>0)
      P1(j)=Z(i);
      Y(j,:)=x(i,:);
      j=j+1;
    end
end
P=P1';
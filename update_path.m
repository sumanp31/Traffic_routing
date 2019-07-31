function [X Z]=update_path(X,A,Z)

a=[];
X1=[];
Z1=[];
for i=1:size(X)
    if (X(i,1:size(A,2))==A)
        a=[a;i];
    end
end

for i=1:size(a)
    X1=[X1;X(a(i),:)];
    Z1=[Z1;Z(a(i))];
end

X=X1;
Z=Z1;
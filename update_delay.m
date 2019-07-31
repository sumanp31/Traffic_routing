function Z=update_delay(Z,diff,X,l,N)

a=[];
b=a;

%Links where there is a change in weight
[m n]=find(diff~=0); 

%Selecting paths which contains the link with changed weight
for j=1:size(m)
    for i=1:size(X)
        for k=l:N-1
            if (X(i,k)==m(j) && X(i,k+1)==n(j))
                a=[a;i];
                b=[b;j];
            end
        end
    end
end

%Update delay for path which contains link with changed weight
for i=1:size(a)
    Z(a(i))=Z(a(i))+diff(m(b(i)),n(b(i)));
end
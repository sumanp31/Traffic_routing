function Z=delay(x,W)
[a b]=size(x);
Z=[];

for i=1:a
    V=0;
    for j=1:b-1
        if x(i,j+1)~=0
            z=W(x(i,j),x(i,j+1));
            V=V+z;
        end    
    end
    Z=[Z;V];
end
    
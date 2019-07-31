function W=updateweight(W,N)
t=randperm(N);
p=5;%t(length(t));
x=[];
x2=x;
combos=(combntns(1:N-1,2));
W1=W;
for j=1:size(combos)
        permu=perms(combos(j,:));
        x=[x; permu];
end
w=randperm(size(x));
for i=1:p
x1=x(w(i),:);
x2=[x2;x1];
end
for i=1:size(x2,1)
    s=x2(i,1);
    r=x2(i,2);
    if(s~=N && r~=1&& W(s,r)~=10^3)
    W(s,r)=1+floor((100-1)*rand(1));
    W(r,s)=10^3;
    end
end
W;
W1-W

  
  
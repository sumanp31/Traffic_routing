function W=weight(N)
% clc;
% N=5;
W=1000*ones(N);
x1=[];
combos=(combntns(1:N-1,2));
for j=1:size(combos)
        permu=perms(combos(j,:));
        x1=[x1 permu];
end
x=x1';
t=randperm(size(x));
    for i=1:size(t,2)-5
        m=x(t(i),1);
        n=x(t(i),2);
        if(W(m,n)==1000)
            W(m,n)=1+floor((100-1)*rand(1));
            W(n,m)=10^3;

        end
    end
    for i=1:5
        W(i,i)=0;
    end
    W(1,5)=floor(1000*rand(1));
W(2:N,1)=10^3;
W(N,1:N-1)=10^3;
p=randperm(N-2)+1;

    W(p(1:2),N)=ceil(100*rand(2,1));
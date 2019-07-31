function W=update_weight(W,N)
% clc;
% W=[ 0             49        1000        1000         779
%     1000           0        1000        2000          33
%     1000          11           0        2000        2000
%     1000        2000        2000           0          69
%     1000        1000        1000        1000           0];

t=floor(5+N*N*rand(1));
i=1;
while (i<=t)
    m=floor(1+(N-2)*rand(1));
    n=floor(2+(N-2)*rand(1));
    if(m~=n)
        W(m,n)=1+floor((100-1)*rand(1));
        W(n,m)=10^3;
        i=i+1;
    end
end
clc;
close all;
clear all;

A=1;
N=7;
W=weight(N);
X=possible_path(N);
Z=delay(X,W);
% [Y P]=feasible_path(x,Z);
[M i]=min(Z);
S=X(i,:);
A=S(2);
while(A~=5)
    W1=W;
    W=update_weight(W,N);
    diff=W-W1;
    [m n]=find(diff~=0);
    for i=1:size(m)
        
end
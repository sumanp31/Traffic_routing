clc;
close all;
clear all;

A=[1];

N=7;

W=weight(N);
X=possible_path(N);
Z=delay(X,W);
% [Y P]=feasible_path(x,Z);
l=2;
while(A~=N)
    [M i]=min(Z);
    S=X(i,:)
    A=[A S(l)]
    
    W1=W;
    W=update_weight(W,N);
    diff=W-W1;  
    X=update_path(X,A,Z);
    Z=update_delay(Z,diff,X,l,N);
     
    l=l+1;  
end

A
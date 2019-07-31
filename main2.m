clc;
close all;
clear all;

A=[1];

N=11;

W=weight(N);
X=possible_path(N);
Z=delay(X,W);
% [Y P]=feasible_path(x,Z);
l=2;
j=1;
p=0;
while(A~=N)
    [M i]=min(Z);
    M
    S=X(i,:)
    if A==[1]
        S1=S';
    end
    
    p=p+W(S1(j),S1(j+1))
      if j>N-1
           break;
        end
        j=j+1;
     A=[A S(l)];
    
    W1=W;
    W=update_weight(W,N);
    diff=W-W1;
    [X Z]=update_path(X,A,Z);
    Z=update_delay(Z,diff,X,l,N);
     
    l=l+1;  
end

A;
# Traffic Routing
### PROBLEM  STATEMENT
While travelling from one place to another  a person may have multiple choices of choosing a path .However, in real life scenario not every path is a good choice as some paths may cause time delay due to various factors like varying traffic conditions or road blockage. In this project we are trying to formulate an algorithm to minimize the time delay of the person travelling.
### ASSUMPTIONS
1.The varying traffic conditions at any instant is deterministic.
2.We are considering one person who is travelling from source to destination ,which implies that there is no capacity constraint.
3.Time taken to travel from a node to itself is assumed “0” and the time taken to travel between nodes which are not connected directly is”∞”.
4.The paths are directed & hence the time taken to tranverse in opposite direction is “∞”.
### OUR MODEL
We have considered a multiroute model where the nodes are the checkpoints,where node is a point where person has a choice to choose an alternate  path .
The shortest path is calculated at the source and at every node, the person encounters in his path, the shortest path is updated as per the change in the traffic scenario. This updation is centrally done which implies that every node has the updated traffic information for the whole network.
### MODEL PARAMETERS
1. Number of nodes is N.
2. Time taken by the person to travel from one node to another is stored W1, where wij the time taken
 to  travel from node i to j.
3. Set of all the possible paths between source and destination ,X.
4. Set of delays for each possible path,Z.
### ALGORITHM
AT FIRST NODE  ie. SOURCE
    1. Given weight matrix, W.
    2. Now we determine the possible paths between source and destination and stored in X.
    3. We calculate vector Z
            
i goes  from 1 to rows in X.
Each element Zi gives the total delay in the path X( i, : )
4.Find the shortest path X(k, : ) such that Z(k) is minimum we have min(Z).
AT OTHER NODES
Let us assume Z(k) has the minimum value as determined above .Hence X (k,: ) was selected as the shortest path. The person moves to X(k,2).
1.Given updated weight matrix W2.
2.We calculate the difference matrix 
W=W2-W1
3.Find the positions in difference matrix where it has non zero value say the position is (m,n) .
4.Eliminate rows of X which do not have the traversed nodes as starting elements of it , in order.
5.Find X(r,: ) which contains m&n consecutively.
6.Update P(r) where 
Z(r)=Z(r) +W(m, n)
7.Find the shortest path X(s,: ) such that Z(s)is minimum
The person moves to X(s,3)






### RESULTS :
![](https://github.com/sumanp31/Traffic_routing/blob/master/img0.jpg) 
![](https://github.com/sumanp31/Traffic_routing/blob/master/img1.jpg) 

### CONCLUSIONS:
    • The path selected at first has higher weight associated with it.
    •  But, the updation at each node resulted in lower cost .
    • Lower computation time, as we eliminate the infeasible paths and calculate total weight only when there is a change in weight.
    • Algorithm adapts to the dynamic changes in weight matrix .


MATLAB CODES : Files are attached

### MAIN PROGRAM

clc;
close all;
clear all;
 
A=[1];
 
N=10;
 
W=weight(N);
X=possible_path(N);
Z=delay(X,W);
% [Y P]=feasible_path(x,Z);
l=2;
j=1;
p=0;
while(A~=N)
    Iteration=size(A,2)
    [M i]=min(Z);
    
    S=X(i,:)
    if A==[1]
        S1=S';
    end
    
    p=p+W(S1(j),S1(j+1));
      if j>N-1
           break;
        end
        j=j+1;
     A=[A S(l)]
    
    W1=W;
    W=update_weight(W,N);
    diff=W-W1;
    [X Z]=update_path(X,A,Z);
    Z=update_delay(Z,diff,X,l,N);
     
    l=l+1;  
end
 

### FUNCTIONS USED
#### WEIGHT MATRIX GENERATION
function W=weight(N)
 
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













#### POSSIBLE PATH FUNCTION
function x=possible_path(N)
 
x=[1 N zeros(1,N-2)];
for i=1:N-2
    combos=combntns(2:N-1,i);
    k=size(combos);
        
    for j=1:k
        permu=perms(combos(j,:));
        [r s]=size(permu);
        x=[x;ones(r,1) permu N*ones(r,1) zeros(r,N-(s+2))];
    end
    
end


#### WEIGHT CORRESPONDING TO EACH POSSIBLE PATH
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
End

#### WEIGHT MATRIX UPDATION
    
function W=update_weight(W,N)
 
 
t=floor(N+N*N*rand(1));
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


#### POSSIBLE PATH ELIMINATION FUNCTION
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

#### WEIGHT UPDATION OF PATHS
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

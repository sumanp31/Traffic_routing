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

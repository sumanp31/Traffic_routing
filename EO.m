% original=[];
n=7;
W=weight(n);
for i=1:n
    for j=1:n
        if(W(i,j)>500)
            W(i,j)=0;
        end
    end
end
original=W;
N = size(original,1);
coords=[cos(2*pi*(1:N)/N); sin(2*pi*(1:N)/N)]';
gplot(original,coords);
text(coords(:,1)-0.1,coords(:,2)+0.1,num2str((1:N)'),'FontSize',14);
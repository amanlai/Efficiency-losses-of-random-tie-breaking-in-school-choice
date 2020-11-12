function schPrioStr = BrokenTies(cCount,schPrio)

% give a 3D matrix where each 2D matrix is one strict priority list with a
% random tiebreaker

temp=1:cCount;
rank = zeros(cCount,1);

for j = 1:cCount 
    [~,I] = sort(schPrio(:,j));
    rank(I) = temp;
    schPrio(:,j) = rank;
end
schPrioStr = schPrio;

end
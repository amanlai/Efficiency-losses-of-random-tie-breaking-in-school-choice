function [studPref, schPrio] = Ordinalify(iCount,cCount,studPref,schPrio)




% make the preferences and the priorities ordinal
%rank = zeros(1,cCount);
for i = 1:iCount 
    [~,~,I] = unique(studPref(i,:));
%    [~,I] = sort(schPrio(:,j));
 %   temp = 1:cCount;          % if a school is unranked, it is automatically set to zero, so the ranking of such schools is down to its index
  %  rank(I) = temp;
   % studPref(i,:) = rank;
    studPref(i,:) = I';
end


for j = 1:cCount
    [~,~,I] = unique(schPrio(:,j));
    schPrio(:,j) = I;
end


end




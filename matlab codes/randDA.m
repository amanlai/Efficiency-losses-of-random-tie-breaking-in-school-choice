function pi = randDA(iCount,cCount,studPref,schPrio,cap)

% find SODA for each tiebreaker and combine them to get a random DA outcome



%{
pi = zeros(iCount,cCount);


% counting the number of ways to break ties

Counter = 0;
combos=1;
maxPrio = max(schPrio);
for j = 1:cCount
    maxPrioj = maxPrio(j);
    for i = 1:maxPrioj
        for k = 1:iCount 
            if schPrio(k,j) == i;
                Counter = Counter + 1;
            end
        end
        combos = combos * factorial(Counter);
        Counter = 0;
    end
end

%}

schPrioStr = BrokenTies(cCount,schPrio); % randomly break ties in schPrio to obtain schPrioStr
pi = SODA(iCount,cCount,studPref,schPrioStr,cap);



%{
for matchCount = 1:combos
    schPrio = schPrioStr(:,:,matchCount);
    pi = pi + SODA(iCount,cCount,studPref,schPrio,cap);
end

pi = pi / combos;
%}


end
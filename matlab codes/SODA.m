function mu = SODA(iCount,cCount,studPref,schPrio,cap)

% find the student optimal matching for (studPref,schPrio) where schPrio is
% strict

[A, b, dAj] = stability(iCount,cCount,studPref,schPrio,cap); %gives the BB(00) conditions in matrix form
[Aeq, lb, ub, beq] = randMatch(iCount,cCount,cap,dAj); %makes sure it is a random matching
f = optWeights(iCount,cCount,studPref,dAj); %rank efficient weights
mu = OrdEff(f,A,b,Aeq,beq,lb,ub,iCount,cCount); %actual optimization



end
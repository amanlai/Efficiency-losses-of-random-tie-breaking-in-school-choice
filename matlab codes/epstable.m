function rho = epstable(iCount,cCount,studPref,schPrio,cap)

[A, b, dAj] = combcond(iCount,cCount,studPref,schPrio,cap); %gives a matrix form for the comb constraint
[Aeq, lb, ub, beq] = randMatch(iCount,cCount,cap,dAj); %gives a matrix form to ensure a random matching
f = optWeights(iCount,cCount,studPref,dAj); %gives the rank efficient weights
y = OrdEff(f,A,b,Aeq,beq,lb,ub,iCount,cCount); % actual optimization
rho = ETE(iCount,studPref,schPrio,y); %makes the outcome ete

end
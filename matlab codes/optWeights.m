function f = optWeights(iCount,cCount,studPref,dAj)

% assign weights to the objective function:
% the higher the rank is, the greater the weight is

f = zeros(1,dAj);
for i = 1:iCount
    index1 = (i-1)*cCount + 1;
    index2 = i*cCount;
    for j = index1:index2
        index = j - index1 + 1;
        f(j) = -studPref(i,index)^2;   % linprog is a minimization; we need maximization
    end
end


end

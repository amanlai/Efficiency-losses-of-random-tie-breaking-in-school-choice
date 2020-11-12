function [Aeq, lb, ub, beq] = randMatch(iCount,cCount,cap,dAj)

dAeq = iCount+cCount;
Aeq = zeros(dAeq,dAj);

% random matching constraint

% for students
for i = 1:iCount
    for j = 1:cCount
        index = (i-1)*cCount + j;
        Aeq(i,index) = 1;
    end
end

% for schools
iCount1 = iCount + 1;
for i = iCount1:dAeq
    for j = 1:iCount
        index = (i-iCount1) + (j-1)*cCount + 1;
        Aeq(i,index) = 1;
    end
end


% probability distribution constraint

lb = zeros(1,dAj);           % since rho is a probability distribution
ub = ones(1,dAj);            % it must be in [0,1]
beq = [ones(iCount,1); cap];  % ensures a random matching


end

function y = OrdEff(f,A,b,Aeq,beq,lb,ub,iCount,cCount)

options = optimoptions(@linprog,'Algorithm','simplex');
x=linprog(f,A,b,Aeq,beq,lb,ub,[],options);
%x=cplexlp(f,A,b,Aeq,beq,lb,ub);

y = zeros(iCount,cCount);
for i = 1:iCount
    index1 = (i-1)*cCount+1;
    index2 = i*cCount;
    y(i,:) = x(index1:index2)';
end



end
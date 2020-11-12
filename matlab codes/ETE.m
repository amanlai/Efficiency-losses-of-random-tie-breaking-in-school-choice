function rho = ETE(iCount,studPref,schPrio,y)


% treat equals equally

rho = y;
indctr = zeros(iCount,1);
iCount1 = iCount-1;
for i = 1:iCount1
    if indctr(i)==0
        indctr(i) = 1;
        sumES = y(i,:);
        sumInd = 1;
        k = i + 1;
        % fishing out the students with the same priority and preferences
        for j = k:iCount 
            if (indctr(j)==0)&&isequal(studPref(i,:),studPref(j,:))&&isequal(schPrio(i,:),schPrio(j,:)) 
                indctr(j)=1;
                sumES = sumES + y(j,:);
                sumInd = sumInd + 1;
            end
        end
        
        % giving them the same outcome
        for j = i:iCount
            if indctr(j)==1
                rho(j,:) = sumES / sumInd;
            end
        end
    end
end



end


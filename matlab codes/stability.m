function [A, b, dAj] = stability(iCount,cCount,studPref,schPrio,cap)

% stability constraint




%b = [];

dAi = 0;
for j = 1:cCount
    capJ = cap(j);
    IsetCount = nchoosek(iCount,capJ);
    dAi = dAi + IsetCount;
end
b = zeros(dAi,1);
Counter=0;
for j = 1:cCount
    capJ = cap(j);
    IsetCount = nchoosek(iCount,capJ);
    Counter = Counter+IsetCount;
    b(Counter-IsetCount+1:Counter) = -capJ*ones(IsetCount,1);
end

dAj = iCount*cCount;
A = zeros(dAi,dAj);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The initial comb condition %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dAiCount = 1;
for j = 1:cCount
    capJ = cap(j);
    IsetCount = nchoosek(iCount,capJ);
    Iset = nchoosek(1:iCount,capJ);
 %   dAi = dAi + IsetCount;
 %   b = [b; capJ*ones(IsetCount,1)];
  
    %Iset = nchoosek(schPrio(:,j),capJ);
    %IsetMin = min(Iset,[],2);

    % finding the lowest priority of a student in each combination
    IsetMin = zeros(IsetCount,1);
    for i = 1:IsetCount 
        IsetMin(i) = min(schPrio(Iset(i,:),j));
    end
    
    for i = 1:IsetCount
        for k = 1:iCount
            if schPrio(k,j) >= IsetMin(i) %checks whether k as higher priority than lowest priority student in Iset(i) at j
                index = (k-1)*cCount + j;
                A(dAiCount,index) = -1;
            end
        end
        
        for k = 1:capJ
            sCurr = Iset(i,k);
            for l = 1:cCount 
                if studPref(sCurr,l) >= studPref(sCurr,j) % every student in Iset(i) has their better schools checked 
                    index = (sCurr-1)*cCount+l;
                    A(dAiCount,index) = -1;    % have to know which row we are on
                end
            end
        end
        dAiCount = dAiCount + 1;
    end
end



end

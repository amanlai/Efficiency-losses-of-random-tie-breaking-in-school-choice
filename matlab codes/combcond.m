% stability constraint
function [A, b, dAj] = combcond(iCount,cCount,studPref,schPrio,cap)




%b = [];

dAi = cCount;
for j = 1:cCount
    capJ = cap(j);
    IsetCount = nchoosek(iCount,capJ);
    dAi = dAi + IsetCount;
end
b = zeros(dAi-cCount,1);
Counter=0;
for j = 1:cCount
    capJ = cap(j);
    IsetCount = nchoosek(iCount,capJ);
    Counter = Counter+IsetCount;
    b(Counter-IsetCount+1:Counter) = capJ*ones(IsetCount,1);
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

%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% students with strictly higher priority get better schools with prob 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Prob1cap = zeros(cCount,1);
betterCount = 0;
rank = zeros(1,iCount);
temp = 1:iCount;

for j = 1:cCount
    qcth = iCount + 1 - cap(j);     % the cap(j)th highest ranked students number
    [~,I] = sort(schPrio(:,j));
    rank(I) = temp;
    
    % fish out the q_cth highest priority student
    for k = 1:iCount
        if rank(k) == qcth
            qj = k;
        end
    end
    iqj = schPrio(qj,j);  % cap(j)th student's priority number
    
    for i = 1:iCount 
        if schPrio(i,j) > iqj       % fish out the students who have a higher priority number than the cap(j)th student
            index = (i-1)*cCount + j;
            A(dAiCount,index) = -1;
            betterCount = betterCount + 1;
        end
    end
    Prob1cap(j) = betterCount;
    betterCount = 0;
    dAiCount = dAiCount + 1;
end
    





% comb condition boundary
b = [-b; -Prob1cap];


%}

%b=-b;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% define preferences, priorities and capacities %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%{
iCount=3;
cCount=2;
studPref = zeros(iCount,cCount);
schPrio = zeros(iCount,cCount);

for i = 1:iCount
    for j = 1:cCount
        studPref(i,j) = cCount/j;
    end
end

schPrio(1,1) = 2;
schPrio(2,1) = 1;
schPrio(3,1) = 1;
schPrio(1,2) = 2;
schPrio(2,2) = 2;
schPrio(3,2) = 1;

cap = [2;1];
%}



%{
% ordinal efficiency example BM(2001)

iCount=4;
cCount=4;
studPref = zeros(iCount,cCount);
schPrio = zeros(iCount,cCount);

for i = 1:iCount/2
    for j = 1:cCount
        studPref(i,j) = cCount/j;
    end
end
for i = iCount/2+1:iCount
    studPref(i,1) = 15;
    studPref(i,2) = 16;
    studPref(i,3) = 13;
    studPref(i,4) = 14;
end


for i = 1:iCount
    for j = 1:cCount
        schPrio(i,j) = 1;
    end
end



cap = [1;1;1;1];
%}


%{
% lattice structure example, Knuth (1976)

iCount=4;
cCount=4;
studPref = zeros(iCount,cCount);
schPrio = zeros(iCount,cCount);

for i=1:iCount
    schPrio(i,1) = iCount/i;
end
for i=1:iCount
    schPrio(i,4) = i;
end
schPrio(1,2) = 3;
schPrio(2,2) = 4;
schPrio(3,2) = 1;
schPrio(4,2) = 2;

schPrio(1,3) = 2;
schPrio(2,3) = 1;
schPrio(3,3) = 4;
schPrio(4,3) = 3;


for j=1:cCount
    studPref(1,j) = j;
end
for j=1:cCount
    studPref(4,j) = cCount/j;
end
studPref(2,1) = 2;
studPref(2,2) = 1;
studPref(2,3) = 4;
studPref(2,4) = 3;

studPref(3,1) = 3;
studPref(3,2) = 4;
studPref(3,3) = 1;
studPref(3,4) = 2;

cap = [1;1;1;1];
%}




%{
iCount=3;
cCount=3;
studPref = zeros(iCount,cCount);
schPrio = zeros(iCount,cCount);

studPref(1,1)=2;
studPref(1,2)=1;
studPref(1,3)=3;
studPref(2,1)=3;
studPref(2,2)=2;
studPref(2,3)=1;
studPref(3,1)=1;
studPref(3,2)=3;
studPref(3,3)=2;

cap = ones(cCount,1);
%}


%{
% Example of BM(2001) modified

iCount=16;
cCount=16;
studPref = zeros(iCount,cCount);
schPrio = ones(iCount,cCount);

for i = 1:iCount/2
    for j = 1:cCount
        studPref(i,j) = cCount/j;
    end
end
for i = iCount/2+1:iCount
    studPref(i,1) = 15;
    studPref(i,2) = 16;
    studPref(i,3) = 13;
    studPref(i,4) = 14;
    studPref(i,5) = 11;
    studPref(i,6) = 12;
    studPref(i,7) = 9;
    studPref(i,8) = 10;    
    studPref(i,9) = 7;
    studPref(i,10) = 8;
    studPref(i,11) = 5;
    studPref(i,12) = 6;
    studPref(i,13) = 3;
    studPref(i,14) = 4;
    studPref(i,15) = 1;
    studPref(i,16) = 2;
end
cap = ones(cCount,1);
%}


%{
% Main example in KU(2015)

iCount = 6;
cCount = 4;
cap = [2;1;2;1];
schPrio = zeros(iCount,cCount);
studPref = zeros(iCount,cCount);

for i=1:iCount
    schPrio(i,1)=1;
end
schPrio(6,2)=6;
schPrio(1,2)=5;
schPrio(3,2)=5;
schPrio(5,2)=4;
schPrio(4,3)=6;
schPrio(2,3)=5;
schPrio(3,3)=5;
schPrio(5,3)=5;
schPrio(5,4)=6;
schPrio(3,4)=5;
schPrio(6,4)=5;

studPref(1,2)=4;
studPref(1,1)=3;
studPref(2,1)=3;
studPref(2,2)=2;
studPref(2,3)=4;
studPref(2,4)=1;
studPref(3,1)=1;
studPref(3,2)=2;
studPref(3,3)=3;
studPref(3,4)=4;
studPref(4,2)=4;
studPref(4,3)=1;
studPref(5,3)=2;
studPref(5,4)=1;
studPref(6,1)=1;
studPref(6,2)=2;
studPref(6,3)=3;
studPref(6,4)=4;

%}


%{
% My example

iCount = 9;
cCount = 4;
cap = [2;2;2;3];
schPrio = zeros(iCount,cCount);
studPref = zeros(iCount,cCount);

for i=1:iCount/3
    index=(i-1)*3+1;
    schPrio(index,1)=iCount-i;
    schPrio(index+1,1)=iCount-i;
    schPrio(index+2,1)=iCount-i;
end
for i=1:iCount
    for j=2:cCount 
        schPrio(i,j)=1;
    end
end

studPref(1,:)=[2 3 0 1];
studPref(2,:)=[2 3 0 1];
studPref(3,:)=[2 0 3 1];
studPref(4,:)=[2 1 3 0];
studPref(5,:)=[2 0 1 3];
studPref(6,:)=[2 1 0 3];
studPref(7,:)=[2 3 1 0];
studPref(8,:)=[2 0 3 1];
studPref(9,:)=[2 0 1 3];

%}








%rel = '<<<<<<<<<<<<<<<<';
%vert = extrpts(A,rel,b);



% finding the extreme points of the polytope

%P=polytope(comA,comB);
%P=polytope(A,b);
%Extr = extreme(P);

%{
ExtrPt = zeros(iCount,cCount);
for i = 1:iCount
    index1 = (i-1)*iCount+1;
    index2 = index1+iCount-1;
    ExtrPt(i,:) = Extr(index1:index2);
 end
%}



%{
% Example in EE(2008)

iCount = 3;
cCount = 3;
studPref = [2 3 1; 1 2 3; 1 3 2];
schPrio = [2 1 1; 1 2 1; 1 1 2];
cap = [1;1;1];
%}

%
% modified EE (2008)

iCount = 3;
cCount = 3;
studPref = [3 2 1; 3 2 1; 2 1 3];
schPrio = [1 1 2; 1 1 2; 1 3 1];
cap = [1;1;1];
%}



[studPref, schPrio] = Ordinalify(iCount,cCount,studPref,schPrio);
rho = epstable(iCount,cCount,studPref,schPrio,cap);
pi = randDA(iCount,cCount,studPref,schPrio,cap);
%xi = sIC(pi,iCount,cCount,studPref,schPrio,cap);





clear i j;

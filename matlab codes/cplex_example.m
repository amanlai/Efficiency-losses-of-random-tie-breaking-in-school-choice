f = [-1; -2; -3];
A = [-1 1 1; 1 -3 1];
b = [20; 30];
Aeq = [];
beq = [];
lb = [0; 0; 0];
ub = [40;inf;inf];

options = cplexoptimset;
options.Display = 'on';

[x,fval,exitflag,output] = cplexlp(f,A,b,Aeq,beq,lb,ub,options);

fprintf ('\nSolution status = %s\n', output.cplexstatusstring);
fprintf ('Solution value = %f\n', fval);
disp ('Values =');
disp (x');

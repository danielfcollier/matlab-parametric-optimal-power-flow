%
%       OPF via Continuation Method
%          Main loop procedure
%
clear                                   % clear work space
clc                                     % clear screen
clf                                     % clear command window
close
%
disp('                  OPF via Continuation Method                          ')
disp('                         using MATLAB                                  ')
disp('                  version 1.0 - November 1991                          ')
disp('                                                                       ')
disp('                                                                       ')
%
% Data input
%
kmenu=menu('Choose an example','2-bus system','5-bus system ','14-bus system','30-bus system','32-bus system','65-bus system');
if kmenu==2
    ex5
elseif kmenu==3
    ex14
elseif kmenu==1
    ex2a
elseif kmenu==4
    EX30
elseif kmenu==5
    sis32
elseif kmenu==6
    ex65
end
sttim=[];
klt=0;                                  % phase 1: initial optimal sol.
in                                      % initialization
% % % exemplo de como fixar a máquina 34 em nível de potência especificado
% % k=34;
% % ipgfixed=sort([ipgfixed; k]);
% % pg(find(est==k))=3.9759;
% % ipgfree(find(ipgfree==k))=[];
%
% Basic loop
%
while epsilon <= 1                      % continuation loop
        tim= cputime;
        while  ge > toler               % Newton Raphson loop
            am                          % Jacobian of KT cond.
            nr                          % Newton Raphson iteration
            up                          % variable's updating
            atua                      % atualiza a carta de capabilidade    
            de                          % Lagrangean first derivatives
            er                          % optimality condition error (grad)
            ge
        end                             % end of the Newton Raphson solver
        la                              % Lagrange multipliers
        ev                              % restricted hessian eigenvalues
        ch                              % active constraint set check
        cstes                           % control strategy
        ttim= cputime-tim;
        sttim=[sttim;ttim];
end                                     % end of the continuation process
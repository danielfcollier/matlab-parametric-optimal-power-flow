%
%  Newton Raphson
%
vet=[1:slack-1,slack+1:length(g)];        %..................................
gg=g(vet);                                %..  bus reference elimination  ...
G=H(vet,vet);                             %..................................
ddx= G\gg;                                % linear system resolution
dx= sparse(length(g),1);
dx(vet)= -ddx;                            % solution variation
nit=nit+1;
if nit > maxnit
   disp('Excessive number of iterations')
   keyboard
end
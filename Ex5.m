%
% EXAMPLE: 5-bus system
%
%    from Stevenson
%
warning off
nb=5;                            % number of busses
nl=6;                            % number of lines
biv=[1:nb]';                     % bus index vector
liv=[1:nl]';                     % line index vector

ifrom=[1 2 3 3 5 5]';            % origin index vector
ito=  [2 3 5 4 4 1]';            % destiny index vector


r=[ 0.0420  0.0310  0.0530 0.084 0.063 0.031 ]';       % line resistance vector
x=[ 0.1680  0.1260  0.2100 0.336 0.252 0.126 ]';       % line reactance vector
bli=[ 0.0300  0.0200  0.0150 0.012 0.011 0.010 ]';     % line shunt vector
a=[ 1       1       1      1     1     1     ]';       % transformer ratio
phi=[0      0       0      0     0     0     ]';

lf=1.431;                                  % fator de carga
pd= lf*[0.65  1.15  0.7  0.7  0.85]';     % active load vector
qd= lf*[0.30  0.60  0.4  0.3  0.40]'; 


sn=[3.6980 0 2.7000 2.3300 0];  % geradores em três barras
fp=[0.9600 0 0.8500 0.8500 0];
xs=[0.2693 0 0.6296 0.6734 0];

nm=[1 0 1 1 0];            % número de máquinas em cada barra
nt = nb+sum(nm)-sum(nm>0); % número de barras + número de máquinas adicionais nas barras de geração
miv= [1:nt]';              % machine index vector

cap

% Limite de reativos das unidades geradoras
qgmin = zeros(1,nt)';
qgmax = zeros(1,nt)';
qgmin(ger) = limites(1,:);
qgmax(ger) = limites(2,:);

% Calcula limites de reativos das barras
aux = nm>1;
aux = aux.*(nm-1);
is = 1:nb;
for i=2:nb
    is(i:nb) = is(i:nb) + aux(i-1);
end
for i=1:nb
    qgmaxt(i) = sum(qgmax(is(i):is(i)+aux(i)));
    qgmint(i) = sum(qgmin(is(i):is(i)+aux(i)));
end
qgmaxt = qgmaxt';
qgmint = qgmint';

% Limite de ativos das unidades geradoras
pgmax = zeros(nt,1);
pgmin = [2.19 0 1.514 1.398 0]';
pgmaxt = [];
pgmint = [];

% Limites da regiões do custo de potência reativa
qg01 = 0.28*qgmaxt;
qg12 = 0.7*qgmaxt;
qg03 = [0.3 0 0.25 0.25 0]'.*qgmint;
qg34 = 0.7*qgmint;
%%%

bb=      [  1.    0.    2.   2.   0. ]';         % gener. cost quadratic coef.
aa=      [  2.    0.    4.   1.   0. ]';         % gener. cost linear coef.

xx=1.00*ones(nb,1);   % Coef angular da primeira regiao do custo de potencia reativa
yy=2.50*ones(nb,1);   % Coef angular da segunda regiao do custo de potencia reativa
zz=3.64*ones(nb,1);   % Coef angular da terceira regiao do custo de potencia reativa


vmax=    [  1.05  1.05  1.05  1.05  1.05]';	   % max voltage magnitude vector

vmin=    [  0.95  0.95  0.95  0.95  0.95]';    % min voltage magnitude vector

bmax=    [  0.    0.    0.   0.   0. ]';         % max shunt compensation vector
bmin=    [  0.    0.    0.   0.   0. ]';         % min shunt compensation vector

amin=ones(nl,1);
amax=ones(nl,1);
phimin=zeros(nl,1);
phimax=zeros(nl,1);
xmax=x;
xmin=x;
flmax=1./x*0.7;
flmin=-flmax;
warning on

%
% initalization acording to the l. flow solutions
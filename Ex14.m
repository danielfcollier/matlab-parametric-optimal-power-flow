% Romulo, eu nao coloquei a comp. shunt (b) em uma das barras.


%
% EXAMPLE: 5-bus system
%
%    from Stevenson
%
nb=14;                            % number of busses
nl=20;                            % number of lines
biv=[1:nb]';                     % bus index vector
liv=[1:nl]';                     % line index vector

ifrom=[1 1 2 2 2 3 5 4 4 5 6 6 6 7 7 9 9 10 12 13]';            % origin index vector
ito=  [2 5 3 4 5 4 4 7 9 6 11 12 13 8 9 10 14 11 13 14]';            % destiny index vector


r=[ 0.01938 0.05403 0.04699 0.05811 0.05695 0.06701 0.01335 0.000 0.000 0.000 0.09498 ...
    0.12291 0.06615 0.000 0.000 0.03181 0.12711 0.08205 0.22092 0.17093]';       % line resistance vector
x=[ 0.05917 0.22304 0.19797 0.17632 0.17388 0.17103 0.04211 0.20912 0.55618 0.25202...
    0.19890 0.25581 0.13027 0.17615 0.11001 0.08450 0.27038 0.19207 0.19988 0.34802 ]';       % line reactance vector
bli=[ 0.0264 0.0246 0.0219 0.0187 0.0170 0.0173 0.0064 0 0 0 0 0 0 0 0 0 0 0 0 0 ]';     % line shunt vector
a=[ 1       1       1      1     1     1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   ]';       % transformer ratio
phi=[0      0       0      0     0     0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0   ]';

pd= [  0 0.2170 0.9420 0.4780 0.0760 0.1120 0 0 0.2950 0.0900 0.0350 0.0610 0.1350 0.1490]';     % active load vector
qd= [  0 0.1270 0.19 -0.0390 0.0160 0.0750 0 0 0.1660 0.0580 0.0180 0.0160 0.0580 0.0500 ]';     % reactive load vector



pgmax=[5 0.5 0 0 0 0 0 0 0 0 0 0 0 0]';
pgmin=[0 0 0 0 0 0 0 0 0 0 0 0 0 0]';

qgmax=[1 1 1 0 0 1 0 1 0 0 0 0 0 0]';
qgmin=[-1 -1 -1 0 0 -1 0 -1 0 0 0 0 0 0]';
xx=[1 1 1 0 0 1 0 1 0 0 0 0 0 0]';
yy=[3 3 3 0 0 3 0 3 0 0 0 0 0 0]';
zz=[4 4 4 0 0 4 0 4 0 0 0 0 0 0]';
qg01=[0.25 0.25 0.25 0 0 0.25 0 0.25 0 0 0 0 0 0]';
qg12=[0.5 0.5 0.5 0 0 0.5 0 0.5 0 0 0 0 0 0]';
qg03=[-0.25 -0.25 -0.25 0 0 -0.25 0 -0.25 0 0 0 0 0 0]';
qg34=[-0.5 -0.5 -0.5 0 0 -0.5 0 -0.5 0 0 0 0 0 0]';

bb=      [  8 4 0 0 0 0 0 0 0 0 0 0 0 0 ]';         % gener. cost quadratic coef.
aa=      [  8.6 10.5 0 0 0 0 0 0 0 0 0 0 0 0 ]';         % gener. cost linear coef.


vmax=    [  1.05  1.05  1.05  1.05  1.05 1.05 1.05 1.05 1.05 1.05 1.05 1.05 1.05 1.05  ]';	% max voltage magnitude vector

vmin=    [  0.95  0.95  0.95  0.95  0.95 0.95 0.95 0.95 0.95 0.95 0.95 0.95 0.95 0.95 ]';    % min voltage magnitude vector

bmax=    [  0.    0.    0.   0.   0. 0. 0. 0. 0. 0. 0. 0. 0. 0.  ]';         % max shunt compensation vector
bmin=    [  0.    0.    0.   0.   0. 0. 0. 0. 0. 0. 0. 0. 0. 0. ]';         % min shunt compensation vector

amin=ones(nl,1);
amax=ones(nl,1);
phimin=zeros(nl,1);
phimax=zeros(nl,1);
xmax=x;
xmin=x;
flmax=1./x*0.7;
flmin=-flmax;

%
% initalization acording to the l. flow solutions

pginit= [0.0514 0.000 2.1590 1.999 0.000]';
qginit= [1.2569 0.000 1.1661 0.1296 0.000]';
binit= zeros(size(biv));
vinit= [1.020 0.9536 1.030 1.000 0.9710]';
dinit= [0.000 0.0324 0.1862 0.3240 0.0832]';
pginit=sparse(pginit);
qginit=sparse(qginit);
binit=sparse(binit);
ainit=ones(nl,1);
phinit=sparse(nl,1);
xinit=x;
lainit=sparse(nb,1);
gainit=sparse(nb,1);
roinit=sparse(nb,1);
miinit=sparse(nb,1);
qsinit=sparse(nl,1);
etainit=sparse(nl,1);
tauinit=sparse(nl,1);
zeinit=sparse(nb,1);
ioinit=sparse(nb,1);
beinit=sparse(nb,1);
alinit=ones(size(biv))*(-sum(2.*bb.*(pgmax+pgmin)./2+aa)./nb);


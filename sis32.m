%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              %
%     Dados do sistema equivalente da          %
%     região Sul do brasil - 32 barras         %
%                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----  DADOS DAS LINHAS DE TRANSMISSÃO  -----

% b_origem  b_final  circ  R  X  C  a  amin  amax
LT = [                                                           
                                                                 
 1   11  1    .0306   .1165      .2702     0.000  0.000  0.000;  
 1   11  1    .0306   .1165      .2702     0.000  0.000  0.000;  
 1   2   1    .0316   .1621      .2784     0.000  0.000  0.000;  
 1   2   1    .0316   .1621      .2784     0.000  0.000  0.000;  
 2   3   1    .0172   .0854      .1434     0.000  0.000  0.000;  
 2   3   1    .0172   .0854      .1434     0.000  0.000  0.000;  
 3   4   1    .0463   .2378      .4080     0.000  0.000  0.000;  
 3   4   1    .0463   .2378      .4080     0.000  0.000  0.000;  
 4   5   1    .0386   .1987      .3400     0.000  0.000  0.000;  
 4   12  1    .0158   .0824      .1375     0.000  0.000  0.000;  
 4   12  1    .0158   .0824      .1375     0.000  0.000  0.000;  
 5   6   1    .0096   .1002      .0840     0.000  0.000  0.000;  
 5   6   1    .0096   .1002      .0840     0.000  0.000  0.000;  
 6   7   1    .0325   .1650      .2869     0.000  0.000  0.000;  
 7   8   1    .0154   .0852      .1250     0.000  0.000  0.000;  
 7   8   1    .0154   .0852      .1250     0.000  0.000  0.000;  
 7   9   1    .0065   .0823      .3740     0.000  0.000  0.000;  
 8   9   1    .0162   .0932      .1612     0.000  0.000  0.000;  
 8   9   1    .0162   .0932      .1602     0.000  0.000  0.000;  
 9   10  1    .0204   .1046      .1808     0.000  0.000  0.000;  
 9   11  1    .0468   .2395      .4138     0.000  0.000  0.000;  
10   11  1    .0353   .1809      .3125     0.000  0.000  0.000;  
11   15  1    .0000   .0125      .0000     1.000  0.900  1.100;  
15   13  1    .0016   .0201     2.458      0.000  0.000  0.000;  
13   14  1    .0015   .0194     2.370      0.000  0.000  0.000;  
14   30  1    .0005   .0070     8.049      0.000  0.000  0.000;  
15   16  1    .0022   .0273     3.340      0.000  0.000  0.000;  
15   16  1    .0024   .0298     3.630      0.000  0.000  0.000;  
16   9   1    .0000   .0125      .0000     1.000  0.900  1.090;  
16   9   1    .0000   .0125      .0000     1.000  0.900  1.100;  
15   17  1    .0016   .0205     2.502      0.000  0.000  0.000;  
17   18  1    .0025   .0309     3.777      0.000  0.000  0.000;  
18   12  1    .0000   .0125      .0000     1.000  0.900  1.100;  
18   12  1    .0000   .0125      .0000     1.000  0.900  1.100;  
 6   19  1    .0228   .1183      .2030     0.000  0.000  0.000;  
 7   19  1    .0253   .1313      .2250     0.000  0.000  0.000;  
 6   20  1    .0042   .0590      .0000     0.000  0.000  0.000;  
19   21  1    .0062   .0621      .0000     0.000  0.000  0.000;  
20   21  1    .0666   .2683      .728      0.000  0.000  0.000;  
21   22  1    .0029   .0118      .1300     0.000  0.000  0.000;  
22   23  1    .0246   .1048      .2500     0.000  0.000  0.000;  
23   24  1    .0269   .1181      .274      0.000  0.000  0.000;  
24   25  1    .0461   .1872      .5090     0.000  0.000  0.000;  
 8   25  1    .0020   .0316      .000      0.000  0.000  0.000;  
 7   26  1    .0020   .1152      .0000     0.000  0.000  0.000;  
16   26  1    .0127   .1603     1.959      0.000  0.000  0.000;  
14   27  1    .0172   .2170     2.652      0.000  0.000  0.000;  
18   27  1    .0315   .3977     4.857      0.000  0.000  0.000;  
13   28  1    .0011   .1394     1.703      0.000  0.000  0.000;  
14   29  1    .0008   .0108     1.281      0.000  0.000  0.000;  
27   32  1    .0020   .0276     2.853      0.000  0.000  0.000;  
31   32  1    .0012   .0163     1.689      0.000  0.000  0.000;  
30   15  1    .0005   .0070     8.049      0.000  0.000  0.000;  
17   27  1    .0009   .0122     1.505      0.000  0.000  0.000;                                                                   
];                                                               



%-----  DADOS DAS BARRAS  -----

% barra  Tipo  V  ang  Pg  Qg  Qgmin  Qgmax  Pd  Qd  shunt

barras = [                                                                             
 1  1  1.05  0.0    8.400  0.0  -2.00    2.00     2.1500     -.3500            0.000 ;   
 2  0  0.00  0.0       00  0.0   0.0     0.0      2.7800      .0500            0.000 ;   
 3  1  1.04  0.0    1.000  0.0  -1.00    1.00     1.3860      .260             0.000 ;   
 4  0  0.00  0.0       00  0.0   0.0     0.0      2.6700      .0150            0.000 ;   
 5  0  0.00  0.0       00  0.0   0.0     0.0      1.5500      .7400            0.000 ;   
 6  1  1.04  0.0    2.000  0.0  -3.00    2.50     1.2700      .6200            0.000 ;   
 7  0  0.00  0.0       00  0.0   0.0     0.0      2.3700      .9500            0.000 ;   
 8  0  0.00  0.0       00  0.0   0.0     0.0      2.5600      1.150            0.000 ;   
 9  0  0.00  0.0       00  0.0   0.0     0.0      5.0000     2.0000            0.000 ;   
10  0  0.00  0.0       00  0.0   0.0     0.0      1.0800      .2700            0.000 ;   
11  0  0.00  0.0       00  0.0   0.0     0.0      1.4700      .1500            0.000 ;   
12  0  0.00  0.0       00  0.0     0     0        7.5000     1.8200             2.00 ;   
13  2  1.00  0.0       00  0.0  -3.55    3.50      .0         .0               -2.00 ;   
14  1  1.03  0.0    6.000  0.0  -1.50    5.00      .0         .0                0.000;   
15  1  1.03  0.0    10.00  0.0  -6.00    5.00      .0         .0                0.000;   
16  0  0.00  0.0       00  0.0   0.0     0.0       .0         .0               -3.00 ;   
17  0  0.00  0.0       00  0.0   0.0     0.0      2.8100      .5300            -2.00 ;   
18  0  0.00  0.0       00  0.0   0.0     0.0        .0        .000             -3.00 ;   
19  0  0.00  0.0       00  0.0   0.0     0.0        .0        .000              0.000;   
20  0  0.00  0.0       00  0.0     0      0        .2535     -.0858             0.000;   
21  0  0.00  0.0       00  0.0   0.0     0.0       .32880     .25980            0.000;   
22  0  0.00  0.0       00  0.0   0.0     0.0       .31440     .22400            0.000;   
23  0  0.00  0.0       00  0.0   0.0     0.0       .20200     .10480            0.000;   
24  0  0.00  0.0       00  0.0   0.0     0.0       .24090     .0987             0.000;   
25  0  0.00  0.0       00  0.0   0.0     0.0       .93210     .27800            0.000;   
26  0  0.00  0.0       00  0.0     0       0       .0        .0                0.000;   
27  1  1.02  0.0    0.800  0.0  -4.50    3.50       .0        .0               -1.500;   
28  0  0.00  0.0       00  0.0   0.0     0.0      2.6000      .2200             0.000;   
29  1  1.00  0.0    3.000  0.0  -4.50    3.50       .0        .00               0.000;   
30  1  1.00  0.0    3.000  0.0 -10.00    3.50       .0        .00               0.000;   
31  1  1.00  0.0    10.00  0.0  -2.50    2.50       .0        .00               0.000;   
32  0  0.00  0.0       00  0.0   0.0     0.0      3.8466      .3000             0.000;   
 
];

%-----  LIMITES  -----

% Barra  Vmin  Vmax  Pgmin  Pgmax

Lim = [                                       
                                              
  1  0.95  1.05  0.0   9.000  200.00  37.5  ;       
  2  0.95  1.05  0.0    .000  175.00 175.00 ;       
  3  0.95  1.05  0.0   6.500   000.00 000.00 ;       
  4  0.95  1.05  0.0    .000  000.00 000.00 ;       
  5  0.95  1.05  0.0    .000  100.00 625.00 ;       
  6  0.95  1.05  0.0   4.500  000.00 000.00 ;       
  7  0.95  1.05  0.0    .000  000.00 000.00 ;       
  8  0.95  1.05  0.0    .000  325.00  85.00 ;       
  9  0.95  1.05  0.0    .000  000.00 000.00 ;       
 10  0.95  1.05  0.0    .000  000.00 000.00 ;       
 11  0.95  1.05  0.0    .000  300.00 250.00 ;       
 12  0.95  1.05  0.0    .000  000.00 000.00 ;       
 13  0.95  1.05  0.0   9.250  300.00 250.00 ;       
 14  0.95  1.05  0.0   9.250  000.00 000.00 ;       
 15  0.95  1.05  0.0   9.250  000.00 000.00 ;       
 16  0.95  1.05  0.0    .000  000.00 000.00 ;       
 17  0.95  1.05  0.0    .000  000.00 000.00 ;       
 18  0.95  1.05  0.0    .000  000.00 000.00 ;       
 19  0.95  1.05  0.0    .000  000.00 000.00 ;       
 20  0.95  1.05  0.0    .000  000.00 000.00 ;       
 21  0.95  1.05  0.0    .000  000.00 000.00 ;       
 22  0.95  1.05  0.0    .000  000.00 000.00 ;       
 23  0.95  1.05  0.0    .000  000.00 000.00 ;       
 24  0.95  1.05  0.0    .000  000.00 000.00 ;       
 25  0.95  1.05  0.0    .000  000.00 000.00 ;       
 26  0.95  1.05  0.0    .000  000.00 000.00 ;       
 27  0.95  1.05  0.0   7.500  000.00 000.00 ;       
 28  0.95  1.05  0.0    .000  000.00 000.00 ;       
 29  0.95  1.05  0.0   6.500  000.00 000.00 ;       
 30  0.95  1.05  0.0   6.500  000.00 000.00 ;       
 31  0.95  1.05  0.0  10.000  000.00 000.00 ;       
 32  0.95  1.05  0.0    .000  000.00 000.00 ;       

 ];     

%%%   DADOS GERAIS  %%%%
warning off
nb=32;         % numero de barras
nl=54;         % numero de linhas
biv=[1:nb]';
liv=[1:nl]';
ifrom=LT(:,1);
ito=LT(:,2);
r=LT(:,4);
x=LT(:,5);
bli=LT(:,6);
a=ones(nl,1);
phi=zeros(nl,1);

pd=barras(:,9);
qd=barras(:,10);

vmax=Lim(:,3);
vmin=Lim(:,2);
bmax=(barras(:,11));
bmin=(barras(:,11));
amin=ones(nl,1);
amax=ones(nl,1);
iafree=find(LT(:,9)-LT(:,8));
amin(iafree)=LT(iafree,8);
amax(iafree)=LT(iafree,9);
amin(29)=1.09;
amin(30)=1.1;
amin([23 33 34]')= [1.0115 1.036 1.036]';
amax([23 33 34]')= [1.0115 1.036 1.036]';

phimin=zeros(nl,1);
phimax=zeros(nl,1);
flmax=1./x*0.7;
flmin=-flmax;

bb=[.1 0 3 0 0 3  0 0 0 0 0 0  .1   .1  .1  0 0 0 0 0 0 0 0 0 0 0  3   0  .1  .5  3   0]';
aa=[ 1 0 5 0 0 4 0 0 0 0 0 0    1    1   1  0 0 0 0 0 0 0 0 0 0 0  4   0   1   1  6   0]';


pfmax=zeros(32,1);
pfmin=zeros(32,1);
qfmax=zeros(32,1);
qfmin=zeros(32,1);

xmin=x;
xmax=x;

% generators data
nm=sparse(zeros(nb,1));       % número de máquinas em cada barra
sn=[];
fp=[];
xs=[];
pgrmax=[]; pgrmin=[]; qgrmax=[]; qgrmin=[];

% UHE Salto Osorio 
nm(1)=6;                     % max=6
aux1=[1.90 1.91 1.90 1.89 1.88 1.92];
aux2=0.957*ones(1,6);
aux3=[0.65 0.64 0.66 0.65 0.655 0.66];
n=nm(1);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=1.82*ones(1,6);
aux2=1.20*ones(1,6);
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=0.55*ones(1,6);
aux4=-0.37*ones(1,6);
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Barras sem geração
sn=[sn zeros(1,3-1-1)];
fp=[fp zeros(1,3-1-1)];
xs=[xs zeros(1,3-1-1)];
pgrmax=[pgrmax zeros(1,3-1-1)];
pgrmin=[pgrmin zeros(1,3-1-1)];
qgrmax=[qgrmax zeros(1,3-1-1)];
qgrmin=[qgrmin zeros(1,3-1-1)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% UHE Passo Fundo
nm(3)=2;                     % max=2   
aux1=[1.30 1.32];
aux2=0.97*ones(1,2);
aux3=[1.22 1.25];
n=nm(3);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=[1.26 1.26];
aux2=[0.70 0.70];
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=[0.32 0.32];
aux4=-[0.29 0.29];
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Barras sem geração
sn=[sn zeros(1,6-3-1)];
fp=[fp zeros(1,6-3-1)];
xs=[xs zeros(1,6-3-1)];
pgrmax=[pgrmax zeros(1,6-3-1)];
pgrmin=[pgrmin zeros(1,6-3-1)];
qgrmax=[qgrmax zeros(1,6-3-1)];
qgrmin=[qgrmin zeros(1,6-3-1)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% UTE Jorge Lacerda 
nm(6)=7;                     % max=7   
aux1=[0.55 0.56 0.76 0.74 1.56 1.55 4.12];
aux2=[0.90 0.90 0.88 0.88 0.95 0.95 0.95];
aux3=[3.04 3.05 2.20 2.20 1.50 1.50 0.56];
n=nm(6);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=[0.50 0.50 0.66 0.66 1.31 1.31 3.63];
aux2=[0.25 0.25 0.33 0.33 0.80 0.80 1.80];
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=[.24 .24  0.35 0.35 0.47 0.47 1.28];
aux4=-[.22 .22 0.34 0.34 0.47 0.47 1.18];
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Barras sem geração
sn=[sn zeros(1,13-6-1)];
fp=[fp zeros(1,13-6-1)];
xs=[xs zeros(1,13-6-1)];
pgrmax=[pgrmax zeros(1,13-6-1)];
pgrmin=[pgrmin zeros(1,13-6-1)];
qgrmax=[qgrmax zeros(1,13-6-1)];
qgrmin=[qgrmin zeros(1,13-6-1)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SE Ivaiporã - equivalentada com 5 máquinas (poderia ser com uma)
nm(13)=5;                     % max=5   
aux1=[1.90 1.91 1.90 1.89 1.92];
aux2=0.957*ones(1,6);
aux3=[0.64 0.645 0.63 0.64 0.645];
n=nm(13);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=1.82*ones(1,5);
aux2=1.20*ones(1,5);
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=0.55*ones(1,5);
aux4=-0.37*ones(1,5);
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];


% UHE Salto Santiago 
nm(14)=4;                     % max=4   
aux1=[3.70 3.69 3.68 3.72];
aux2=0.96*ones(1,4);
aux3=[0.27 0.26 0.27 0.28];
n=nm(14);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=3.55*ones(1,4);
aux2=2.20*ones(1,4);
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=1.05*ones(1,4);
aux4=-1.10*ones(1,4);
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];

% UHE Foz do Areia
nm(15)=4;                     % max=4   
aux1=[4.65 4.64 4.63 4.67];
aux2=0.90*ones(1,4);
aux3=[0.120 0.110 0.125 0.115];
n=nm(15);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=4.185*ones(1,4);
aux2=2.40*ones(1,4);
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=2.00*ones(1,4);
aux4=-2.00*ones(1,4);
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];

%%%%%%%%%%%%%%%%%%%%%%%%%
% Barras sem geração
sn=[sn zeros(1,27-15-1)];
fp=[fp zeros(1,27-15-1)];
xs=[xs zeros(1,27-15-1)];
pgrmax=[pgrmax zeros(1,27-15-1)];
pgrmin=[pgrmin zeros(1,27-15-1)];
qgrmax=[qgrmax zeros(1,27-15-1)];
qgrmin=[qgrmin zeros(1,27-15-1)];
%%%%%%%%%%%%%%%%%%%%%%%%%

% UHE Ita 
nm(27)=5;                     % max=5   
aux1=[3.05 3.06 3.07 3.04 3.03];
aux2=0.95*ones(1,5);
aux3=[0.32 0.30 0.31 0.33 0.34];
n=nm(27);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=2.90*ones(1,5);
aux2=1.70*ones(1,5);
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=0.95*ones(1,5);
aux4=-0.95*ones(1,5);
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];

%%%%%%%%%%%%%%%%%%%%%%%%%
% Barras sem geração
sn=[sn zeros(1,29-27-1)];
fp=[fp zeros(1,29-27-1)];
xs=[xs zeros(1,29-27-1)];
pgrmax=[pgrmax zeros(1,29-27-1)];
pgrmin=[pgrmin zeros(1,29-27-1)];
qgrmax=[qgrmax zeros(1,29-27-1)];
qgrmin=[qgrmin zeros(1,29-27-1)];
%%%%%%%%%%%%%%%%%%%%%%%%

% UHE Salto Caxias 
nm(29)=3;                     % max=3   
aux1=[3.45 3.46 3.47];
aux2=0.90*ones(1,3);
aux3=[0.22 0.20 0.21];
n=nm(29);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=3.10*ones(1,3);
aux2=2.35*ones(1,3);
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=1.50*ones(1,3);
aux4=-1.50*ones(1,3);
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];


% UHE Salto Segredo
nm(30)=4;                     % max=4
aux1=[3.30 3.28 3.31 3.32];
aux2=0.90*ones(1,4);
aux3=[0.265 0.265 0.27 0.275];
n=nm(30);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=3.15*ones(1,4);
aux2=1.80*ones(1,4);
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=1.33*ones(1,4);
aux4=-1.00*ones(1,4);
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];

% UHE Garabi
nm(31)=3;                     % max=3
aux1=[3.30 3.05 3.03];
aux2=[0.90 0.95 0.95];
aux3=[0.265 0.32 0.34];
n=nm(31);
sn=[sn aux1(1:n)];
fp=[fp aux2(1:n)];
xs=[xs aux3(1:n)];
% Limites retangulares do fluxo de potência convencional
%  usados para a comparação da abordagem com carta
aux1=[3.15 2.90 2.90];
aux2=[1.80 1.70 1.70];
pgrmax=[pgrmax aux1(1:n)];
pgrmin=[pgrmin aux2(1:n)];
aux3=[1.33 0.95 0.95];
aux4=-[1.00 0.95 0.95];
qgrmax=[qgrmax aux3(1:n)];
qgrmin=[qgrmin aux4(1:n)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Barras sem geração
sn=[sn zeros(1,32-31)];
fp=[fp zeros(1,32-31)];
xs=[xs zeros(1,32-31)];
pgrmax=[pgrmax zeros(1,32-31)];
pgrmin=[pgrmin zeros(1,32-31)];
qgrmax=[qgrmax zeros(1,32-31)];
qgrmin=[qgrmin zeros(1,32-31)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nt=nb+sum(nm)-sum(nm>0);      % número de máquinas 
nt=full(nt);
miv=[1:nt]';                  % machine index vector

% curvas de capabilidade
cap

% Limites de reativos nas unidades geradoras
qgmin=zeros(nt,1);
qgmax=zeros(nt,1);
qgmin(ger)=limites(1,:);
qgmax(ger)=limites(2,:);

% Calcula limites das barras
pgrmaxt=zeros(nb,1);
pgrmint=zeros(nb,1);
qgrmaxt=zeros(nb,1);
qgrmint=zeros(nb,1);

aux=nm>1;
aux=aux.*(nm-1);
is=1:nb;
for i=2:nb
    is(i:nb)=is(i:nb)+aux(i-1);
end
for i=1:nb
    qgmaxt(i)=sum(qgmax(is(i):is(i)+aux(i)));
    qgmint(i)=sum(qgmin(is(i):is(i)+aux(i)));
    qgrmaxt(i)=sum(qgrmax(is(i):is(i)+aux(i)));
    qgrmint(i)=sum(qgrmin(is(i):is(i)+aux(i)));
    pgrmaxt(i)=sum(pgrmax(is(i):is(i)+aux(i)));
    pgrmint(i)=sum(pgrmin(is(i):is(i)+aux(i)));
    snt(i)=sum(sn(is(i):is(i)+aux(i)));
end
qgmaxt=qgmaxt';
qgmint=qgmint';

% Limite de ativos das unidades geradoras
pgmax=sparse(zeros(nt,1));
pgmin=sparse(zeros(nt,1));
pgmaxt=[];
pgmint=[];

% Limites das regiões do custo de potência reativa
qg01=0.25*qgmaxt;
qg12=0.7*qgmaxt;
qg03=0.25*qgmint;
qg34=0.7*qgmint;

% Coeficientes das curvas de custo de geração                          
xx=1.00*ones(nb,1);           % Coef angular da primeira regiao do custo de potencia reativa
yy=2.50*ones(nb,1);           % Coef angular da segunda regiao do custo de potencia reativa
zz=3.64*ones(nb,1);           % Coef angular da terceira regiao do custo de potencia reativa

warning on
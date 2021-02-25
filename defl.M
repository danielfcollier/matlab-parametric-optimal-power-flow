%
% first and second order derivatives of line flows
%
aux=diag(vc);
bux=Af'*vc;
cux=A'*conj(vc);
dux=diag(conj(yl));
eux=conj(aux);
fux=diag(bux)*dux*A';
gux=diag(dux*cux);
hux=gux*Af';
%
% first order
%
dslv=fux*auz + hux*auy;
dsld=j*(-fux*eux + hux*aux);
dfld=real(dsld);
dflv=real(dslv);
%
% second order
%
iiux=A*dux*diag(sigma)*Af';
jux=auz*iiux*auy;
dslvv=jux + jux.';
dflvv=real(dslvv);

kux=eux*iiux*aux;
lux=diag(iiux*vc);
mux=diag(iiux.'*conj(vc));

dsldd=kux + kux.' - lux*eux - mux*aux;
dfldd=real(dsldd);
dslvd=j*(-eux*iiux*auy - lux*auz + aux*iiux.'*auz + mux*auy);
dflvd=real(dslvd);

clear aux bux cux dux eux fux gux hux iiux jux kux lux mux


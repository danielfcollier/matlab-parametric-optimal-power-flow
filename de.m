%
%  Lagrangean first and second order derivatives
%
%%%%%%%%%%%%%%%%%%%%%%%
%  auxiliar matrices  %
%%%%%%%%%%%%%%%%%%%%%%%
%
vc=v.*exp(j*d);                     % complex voltages
aux=diag(conj(y)*conj(vc));
auy=diag(exp(j*d));
auz=diag(exp(-j*d));
bux=aux*auy;
cux=aux*diag(vc);
dux=diag(vc)*conj(y);
eux=dux*diag(conj(vc));
fux=dux*auz;
gux=diag(conj(vc))*y'*auy;
hux=auy*conj(y)*auz;
%
%%%%%%%%%%%%%%%%%%%%%%%
%  first derivatives  %
%%%%%%%%%%%%%%%%%%%%%%%
%
dsv=bux+fux;                        % complex power wrt the voltage magnitude
dpv=real(dsv);                      % active power wrt voltage magnitudes
dqv=imag(dsv);                      % reactive power wrt voltage magnitudes
dsd=j*(cux-eux);                    % complex power wrt voltage angles
dpd=real(dsd);                      % active power wrt voltage angles
dqd=imag(dsd);                      % reactive power wrt voltage angles
%
%%%%%%%%%%%%%%%%%%%%%%%%
%  second derivatives  %
%%%%%%%%%%%%%%%%%%%%%%%%
%
% 2nd order derivatives of the Lagrangean wrt the voltage magnitudes
%
pux=diag(alpha)*hux;
qux=diag(beta)*hux;
dlvv=2*w3*speye(nb)-real(pux+pux.')-imag(qux+qux.')+diag(2*b.*beta);
%
% 2nd order derivatives of the Lagrangean wrt the voltage angles
%
rux=diag(alpha)*eux;
sux=diag(beta)*eux;
tux=-cux*diag(alpha)+rux+rux.'-diag(dux.'*alpha)*diag(conj(vc));
uux=-cux*diag(beta)+sux+sux.'-diag(dux.'*beta)*diag(conj(vc));
dldd=-real(tux)-imag(uux);
%
% 2nd order derivatives of the Lagrangean wrt voltage magnitudes and angles
%
vux=j*(bux*diag(alpha)+diag(alpha)*fux-gux*diag(alpha)-diag(dux.'*alpha)*auz);
xux=j*(bux*diag(beta)+diag(beta)*fux-gux*diag(beta)-diag(dux.'*beta)*auz);
dlvd=-real(vux)-imag(xux);
%
% 2nd order derivatives of the Lagrangean wrt voltage magnitudes and shunt
%
dlvb=diag(2*beta.*v);

clear aux bux cux dux eux fux gux hux pux qux rux sux tux uux vux xux
%
% addition of terms related to the line flows
%
if nfllim~=0
	defl				% derivatives of line flows
	dlvv= dlvv+dflvv;
	dldd= dldd+dfldd;
	dlvd=dlvd+dflvd;
end

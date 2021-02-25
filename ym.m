%
% Bus Admittance Matrix
%
t=sparse(a.*exp(j*phi));
y=sparse(nb,nb);
for line=1:nl,
        k1=ifrom(line);
        k2=ito(line);
        aux=-(1/(r(line)+j*x(line)));
        y(k1,k2)=y(k1,k2)+conj(t(line))*aux;
        y(k1,k1)=y(k1,k1)-(a(line)^2)*aux+j*bli(line)/2;
        y(k2,k2)=y(k2,k2)-aux+j*bli(line)/2;
        y(k2,k1)=y(k2,k1)+t(line)*aux;
end
yl=1./(r+j*x);
yl=sparse(yl);
%
% incidence matrix
%
if nl >= nb
	aux=eye(nb,nl);
	A=sparse(aux(:,ifrom)-aux(:,ito));
	Af=sparse(aux(:,ifrom));
	At=sparse(aux(:,ito));
else
	A= sparse(nb,nl);
	Af=sparse(nb,nl);
	At=sparse(nb,nl);
	for line=[1:nl];
        k1=ifrom(line);
		k2=ito(line);
		A(k1,line)=1;
		A(k2,line)=-1;
		Af(k1,line)=1;
		At(k2,line)=1;
	end
end
auxlin=diag(conj(yl))*diag(t)*(diag(conj(t))*Af'-At');
clear aux

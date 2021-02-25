%
% active constraints set check
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check of inequality lim. for reactive power %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
iqgvli=[];
iqgvls=[];
irvli=[];
irvls=[];
if klt==0
	qg(iqgfree)=imag(s(iqgfree))+qd(iqgfree)-(1-epsilon)*eqlim(iqgfree);
else
	qg(iqgfree)=imag(s(iqgfree))+qd(iqgfree);
end
% checking free limits

im=find(qg(iqgfree) < qgmin(iqgfree));
if length(im) ~= 0 & length(iqgfree) ~= 0,
	iif=iqgfree(im);
	iqgvli=iif;
        disp('Reactive power generation below the minimum in bus')
        disp(iif')
        disp(qg(iif)')
        change=change+length(iif);
        violv=[violv;qgmin(iif)-qg(iif)];
end

im=find(qg(iqgfree) > qgmax(iqgfree));
if length(im) ~= 0 & length(iqgfree) ~= 0,
	iif=iqgfree(im);
	iqgvls=iif;
        disp('Reactive power generation above the maximum in bus')
        disp(iif')
        disp(qg(iif)')
        change=change+length(iif);
        violv= [violv;qg(iif)-qgmax(iif)];
end

% checking active limits

im=find(ro(im1) > 0);
if length(im) ~= 0 & length(im1) ~= 0,
	iiff=im1(im);
	iif=iqgnf(iiff);
	irvli=iif;
        disp('Lagrange multiplier wrt reactive generation at lower limit')
        disp(iif')
        disp(ro(iiff)')
        change=change+length(iif);
        violv=[violv;ro(iiff)];
end

im=find(ro(im2) < 0);
if length(im) ~= 0 & length(im2) ~= 0,
	iiff=im2(im);
	iif=iqgnf(iiff);
	irvls=iif;
        disp('Lagrange multiplier wrt reactive generation at upper limit')
        disp(iif')
        disp(ro(iiff)')
        change=change+length(iif);
        violv=[violv;ro(iiff)];
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check ineq. lim. for active power flows %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
iflvli=[];
iflvls=[];
isvli=[];
isvls=[];

if klt==0
	fl(iflfree)=full(real(sl(iflfree))-(1-epsilon)*efl(iflfree));
else
	fl(iflfree)=(real(sl(iflfree)));
end

ican= find(abs(fl(iflfree)) > 0.8*flmax(iflfree));
if length(ican)~=0
	iican=iflfree(ican);
end

% checking free limits

im=find(fl(iflfree) < flmin(iflfree));
if length(im) ~= 0 & length(iflfree) ~= 0,
	iif=iflfree(im);
	iflvli=iif;
        disp('Line flow below the minimum on line')
        disp(iif')
        disp(fl(iif)')
        change=change+length(iif);
        violv=[violv;flmin(iif)-fl(iif)];
end

im=find(fl(iflfree) > flmax(iflfree));
if length(im) ~= 0 & length(iflfree) ~= 0,
	iif=iflfree(im);
	iflvls=iif;
        disp('Line flow above the maximum on line')
        disp(iif')
        disp(fl(iif)')
        change=change+length(iif);
        violv= [violv;fl(iif)-flmax(iif)];
end

im=find(sigma(iflmin) > 0);
if length(im) ~= 0 & length(iflmin) ~= 0,
	iif=iflmin(im);
	isvli=iif;
        disp('Lagrange multiplier wrt line flow at lower limit')
        disp(iif')
        disp(sigma(iif)')
        change=change+length(iif);
        violv=[violv;sigma(iif)];
end

im=find(sigma(iflmax) < 0);
if length(im) ~= 0 & length(iflmax) ~= 0,
	iif=iflmax(im);
	isvls=iif;
        disp('Lagrange multiplier wrt line at upper limit')
        disp(iif')
        disp(sigma(iif)')
        change=change+length(iif);
        violv=[violv;sigma(iif)];
end

%
%       Restricted hessian eigenvalues
%
nfree=nb+nvfree+nbfree+npgfree+nqgfree;

if w5~=0
    nfree=nfree+nqg1free+nqg2free+nqg3free+nqg4free+nqg5free+nqg6free;
end

nnew= [1:slack-1,slack+1:nfree];
A1=H(nnew,nnew);

if w5~=0
    B=H(nfree+1:nfree+2*nb+nqgfreeot+nfllim,nnew);
else
    B=H(nfree+1:nfree+2*nb+nfllim,nnew);
end

C=null(full(B));

if isempty(C)
   evalue=0;
   eigmin=0;
else
   D=C'*A1*C;
   evalue=eig(D);
   eigmin=min(evalue);
end

clear A1 B C D

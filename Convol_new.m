
function [pn,AN]=Convol(ddp,pt,PA)
%ddp=0.5;
pn=0.1*(0:1:100);
PAS=spline(pt,PA,pn);
PAS=PAS';
p=pn;
DIM=max(size(PAS));
nn1=DIM;
dp1=p(2)-p(1);
A=zeros(2*nn1-1,1);
A(nn1:2*nn1-1)=PAS(1:nn1);
A(nn1:-1:1)=A(nn1:2*nn1-1);
ex=1/(4*sqrt(log(2))/ddp)^2;
M=max(size(A));
deltapx=dp1;
rx1 = mod( 1/2 + (0:(M-1))/M , 1 ) - 1/2;
rx = rx1*(2*pi/deltapx);
Tr=exp(ex*(-rx.*rx));
Afil=ifft(Tr'.*fft(A));
AY=real(Afil);
AN=AY(nn1:2*nn1-1);
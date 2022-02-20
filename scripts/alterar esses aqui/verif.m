h = 0.12288;
c2 = 373.21;
lx = 7;
lx_cm = lx*100;
ly = 7;
ly_cm = ly*100;
rhostell = 7860;
custo_concreto = h*c2*lx*ly*2;

asx = 11.25;
asy = 10.59;
asxx = 18.22;
c1 = 7.28;
custo_stell = (rhostell*((2*asx*lx_cm*ly) + (2*asy*ly_cm*lx) + 0.5*asxx*lx_cm*ly))/10e6;

ctotal = custo_stell + custo_concreto;
cd = 1e6
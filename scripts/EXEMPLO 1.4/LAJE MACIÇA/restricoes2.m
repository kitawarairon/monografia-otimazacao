% ---
% TABELAS DO MOMENTOS
% ---
% AP�NDICE A
mix = 3.94;
miy = 3.07;
% ---
% MOMENTO SOLICITANTE
% ---
msocposx = (mix*p*(lx^2))/100;  % momento positivo na dire��o x [kNm/m]
msocposy = (miy*p*(lx^2))/100;  % momento postitivo na dire��o y [kNm/m]
% ---
% MOMENTO RESISTENTE
% ---
% mres = (0.68*x*d-0.272x^2)*bw*fcd;
mresposx = ((0.68*x4*d) - (0.272*(x4^2)))*bw*fcd;  % momento postivo x [kNm/m]
mresposy = ((0.68*x5*d) - (0.272*(x5^2)))*bw*fcd;  % momento positivo y [kNm/m]
% ---
% RESTRI��ES DE DESIGUALDADE("<=")[g]
% ---
g(1) = msocposx - mresposx; % restri��o do momento em x
g(2) = msocposy - mresposy; % restri��o do momento em y 
g(3) = x4/d - 0.45; % restri��o superior da linha neutra
g(4) = x5/d - 0.45; % restri��o superior da linha neutra
g(5) = -x4/d + 0.259; % restri��o inferior da linha neutra
g(6) = -x5/d + 0.259; % restri��o inferior da linha neutra
g(7) = x2 - (400*bw*x1); % restri��o da armadura m�xima
g(8) = x3 - (400*bw*x1); % restri��o da armadura m�xima
g(9) = -x2 + romin*bw*x1*100; % restri��o da armadura m�nima
g(10) = -x3 + romin*bw*x1*100; % restri��o da armadura m�nima
% ---
% RESTRI��ES DE IGUALDADE ("=")[h]
% ---
h(1) = x2 - ((0.85*fcd*bw*0.8*x4)/fyd); % restri��es As - 0.85fcdbwx/fyd
h(2) = x3 - ((0.85*fcd*bw*0.8*x5)/fyd); % restri��es As - 0.85fcdbwx/fyd
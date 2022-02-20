% ---
% TABELAS DO MOMENTOS
% ---
% ANEXO A
mix = 3.94;
mineg = 8.52;
miy = 3.07;
% ---
% MOMENTO SOLICITANTE
% ---
msocposx = (mix*p*(lx^2))/100;  % momento positivo na dire��o x [kNm/m]
msocneg = (mineg*p*(lx^2))/100; % momento negativo [kNm/m]
msocposy = (miy*p*(lx^2))/100;  % momento postitivo na dire��o y [kNm/m]
% ---
% MOMENTO RESISTENTE
% ---
mresposx = ((0.68*x5*d) - (0.272*(x5^2)))*bw*fcd;  % momento postivo x [kNm/m]
mresneg = ((0.68*x7*d) - (0.272*(x7^2)))*bw*fcd;   % momento negativo  [kNm/m]
mresposy = ((0.68*x6*d) - (0.272*(x6^2)))*bw*fcd;  % momento positivo y [kNm/m]
% ---
% RESTRI��ES DE DESIGUALDADE("<=")
% ---
g(1) = msocposx - mresposx; % restri��o do momento solicitante <= momento resistente em x
g(2) = msocneg - mresneg;   % restri��o do momento solicitante <= momento resistente no engastE
g(3) = msocposy - mresposy; % restri��o do momento solicitante <= momento resistente em y
g(4) = x5/d - 0.45; % restri��o superior da linha neutra
g(5) = x6/d - 0.45; % restri��o superior da linha neutra
g(6) = x7/d - 0.45; % restri��o superior da linha neutra
g(7) = -x5/d + 0.259; % restri��o inferior da linha neutra
g(8) = -x6/d + 0.259; % restri��o inferior da linha neutra
g(9) = -x7/d + 0.259; % restri��o inferior da linha neutra
g(10) = x2 - (400*bw*x1); % restri��o da armadura m�xima
g(11) = x3 - (400*bw*x1); % restri��o da armadura m�xima
g(12) = x4 - (400*bw*x1); % restri��o da armadura m�xima
g(13) = -x2 + romin*bw*x1*100; % restri��o da armadura m�nima
g(14) = -x3 + romin*bw*x1*100; % restri��o da armadura m�nima
g(15) = -x4 + romin*bw*x1*100; % restri��o da armadura m�nima
% ---
% RESTRI��ES DE IGUALDADE ("=")
% ---
h(1) = x2 - ((0.85*fcd*bw*0.8*x5)/fyd); % restri��es As - 0.85fcdbwx/fyd
h(2) = x3 - ((0.85*fcd*bw*0.8*x6)/fyd); % restri��es As - 0.85fcdbwx/fyd
h(3) = x4 - ((0.85*fcd*bw*0.8*x7)/fyd); % restri��es As - 0.85fcdbwx/fyd

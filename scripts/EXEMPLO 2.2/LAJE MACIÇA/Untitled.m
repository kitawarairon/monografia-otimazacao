% ---
% TABELAS DO MOMENTOS
% ---
% ANEXO "A"
% ---
% MOMENTO SOLICITANTE
% ---
msocposx =  (p*lx^2)/14.22;  % momento positivo na dire��o x [kNm/m]
msocneg  =  (p*lx^2/8); % momento negativo [kNm/m]
% ---
% MOMENTO RESISTENTE
% ---
mresposx = ((0.68*x4*d) - (0.272*(x4^2)))*bw*fcd;  % momento postivo x [kNm/m]
mresneg = ((0.68*x5*d) - (0.272*(x5^2)))*bw*fcd;   % momento negativo  [kNm/m]
% ---
% RESTRI��ES DE DESIGUALDADE("<=")[g]
% ---
g(1) = msocposx - mresposx; % restri��o do momento em x 
g(2) = msocneg - mresneg;   % restri��o do momento no engaste 
g(3) = x4/d - 0.45; % restri��o superior da linha neutra x
g(4) = x5/d - 0.45; % restri��o superior da linha neutra engaste
g(5) = -x4/d + 0.259; % restri��o inferior da linha neutra x 
g(6) = -x5/d + 0.259; % restri��o inferior da linha neutra engaste
g(7) = x2 - (400*bw*x1); % restri��o da armadura m�xima em x
g(8) = x3 - (400*bw*x1); % restri��o da armadura m�xima em no engaste
g(9) = -x2 + romin*bw*x1*100; % restri��o da armadura m�nima em x
g(10) = -x3 + romin*bw*x1*100; % restri��o da armadura m�nima no engaste
% ---
% RESTRI��ES DE IGUALDADE ("=")[h]
% ---
h(1) = x2 - ((0.85*fcd*bw*0.8*x4)/fyd); % restri��es As - 0.85fcdbwx/fyd
h(2) = x3 - ((0.85*fcd*bw*0.8*x5)/fyd); % restri��es As - 0.85fcdbwx/fyd

% ---
% MOMENTO SOLICITANTE
% ---
msocposx = (p*(lx^2))/8;  % momento positivo na dire��o x [kNm/m]
% ---
% MOMENTO RESISTENTE
% ---
mresposx = ((0.68*x3*d) - (0.272*(x3^2)))*bw*fcd;  % momento postivo x [kNm/m]
% ---
% RESTRI��ES DE DESIGUALDADE("<=")[g]
% ---
g(1) = msocposx - mresposx; % restri��o do momento em x 
g(2) = x3/d - 0.45; % restri��o superior da linha neutra
g(3) = -x3/d + 0.259; % restri��o inferior da linha neutra
g(4) = x2 - (400*bw*x1); % restri��o da armadura m�xima
g(5) = -x2 + romin*bw*x1*100; % restri��o da armadura m�nima
% ---
% RESTRI��ES DE IGUALDADE ("=") [h]
% ---
h(1) = x2 - ((0.85*fcd*bw*x3)/fyd); % Eq. 5.22


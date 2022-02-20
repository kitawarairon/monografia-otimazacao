% ---
% MOMENTO SOLICITANTE
% ---
msocposx = (p*(lx^2))/8;  % momento positivo na direção x [kNm/m]
% ---
% MOMENTO RESISTENTE
% ---
mresposx = ((0.68*x3*d) - (0.272*(x3^2)))*bw*fcd;  % momento postivo x [kNm/m]
% ---
% RESTRIÇÕES DE DESIGUALDADE("<=")[g]
% ---
g(1) = msocposx - mresposx; % restrição do momento em x 
g(2) = x3/d - 0.45; % restrição superior da linha neutra
g(3) = -x3/d + 0.259; % restrição inferior da linha neutra
g(4) = x2 - (400*bw*x1); % restrição da armadura máxima
g(5) = -x2 + romin*bw*x1*100; % restrição da armadura mínima
% ---
% RESTRIÇÕES DE IGUALDADE ("=") [h]
% ---
h(1) = x2 - ((0.85*fcd*bw*x3)/fyd); % Eq. 5.22


% ---
% TABELAS DO MOMENTOS
% ---
% ANEXO "A"
% ---
% MOMENTO SOLICITANTE
% ---
msocposx =  (p*lx^2)/14.22;  % momento positivo na direção x [kNm/m]
msocneg  =  (p*lx^2/8); % momento negativo [kNm/m]
% ---
% MOMENTO RESISTENTE
% ---
mresposx = ((0.68*x4*d) - (0.272*(x4^2)))*bw*fcd;  % momento postivo x [kNm/m]
mresneg = ((0.68*x5*d) - (0.272*(x5^2)))*bw*fcd;   % momento negativo  [kNm/m]
% ---
% RESTRIÇÕES DE DESIGUALDADE("<=")[g]
% ---
g(1) = msocposx - mresposx; % restrição do momento em x 
g(2) = msocneg - mresneg;   % restrição do momento no engaste 
g(3) = x4/d - 0.45; % restrição superior da linha neutra x
g(4) = x5/d - 0.45; % restrição superior da linha neutra engaste
g(5) = -x4/d + 0.259; % restrição inferior da linha neutra x 
g(6) = -x5/d + 0.259; % restrição inferior da linha neutra engaste
g(7) = x2 - (400*bw*x1); % restrição da armadura máxima em x
g(8) = x3 - (400*bw*x1); % restrição da armadura máxima em no engaste
g(9) = -x2 + romin*bw*x1*100; % restrição da armadura mínima em x
g(10) = -x3 + romin*bw*x1*100; % restrição da armadura mínima no engaste
% ---
% RESTRIÇÕES DE IGUALDADE ("=")[h]
% ---
h(1) = x2 - ((0.85*fcd*bw*0.8*x4)/fyd); % restrições As - 0.85fcdbwx/fyd
h(2) = x3 - ((0.85*fcd*bw*0.8*x5)/fyd); % restrições As - 0.85fcdbwx/fyd

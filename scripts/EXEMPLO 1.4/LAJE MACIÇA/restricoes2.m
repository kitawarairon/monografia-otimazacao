% ---
% TABELAS DO MOMENTOS
% ---
% APÊNDICE A
mix = 3.94;
miy = 3.07;
% ---
% MOMENTO SOLICITANTE
% ---
msocposx = (mix*p*(lx^2))/100;  % momento positivo na direção x [kNm/m]
msocposy = (miy*p*(lx^2))/100;  % momento postitivo na direção y [kNm/m]
% ---
% MOMENTO RESISTENTE
% ---
% mres = (0.68*x*d-0.272x^2)*bw*fcd;
mresposx = ((0.68*x4*d) - (0.272*(x4^2)))*bw*fcd;  % momento postivo x [kNm/m]
mresposy = ((0.68*x5*d) - (0.272*(x5^2)))*bw*fcd;  % momento positivo y [kNm/m]
% ---
% RESTRIÇÕES DE DESIGUALDADE("<=")[g]
% ---
g(1) = msocposx - mresposx; % restrição do momento em x
g(2) = msocposy - mresposy; % restrição do momento em y 
g(3) = x4/d - 0.45; % restrição superior da linha neutra
g(4) = x5/d - 0.45; % restrição superior da linha neutra
g(5) = -x4/d + 0.259; % restrição inferior da linha neutra
g(6) = -x5/d + 0.259; % restrição inferior da linha neutra
g(7) = x2 - (400*bw*x1); % restrição da armadura máxima
g(8) = x3 - (400*bw*x1); % restrição da armadura máxima
g(9) = -x2 + romin*bw*x1*100; % restrição da armadura mínima
g(10) = -x3 + romin*bw*x1*100; % restrição da armadura mínima
% ---
% RESTRIÇÕES DE IGUALDADE ("=")[h]
% ---
h(1) = x2 - ((0.85*fcd*bw*0.8*x4)/fyd); % restrições As - 0.85fcdbwx/fyd
h(2) = x3 - ((0.85*fcd*bw*0.8*x5)/fyd); % restrições As - 0.85fcdbwx/fyd
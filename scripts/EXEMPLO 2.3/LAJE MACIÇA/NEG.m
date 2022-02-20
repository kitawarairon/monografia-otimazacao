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
msocposx = (mix*p*(lx^2))/100;  % momento positivo na direção x [kNm/m]
msocneg = (mineg*p*(lx^2))/100; % momento negativo [kNm/m]
msocposy = (miy*p*(lx^2))/100;  % momento postitivo na direção y [kNm/m]
% ---
% MOMENTO RESISTENTE
% ---
mresposx = ((0.68*x5*d) - (0.272*(x5^2)))*bw*fcd;  % momento postivo x [kNm/m]
mresneg = ((0.68*x7*d) - (0.272*(x7^2)))*bw*fcd;   % momento negativo  [kNm/m]
mresposy = ((0.68*x6*d) - (0.272*(x6^2)))*bw*fcd;  % momento positivo y [kNm/m]
% ---
% RESTRIÇÕES DE DESIGUALDADE("<=")
% ---
g(1) = msocposx - mresposx; % restrição do momento solicitante <= momento resistente em x
g(2) = msocneg - mresneg;   % restrição do momento solicitante <= momento resistente no engastE
g(3) = msocposy - mresposy; % restrição do momento solicitante <= momento resistente em y
g(4) = x5/d - 0.45; % restrição superior da linha neutra
g(5) = x6/d - 0.45; % restrição superior da linha neutra
g(6) = x7/d - 0.45; % restrição superior da linha neutra
g(7) = -x5/d + 0.259; % restrição inferior da linha neutra
g(8) = -x6/d + 0.259; % restrição inferior da linha neutra
g(9) = -x7/d + 0.259; % restrição inferior da linha neutra
g(10) = x2 - (400*bw*x1); % restrição da armadura máxima
g(11) = x3 - (400*bw*x1); % restrição da armadura máxima
g(12) = x4 - (400*bw*x1); % restrição da armadura máxima
g(13) = -x2 + romin*bw*x1*100; % restrição da armadura mínima
g(14) = -x3 + romin*bw*x1*100; % restrição da armadura mínima
g(15) = -x4 + romin*bw*x1*100; % restrição da armadura mínima
% ---
% RESTRIÇÕES DE IGUALDADE ("=")
% ---
h(1) = x2 - ((0.85*fcd*bw*0.8*x5)/fyd); % restrições As - 0.85fcdbwx/fyd
h(2) = x3 - ((0.85*fcd*bw*0.8*x6)/fyd); % restrições As - 0.85fcdbwx/fyd
h(3) = x4 - ((0.85*fcd*bw*0.8*x7)/fyd); % restrições As - 0.85fcdbwx/fyd

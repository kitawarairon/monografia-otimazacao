% -----------------------------------------
% NOME DO ARQUIVO: exemplo_nolinear_constrais_24.m
% OTIMIZAÇÃO PARA LAJE MACIÇA
% TRABALHO DE CONCLUSÃO DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONTÉM AS RESTRIÇÕES NÃO-LINEARES
% -----------------------------------------

function [g,h] = exemplo_nolinear_constrains_23(x)
% ---
% VARIÁVEIS DE PROJETO
% ---
% x1 = altura da laje (h) em metros
% x2 = asx1 para l1 em 'cm^2'
% x3 = asy1 para l1 em 'cm^2'
% x4 = asxx para l1 em 'cm^2'
% x5 = xposx altura da linha neutra em metros
% x6 = xposy altura da linha neutra em metros
% x7 = xneg altura da linha neutra em metros

% ---
% RENOMENADO AS VARIÁVEIS DE PROJETO
% ---
x1=x(1);x2=x(2);x3=x(3);x4=x(4);x5=x(5);x6 = x(6);x7 = x(7);

% ---
% DADOS DOS MATERIAIS
% ---
% chamda da função dados de entrada
[rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_23;

d = x1 - dlinha;
% ---
% CARREGAMENTO ÚLTIMO
% ---
% ver pdf [ações nas lajes - item:3]
p = gamaG*(gamaconc*x1 + gamacp*ecp + gamaforro*eforro + cargapiso)... 
    + gamaQ*q; % kN/m^2

% ---
% TABELAS DO MOMENTOS
% ---
% tabela do chust para o [CASO 3]
%LAJE 1
mix = 3.94;
mineg = 8.52;
miy = 3.07;

% ---
% MOMENTO SOLICITANTE
% ---
% Devido a simetria das lajes, considera-se apenas a laje 1
% os valores da laje 2 serão adicionados na função objetivo
msocposx = (mix*p*(lx^2))/100;  % momento positivo na direção x [kNm/m]
msocneg = (mineg*p*(lx^2))/100; % momento negativo [kNm/m]
msocposy = (miy*p*(lx^2))/100;  % momento postitivo na direção y [kNm/m]

% ---
% MOMENTO RESISTENTE
% ---
% mres = (0.68*x*d-0.272x^2)*bw*fcd;
mresposx = ((0.68*x5*d) - (0.272*(x5^2)))*bw*fcd;  % momento postivo x [kNm/m]
mresneg = ((0.68*x7*d) - (0.272*(x7^2)))*bw*fcd;   % momento negativo  [kNm/m]
mresposy = ((0.68*x6*d) - (0.272*(x6^2)))*bw*fcd;  % momento positivo y [kNm/m]

% ---
% RESTRIÇÕES DE DESIGUALDADE("<=")
% ---
g(1) = msocposx - mresposx; % restrição do momento solicitante <= momento resistente em x h.1
g(2) = msocneg - mresneg;   % restrição do momento solicitante <= momento resistente no engast  e h.2 %
g(3) = msocposy - mresposy; % restrição do momento solicitante <= momento resistente em y h.3
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
% h -> restrições de igualdade
% restrições h.1, h.2, h.3
h(1) = x2 - ((0.85*fcd*bw*0.8*x5)/fyd); % restrições As - 0.85fcdbwx/fyd
h(2) = x3 - ((0.85*fcd*bw*0.8*x6)/fyd); % restrições As - 0.85fcdbwx/fyd
h(3) = x4 - ((0.85*fcd*bw*0.8*x7)/fyd); % restrições As - 0.85fcdbwx/fyd
% 

%
end

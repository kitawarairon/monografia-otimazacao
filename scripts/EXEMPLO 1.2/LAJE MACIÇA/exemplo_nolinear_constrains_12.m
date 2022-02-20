% -----------------------------------------
% NOME DO ARQUIVO: exemplo_nolinear_constrais_14.m
% OTIMIZAÇÃO PARA LAJE MACIÇA
% TRABALHO DE CONCLUSÃO DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONTÉM AS RESTRIÇÕES NÃO-LINEARES
% -----------------------------------------

function [g,h] = exemplo_nolinear_constrains_12(x)
% ---
% VARIÁVEIS DE PROJETO
% ---
% x1 = altura da laje (h) em metros
% x2 = asx1 para l1 em 'cm^2'
% x3 = asy1 para l1 em 'cm^2'
% x4 = xposx altura da linha neutra em metros
% x5 = xposy altura da linha neutra em metros


% ---
% RENOMENADO AS VARIÁVEIS DE PROJETO
% ---
x1=x(1);x2=x(2);x3=x(3);

% ---
% DADOS DOS MATERIAIS
% ---
% chamda da função dados de entrada
[rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_12;

d = x1 - dlinha;
% ---
% CARREGAMENTO ÚLTIMO
% ---
% ver pdf [ações nas lajes - item:3]
p = gamaG*(gamaconc*x1 + gamacp*ecp + gamaforro*eforro + cargapiso)... 
    + gamaQ*q; % kN/m^2

% ---
% MOMENTO SOLICITANTE
% ---
% Devido a simetria das lajes, considera-se apenas a laje 1
% os valores da laje 2 serão adicionados na função objetivo
%LAJE 1
msocposx = (p*(lx^2))/8;  % momento positivo na direção x [kNm/m]


% ---
% MOMENTO RESISTENTE
% ---
% mres = (0.68*x*d-0.272x^2)*bw*fcd;
mresposx = ((0.68*x3*d) - (0.272*(x3^2)))*bw*fcd;  % momento postivo x [kNm/m]


% ---
% RESTRIÇÕES DE DESIGUALDADE("<=")
% ---
g(1) = msocposx - mresposx; % restrição do momento em x h.1
g(2) = x3/d - 0.45; % restrição superior da linha neutra
g(3) = -x3/d + 0.259; % restrição inferior da linha neutra
g(4) = x2 - (400*bw*x1); % restrição da armadura máxima
g(5) = -x2 + romin*bw*x1*100; % restrição da armadura mínima



% ---
% RESTRIÇÕES DE IGUALDADE ("=")
% ---
% h -> restrições de igualdade
% restrições h.1, h.2, h.3
h(1) = x2 - ((0.85*fcd*bw*x3)/fyd); % restrições As - 0.85fcdbwx/fyd
% 

%
end

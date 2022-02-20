% -----------------------------------------
% NOME DO ARQUIVO: exemplo_nolinear_constrais_14.m
% OTIMIZA��O PARA LAJE MACI�A
% TRABALHO DE CONCLUS�O DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONT�M AS RESTRI��ES N�O-LINEARES
% -----------------------------------------

function [g,h] = exemplo_nolinear_constrains_14(x)
% ---
% VARI�VEIS DE PROJETO
% ---
% x1 = altura da laje (h) em metros
% x2 = asx1 para l1 em 'cm^2'
% x3 = asy1 para l1 em 'cm^2'
% x4 = xposx altura da linha neutra em metros
% x5 = xposy altura da linha neutra em metros


% ---
% RENOMENADO AS VARI�VEIS DE PROJETO
% ---
x1=x(1);x2=x(2);x3=x(3);x4=x(4);x5=x(5);

% ---
% DADOS DOS MATERIAIS
% ---
% chamda da fun��o dados de entrada
[rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_14;

d = x1 - dlinha;
% ---
% CARREGAMENTO �LTIMO
% ---
% ver pdf [a��es nas lajes - item:3]
p = gamaG*(gamaconc*x1 + gamacp*ecp + gamaforro*eforro + cargapiso)... 
    + gamaQ*q; % kN/m^2

% ---
% TABELAS DO MOMENTOS
% ---
% tabela do chust para o [CASO 3]
%LAJE 1
mix = 3.94;
miy = 3.07;

% ---
% MOMENTO SOLICITANTE
% ---
% Devido a simetria das lajes, considera-se apenas a laje 1
% os valores da laje 2 ser�o adicionados na fun��o objetivo
%LAJE 1
msocposx = (mix*p*(lx^2))/100;  % momento positivo na dire��o x [kNm/m]
msocposy = (miy*p*(lx^2))/100;  % momento postitivo na dire��o y [kNm/m]

% ---
% MOMENTO RESISTENTE
% ---
% mres = (0.68*x*d-0.272x^2)*bw*fcd;
mresposx = ((0.68*x4*d) - (0.272*(x4^2)))*bw*fcd;  % momento postivo x [kNm/m]
mresposy = ((0.68*x5*d) - (0.272*(x5^2)))*bw*fcd;  % momento positivo y [kNm/m]

% ---
% RESTRI��ES DE DESIGUALDADE("<=")
% ---
g(1) = msocposx - mresposx; % restri��o do momento em x h.1
g(2) = msocposy - mresposy; % restri��o do momento em y h.3
g(3) = x4/d - 0.45; % restri��o superior da linha neutra
g(4) = x5/d - 0.45; % restri��o superior da linha neutra
g(5) = -x4/d + 0.259; % restri��o inferior da linha neutra
g(6) = -x5/d + 0.259; % restri��o inferior da linha neutra
g(7) = x2 - (400*bw*x1); % restri��o da armadura m�xima
g(8) = x3 - (400*bw*x1); % restri��o da armadura m�xima
g(9) = -x2 + romin*bw*x1*100; % restri��o da armadura m�nima
g(10) = -x3 + romin*bw*x1*100; % restri��o da armadura m�nima


% ---
% RESTRI��ES DE IGUALDADE ("=")
% ---
% h -> restri��es de igualdade
% restri��es h.1, h.2, h.3
h(1) = x2 - ((0.85*fcd*bw*0.8*x4)/fyd); % restri��es As - 0.85fcdbwx/fyd
h(2) = x3 - ((0.85*fcd*bw*0.8*x5)/fyd); % restri��es As - 0.85fcdbwx/fyd
% 

%
end

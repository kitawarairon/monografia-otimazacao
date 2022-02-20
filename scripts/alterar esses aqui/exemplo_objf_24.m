% -----------------------------------------
% NOME DO ARQUIVO: exemplo_objf_24.m
% OTIMIZAÇÃO PARA LAJE MACIÇA
% TRABALHO DE CONCLUSÃO DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONTÉM A FUNÇÃO CUSTO
% -----------------------------------------

function f=exemplo_objf_24(x)
% ---
% VARIÁVEIS DE PROJETO
% ---
%x1 = h em 'm'
%x2 = asx1 para l1 em 'cm^2'
%x3 = asy1 para l1 em 'cm^2'
%x4 = asxx para l1 em 'cm^2'

% ---
% RENOMEANDO AS VARÁVEIS DE PROJETO
% ---
x1=x(1);x2=x(2);x3 =x(3); x4=x(4);
% ---
% DADOS DE ENTRADA
% ---
[rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_24;

% ---
% PESO DO AÇO E CUSTO DO AÇO
% ---
lx_cm = lx*100;
ly_cm = ly*100;
%[2*Asx*lx]-> volume/metro
s1 = (2*x2*lx_cm*ly) + (2*x3*ly_cm*lx); % para armaduras no meio da laje
s2 = (0.5*x4*lx_cm*ly); % para armadura no engaste
s3 = s1 + s2;
wstell = (s3*rhostell)/(1e6); %kg

% ---
% VOLME DE CONCRETO
% ---
% multiplicando por 2 para contabilizar as duas lajes
vconc = 2*lx*ly*x1; %m^3

% ---
% FUNÇÃO DE OBJETIVO
f = (C1*wstell + C2*vconc); %custo
% ---

%
end

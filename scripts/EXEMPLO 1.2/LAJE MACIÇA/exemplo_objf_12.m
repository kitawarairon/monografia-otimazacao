% -----------------------------------------
% NOME DO ARQUIVO: exemplo_objf_12.m
% OTIMIZAÇÃO PARA LAJE MACIÇA
% TRABALHO DE CONCLUSÃO DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONTÉM A FUNÇÃO CUSTO
% -----------------------------------------

function f=exemplo_objf_12(x)
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
x1=x(1);x2=x(2);x3 =x(3);
% ---
% DADOS DE ENTRADA
% ---
[rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_12;

bviga= 14; % cm - largura da viga
c_cm = c*100; % cm - cobrimento

% ---
% PESO DO AÇO E CUSTO DO AÇO
% ---
% comprimento da barras positivas
lx_cm = (lx*100 + bviga -2*c_cm );
ly_cm = (ly*100 + bviga -2*c_cm );
s1 = (x2*lx_cm*ly) + ly_cm*lx*100*romin*bw*x1; % para armaduras no meio da laje


wstell = (s1*rhostell)/(1e6); %kg

% ---
% VOLME DE CONCRETO
% ---
% multiplicando por 2 para contabilizar as duas lajes
vconc = lx*ly*x1 - (s1/1e6); %m^3

% ---
% FUNÇÃO DE OBJETIVO
f = (C1*wstell + C2*vconc); %custo
% ---

%
end

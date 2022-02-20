% -----------------------------------------
% NOME DO ARQUIVO: exemplo_objf_14.m
% OTIMIZAÇÃO PARA LAJE MACIÇA
% TRABALHO DE CONCLUSÃO DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONTÉM A FUNÇÃO CUSTO
% -----------------------------------------

function f=exemplo_objf_14(x)
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
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_14;

bviga= 14; % cm - largura da viga
c_cm = c*100; % cm - cobrimento

% ---
% PESO DO AÇO E CUSTO DO AÇO
% ---
% comprimento da barras positivas
lx_cm = (lx*100 + bviga -2*c_cm );
ly_cm = (ly*100 + bviga -2*c_cm );
s1 = (x2*lx_cm*ly) + (x3*ly_cm*lx); % para armaduras no meio da laje


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

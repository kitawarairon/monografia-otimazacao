% -----------------------------------------
% NOME DO ARQUIVO: exemplo_objf_23.m
% OTIMIZAÇÃO PARA LAJE MACIÇA
% TRABALHO DE CONCLUSÃO DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONTÉM A FUNÇÃO CUSTO
% -----------------------------------------

function f=exemplo_objf_23(x)
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
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_23;

bviga= 14; % cm - largura da viga
c_cm = c*100; % cm - cobrimento

% ---
% PESO DO AÇO E CUSTO DO AÇO
% ---
% comprimento da barras positivas
lx_cm = (lx*100 + bviga -2*c_cm );
ly_cm = (ly*100 + bviga -2*c_cm );
s1 = (2*x2*lx_cm*ly) + (2*x3*ly_cm*lx); % volume para armaduras no meio da laje
%     2 > contabilazar as armaduras nas mesmas lajes

% comprimetno das barras negativas
% dados de entrada para ancoragem da barra negativa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fctd = (0.21*(fck^(2/3)))/1.4;
n1 = 2.25; %hipoteses
n2 = 1; %hipoteses
n3 = 1; %hipoteses
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fbd = fctd*n1*n2*n3; % fbd
di_cm = di*100; % conversão do diâmetro inicial 
lb = 2*((di_cm*500)/(4*fbd)); % comprimento de ancoragem
lg = 2*(x1-2*c_cm); % comprimento do gancho vertical
lchust = 2*(0.25*lx_cm); % comprimento aplicado no chust
lneg = lchust +  lg + lb; % comprimento total da armadura negativa
s2 = x4*lneg*ly; % cálculo do volume total
wstell = ((s1 + s2)*rhostell)/(1e6); %kg
                                                                                                                                                                                                                                                    
% ---
% VOLME DE CONCRETO
% ---
% multiplicando por 2 para contabilizar as duas lajes
vconc = (2*lx*ly*x1 - ((s1+s2)/1e6)); %m^3

% ---
% FUNÇÃO DE OBJETIVO
f = (C1*wstell + C2*vconc); %custo
% ---

%
end

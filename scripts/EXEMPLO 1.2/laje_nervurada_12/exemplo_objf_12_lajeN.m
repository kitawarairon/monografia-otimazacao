%nome do arquivo: exemplo_objf_12.m
%função objetivo do exemplo_12
%trabalho de conclusão de curso
%Este arquivo contém a função objetivo
%Pedro Kitawara

function f=exemplo_objf_12_lajeN(x)
% ---
% RENOMEANDO AS VARÁVEIS DE PROJETO
% ---
x1=x(1);%x2=x(2);

% ---
% DADOS DE ENTRADA
% ---

[C1,rhostell,fck,gamac,C2,fyk,gamas,gamaconc,gamacp... 
    ,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N;

%implementar o custo do eps ?????

% ---
% DADOS DA SEÇÃO
% ---
dlinha = c + di; %m altura útil
d = x1 - dlinha; %altura útil

% ---
% ÁREA DE AÇO
% ---
% VIGOTA TB-6545
% TABELA BELGO GRUPO ARCELOR
dinf = di*100;
as = 2*((pi*dinf^2)/4);

% ---
% QUANTIDADE DE NERVURAS
% ---
nner = ly/bf;

% ---
% PESO DO AÇO E CUSTO DO AÇO
% ---
lx_cm = lx*100;
wstell = (as*lx_cm*rhostell)/1e6; %kg

% ---
% VOLME DE CONCRETO
% ---
vconc =((hf*bf) + (x1-hf)*bw)*lx; %m^3

% ---
% FUNÇÃO DE OBJETIVO
% ---
%f = (C1*wstell + C2*vconc); %custo
f = nner*(C2*vconc + C1*wstell);
% ---

%
end

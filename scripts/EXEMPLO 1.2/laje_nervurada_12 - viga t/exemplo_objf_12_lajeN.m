% nome do arquivo: exemplo_objf_12.m
% fun��o objetivo do exemplo_12
% trabalho de conclus�o de curso
% Este arquivo cont�m a fun��o objetivo
% 

function f=exemplo_objf_12_lajeN(x)
% ---
% RENOMEANDO AS VAR�VEIS DE PROJETO
% ---
x1=x(1); x2=x(2);

% ---
% DADOS DE ENTRADA
% ---

[C1,rhostell,fck,romin,gamac,C2,fyk,gamas,gamaconc,gamacp... 
    ,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N;

% ---
% DADOS DA SE��O
% ---
dlinha = c + di; %m altura �til
d = x1 - dlinha; %altura �til

% ---
% �REA DE A�O
% ---


% ---
% QUANTIDADE DE NERVURAS
% ---
nner = ly/bf; % quantidade de nervuras

bviga= 14; % cm - largura da viga
c_cm = c*100; % cm - cobrimento

% ---
% PESO DO A�O E CUSTO DO A�O
% ---
lx_cm = lx*100 + bviga - 2*c_cm; % [cm] - transforma��o de unidade
wstell = (x2*lx_cm*rhostell)/1e6; % [kg] para uma nervura 

% ---
% VOLME DE CONCRETO
% ---
vconc =((hf*bf) + (x1-hf)*bw)*lx - ((x2*lx_cm)/1e6); % [m^3] para uma nervura

% ---
% VOLUME DO EPS
% ---
veps = (bf-bw)*(x1-hf)*lx; % m^3
c3 = 427.40; % R$/m^3

% ---
% FUN��O DE OBJETIVO
% ---
f = nner*(C2*vconc + C1*wstell + veps*c3); % custo total para todas as nervuras

% ---
%
end

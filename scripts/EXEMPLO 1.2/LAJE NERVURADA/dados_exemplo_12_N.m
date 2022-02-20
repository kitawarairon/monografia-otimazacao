%DADOS DE ENTRADA PARA LAJE NERVURADA
%exemplo 1.2

function [C1,C2,rhostell,fck,gamac,fyk,gamas,gamaconc,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hw,q,gamaG,gamaQ] = dados_exemplo_12_N

% ---
% CUSTOS DO MATERIAIS
% ---
C1 = 7.92; %R$/kg CUSTO DO KG DO A�O
C2 = 320; %R$/m^3 CUSTO DO M^3 DO CONCRETO  
rhostell = 7860; %kg/m^3 MASSA ESPEC�FICA DO A�O

% ---
% CONCRETO
% ---
fck = 35; %MPA RESIST�NCIA CARACTER�STICA DO CONCRETO
gamac = 1.4; %coeficiente de minora��o do concreto
%NOTA PARA SA�DA EM METROS PRECISA MULTIPLICAR O FCK POR 1000


% ---
% A�O
% ---
fyk = 50; %kN/cm^2 TENS�O DE ESCOAMENTO DO A�O
gamas = 1.15; %coeficiente de minora��o do a�o

% ---
% PESO ESPEC�FICO DOS MATERIAIS - NBR 6120
% ---
gamaconc = 25; %kN/m^3 PESO ESPEC�FICO DO CONCRETO
gamacp = 21; %kN/m^3 PESO ESPEC�FICO DO CONTRA-PISO
gamaforro = 19; %kN/m^3 PESO ESPEC�FICO DO FORRO

% ---
% ALTURAS DO CARREGAMENTO PERMANENTE
% ---
ecp = 4/100; %m espessura do contra-piso
eforro = 4/100; %m espesura do forro 

% ---
% CARGA PISO
% ---
cargapiso = 0.20; %kN/m2

% ---
% DADOS DA GEOMETRIA DA LAJE E SE��O
% ---
lx = 4; %m menor lado da laje
ly = 8; %m maior lado da laje
c = 1.5/100; %m cobrimento
di = 5/1000; %m  di�metro inicial
bw = 12/100; %m viga unit�ria
bf = 40/100; %m largura da mesa
hw = 8/100;  %m altura da alma 

% ---
% CARGA ACIDENTAL
% ---
q = 2.5; %kN/m^2

% ---
% COEFICIENTES DE PONDERA��O DAS A��ES
% ---
gamaG = 1.4;
gamaQ = 1.4;
%
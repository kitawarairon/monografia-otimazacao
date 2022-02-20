%DADOS DE ENTRADA PARA LAJE NERVURADA
%exemplo 1.2

function [C1,C2,rhostell,fck,gamac,fyk,gamas,gamaconc,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hw,q,gamaG,gamaQ] = dados_exemplo_12_N

% ---
% CUSTOS DO MATERIAIS
% ---
C1 = 7.92; %R$/kg CUSTO DO KG DO AÇO
C2 = 320; %R$/m^3 CUSTO DO M^3 DO CONCRETO  
rhostell = 7860; %kg/m^3 MASSA ESPECÍFICA DO AÇO

% ---
% CONCRETO
% ---
fck = 35; %MPA RESISTÊNCIA CARACTERÍSTICA DO CONCRETO
gamac = 1.4; %coeficiente de minoração do concreto
%NOTA PARA SAÍDA EM METROS PRECISA MULTIPLICAR O FCK POR 1000


% ---
% AÇO
% ---
fyk = 50; %kN/cm^2 TENSÃO DE ESCOAMENTO DO AÇO
gamas = 1.15; %coeficiente de minoração do aço

% ---
% PESO ESPECÍFICO DOS MATERIAIS - NBR 6120
% ---
gamaconc = 25; %kN/m^3 PESO ESPECÍFICO DO CONCRETO
gamacp = 21; %kN/m^3 PESO ESPECÍFICO DO CONTRA-PISO
gamaforro = 19; %kN/m^3 PESO ESPECÍFICO DO FORRO

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
% DADOS DA GEOMETRIA DA LAJE E SEÇÃO
% ---
lx = 4; %m menor lado da laje
ly = 8; %m maior lado da laje
c = 1.5/100; %m cobrimento
di = 5/1000; %m  diâmetro inicial
bw = 12/100; %m viga unitária
bf = 40/100; %m largura da mesa
hw = 8/100;  %m altura da alma 

% ---
% CARGA ACIDENTAL
% ---
q = 2.5; %kN/m^2

% ---
% COEFICIENTES DE PONDERAÇÃO DAS AÇÕES
% ---
gamaG = 1.4;
gamaQ = 1.4;
%
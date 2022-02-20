%DADOS DE ENTRADA PARA LAJE NERVURADA
%exemplo 1.2

function [C1,rhostell,fck,romin,gamac,C2,fyk,gamas,gamaconc,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N

% ---
% CUSTOS DO MATERIAIS
% ---
C1 = 6.062; % R$/kg CUSTO DO KG DO A�O 
rhostell = 7850; % kg/m^3 MASSA ESPEC�FICA DO A�O
% 6.062

% ---
% CONCRETO
% ---
fck = 50; %MPA RESIST�NCIA CARACTER�STICA DO CONCRETO
gamac = 1.4; %coeficiente de minora��o do concreto
%NOTA PARA SA�DA EM METROS PRECISA MULTIPLICAR O FCK POR 1000

if fck == 20
    romin = 0.150;
    C2 = 330.56;
elseif fck == 25
    romin = 0.150;
    C2 = 356.4;
elseif fck == 30
    romin = 0.150;
    C2 = 383.88;
elseif fck == 35
    romin = 0.164;
    C2 = 409.93;
elseif fck == 40
    romin = 0.179;
    C2 = 424.62;
elseif fck == 45
    romin = 0.194;
    C2 = 453.57; %C2 DESCONEHCIDO
elseif fck == 50;
    romin = 0.208;
    C2 = 477.74; %C2 DESCONHECIDO
end 


% ---
% A�O
% ---
fyk = 50; % kN/cm^2 TENS�O DE ESCOAMENTO DO A�O
gamas = 1.15; %coeficiente de minora��o do a�o

% ---
% PESO ESPEC�FICO DOS MATERIAIS - NBR 6120
% ---
gamaconc = 25; % kN/m^3 PESO ESPEC�FICO DO CONCRETO
gamacp = 21; % kN/m^3 PESO ESPEC�FICO DO CONTRA-PISO
gamaforro = 19; % kN/m^3 PESO ESPEC�FICO DO FORRO

% ---
% ALTURAS DO CARREGAMENTO PERMANENTE
% ---
ecp = 4/100; %m
eforro = 4/100; %m

% ---
% CARGA PISO
% ---
cargapiso = 0.20; % carregamento do piso

% ---
% DADOS DA GEOMETRIA DA LAJE E SE��O
% ---
lx = 7; % m menor lado da laje 
ly = 7; % m maior lado da laje
c = 2.5/100; % m cobrimento
di = 10/1000; % m  di�metro inicial
bw = 18/100; % m largura da alma
bf = 25/100; % m largura da mesa
hf = 4/100; % altura da mesa

% ---
% CARGA ACIDENTAL
% ---
q = 2.5; %kN/m^2

% ---
% COEFICIENTES
% ---
gamaG = 1.4;
gamaQ = 1.4;
%
% -----------------------------------------
% NOME DO ARQUIVO: exemplo_objf_14.m
% OTIMIZA��O PARA LAJE MACI�A
% TRABALHO DE CONCLUS�O DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONT�M OS DADOS DE ENTRADA
% -----------------------------------------

function [rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_14;
rhostell = 7850; %kg/m^3 MASSA ESPEC�FICA DO A�O

% ---
% CONCRETO
% ---
fck = 50;%MPA RESIST�NCIA CARACTER�STICA DO CONCRETO
gamac = 1.4; %coeficiente de minora��o do concreto
fcd = (fck/gamac)*1000;
%NOTA PARA SA�DA EM METROS PRECISA MULTIPLICAR O FCK POR 1000


% ---
% A�O
% ---
fyk = 50; %kN/cm^2 TENS�O DE ESCOAMENTO DO A�O
gamas = 1.15; %coeficiente de minora��o do a�o
fyd = fyk/gamas; %

% ---
% PESO ESPEC�FICO DOS MATERIAIS - NBR 6120
% ---
gamaconc = 25; %kN/m^3 PESO ESPEC�FICO DO CONCRETO
gamacp = 21; %kN/m^3 PESO ESPEC�FICO DO CONTRA-PISO
gamaforro = 19; %kN/m^3 PESO ESPEC�FICO DO FORRO

% ---
% ALTURAS DO CARREGAMENTO PERMANENTE
% ---
ecp = 4/100; %m
eforro = 4/100; %m

% ---
% CARGA PISO
% ---
cargapiso = 0.20;

% ---
% DADOS DA GEOMETRIA DA LAJE E SE��O
% ---
lx = 7; %m menor lado da laje
ly = 7; %m maior lado da laje
c = 2.5/100; %m cobrimento
di = 8/1000; %m  di�metro inicial
bw = 1; %m viga unit�ria

% ---
% CARGA ACIDENTAL
% ---
q = 2.5; %kN/m^2

% ---
% COEFICIENTES
% ---
gamaG = 1.4;
gamaQ = 1.4;

% ---
% RHOmin
% ---
%PARA O C�LCULO DA ARMADURA M�NIMA
%Amin = bw*h*romin = (1 m)(x1 m)
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

if di == 6.3/1000;
    C1 = 6.4062;
elseif di == 8.0/1000;
    C1 = 6.4062;
elseif di == 10.0/1000;
    C1 = 6.4062;
elseif di == 12.5/1000;
    C1 = 6.062;
elseif di == 16.0/1000;
    C1 = 6.4062;
end

% ---
% ALTURA �TIL
% ---
% lembrete
% PARA LA1D 0.5
% PARA LA2D 1.5
dlinha = c + 1.5*di; %m altura �til

    



%
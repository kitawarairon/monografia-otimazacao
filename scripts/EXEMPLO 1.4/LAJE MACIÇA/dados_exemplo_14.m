% -----------------------------------------
% NOME DO ARQUIVO: exemplo_objf_14.m
% OTIMIZAÇÃO PARA LAJE MACIÇA
% TRABALHO DE CONCLUSÃO DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONTÉM OS DADOS DE ENTRADA
% -----------------------------------------

function [rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_14;
rhostell = 7850; %kg/m^3 MASSA ESPECÍFICA DO AÇO

% ---
% CONCRETO
% ---
fck = 50;%MPA RESISTÊNCIA CARACTERÍSTICA DO CONCRETO
gamac = 1.4; %coeficiente de minoração do concreto
fcd = (fck/gamac)*1000;
%NOTA PARA SAÍDA EM METROS PRECISA MULTIPLICAR O FCK POR 1000


% ---
% AÇO
% ---
fyk = 50; %kN/cm^2 TENSÃO DE ESCOAMENTO DO AÇO
gamas = 1.15; %coeficiente de minoração do aço
fyd = fyk/gamas; %

% ---
% PESO ESPECÍFICO DOS MATERIAIS - NBR 6120
% ---
gamaconc = 25; %kN/m^3 PESO ESPECÍFICO DO CONCRETO
gamacp = 21; %kN/m^3 PESO ESPECÍFICO DO CONTRA-PISO
gamaforro = 19; %kN/m^3 PESO ESPECÍFICO DO FORRO

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
% DADOS DA GEOMETRIA DA LAJE E SEÇÃO
% ---
lx = 7; %m menor lado da laje
ly = 7; %m maior lado da laje
c = 2.5/100; %m cobrimento
di = 8/1000; %m  diâmetro inicial
bw = 1; %m viga unitária

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
%PARA O CÁLCULO DA ARMADURA MÍNIMA
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
% ALTURA ÚTIL
% ---
% lembrete
% PARA LA1D 0.5
% PARA LA2D 1.5
dlinha = c + 1.5*di; %m altura útil

    



%